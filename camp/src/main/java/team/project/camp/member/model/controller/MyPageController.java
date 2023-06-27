package team.project.camp.member.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.board.model.vo.Board;
import team.project.camp.detail.model.service.CampDetailService;
import team.project.camp.detail.model.vo.Reservation;
import team.project.camp.detail.model.vo.Review;
import team.project.camp.member.model.service.MemberService;
import team.project.camp.member.model.service.MyPageService;
import team.project.camp.member.model.vo.Member;
@Slf4j
@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})   // memberController의 loginMember 를 가져옴.
public class MyPageController {

	@Autowired
	private CampDetailService service;

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	//예약조회
	@GetMapping("/myReservation")
	public String reservation(Model model,
				@ModelAttribute("loginMember") Member loginMember ,
				RedirectAttributes ra
			) {
			String Manager = loginMember.getManager();
		if ( loginMember != null && Manager.equals("N")) {   // 로그인이 됐을때. 목록뽑기  .
			int memberNo = loginMember.getMemberNo();
			List<Reservation> reservationList = service.reservationSelect(memberNo);

			model.addAttribute("reservationList", reservationList);

			return "mypage/myReservation";

		}else if(loginMember != null && Manager.equals("Y")){

			List<Reservation> AllreservationList = service.AllreservationSelect();
			System.out.println(AllreservationList+"zzzzzzzzzzzzz");
			log.info(AllreservationList + "zzzzzzzzzzz");
			model.addAttribute("AllreservationList", AllreservationList);

		return "mypage/myReservation";

		}

		else { 		// 로그인이 안됐을때 .

			ra.addFlashAttribute("message","로그인을 해주세요. ");
			return "redirect:/";
		}
	}

	@GetMapping("/myBoard")
	public String myBoard(Model model,
						  @ModelAttribute("loginMember") Member loginMember) {

		List<Board> boardList = new ArrayList<>();
		
		if((loginMember.getManager()).equals("Y")) {
			boardList = myPageService.selectAllBoard();
		} else {
			boardList = myPageService.selectMyBoard(loginMember.getMemberNo());	
		}

		model.addAttribute("boardList", new Gson().toJson(boardList));

		return "mypage/myBoard";
	}

	@GetMapping("/myReview")
	public String myReview() {
		return "mypage/myReview";
	}

	@GetMapping("/profile")
	public String profile() {
		return "mypage/profile";
	}

	@GetMapping("/changePw")
	public String changePw() {
		return "mypage/changePw";
	}


	@GetMapping("/secession")
	public String secession() {
		return "mypage/secession";

	}

	@ResponseBody
	@GetMapping("/selectMyReview")
	public String myReview(Model model,
							@ModelAttribute("loginMember") Member loginMember) {

		List<Review> rList = new ArrayList<>();
		
		if( (loginMember.getManager()).equals("Y") ) {
			rList = myPageService.selectAllReview();
		} else {
			rList = myPageService.selectMyReplyList(loginMember.getMemberNo());	
		}

		return new Gson().toJson(rList);
	}

	//예약취소
	@ResponseBody
	@PostMapping("/reservationState")
	public int reservationState(int reservNo) {

		System.out.println("예약번호 : " + reservNo);

		int result = service.reservationState(reservNo);

		return result;
	}

	//매니저용 예약확정
	@ResponseBody
	@PostMapping("/reservationConfirm")
	public int reservationConfirm(int reservNo) {

		System.out.println("예약확정할 예약번호 : " + reservNo);

		int result = service.reservationConfirm(reservNo);

		return result;

	}

	// 회원 정보 수정
	@PostMapping("/info")
	public String updateInfo(@ModelAttribute("loginMember") Member loginMember,
							 @RequestParam Map<String, Object> paramMap,
							// 요청 시 전달된 파라미터를 구분하지 않고 모두 Map에 담아서 얻어옴
							 String[] updateAddress,
							 RedirectAttributes ra) {

		String message = null;

		// 파라미터를 저장한 paramMap 에 회원 번호, 주소를 추가
		String memberAddress = String.join(",,", updateAddress);

		// 주소가 미입력 되었을 때
		if(memberAddress.equals(",,,,")) memberAddress = null;

		paramMap.put("memberNo", loginMember.getMemberNo());
		paramMap.put("memberAddress", memberAddress);

		// 닉네임 중복 체크
		int result = memberService.nicknameDupCheck((String)paramMap.get("updateNickname"));

		// 회원 정보 수정 서비스 호출
		if(result == 0) {
			result = myPageService.updateInfo(paramMap);
		} else if(result > 0) {

			if( (loginMember.getMemberNickname()).equals(paramMap.get("updateNickname")) ) {
				result = myPageService.updateInfo(paramMap);
			} else result = -1;

		}

		if(result > 0) {
			message = "회원 정보가 수정되었습니다.";

			// DB - Session 의 회원 정보 동기화
			loginMember.setMemberNickname( (String)paramMap.get("updateNickname") );
			loginMember.setMemberTel( (String)paramMap.get("updateTel") );
			loginMember.setMemberAddress( (String)paramMap.get("memberAddress") );

		} else if(result == -1) message = "중복된 닉네임입니다.";
		else message = "회원 정보 수정 실패";

		ra.addFlashAttribute("message", message);

		return "redirect:profile";
	}

	// 비밀번호 변경 (암호화)
	@PostMapping("/changePw")
	public String changePw(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam Map<String, Object> paramMap,
			 				RedirectAttributes ra) {

		paramMap.put("memberNo", loginMember.getMemberNo());

		String message = null;


		int result = myPageService.changePw(paramMap);

		if(result > 0) {

			message = "비밀번호가 변경되었습니다";

			loginMember.setMemberPw(bcrypt.encode( (String)paramMap.get("newPw") ));

		} else message = "현재 비밀번호가 일치하지 않습니다.";


		ra.addFlashAttribute("message", message);

		return "redirect:changePw";
	}


	// 회원 탈퇴 (세션, 쿠키 무효화)
	@PostMapping("/secession")
	public String doSecession(@ModelAttribute("loginMember") Member loginMember,
								RedirectAttributes ra,
								SessionStatus status,
							  	HttpServletRequest req,
							  	HttpServletResponse resp) {

		String path = null;
		String message = null;

		int result = myPageService.doSecession(loginMember);

		if(result > 0 ) { // 회원 탈퇴 성공 시

			path = "/";
			message = "회원 탈퇴되었습니다";

			// 세션 초기화
			status.setComplete();

			// 쿠키 없애기
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);

		} else { // 회원 탈퇴 실패 시
			path = "secession";
			message = "비밀번호가 일치하지 않습니다.";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:" + path;
	}

	// 프로필 이미지 수정
	@PostMapping("/profileImage")
	public String updateProfile(@ModelAttribute("loginMember") Member loginMember,
								@RequestParam("uploadImage") MultipartFile uploadImage, /* 업로드 파일 */
								@RequestParam Map<String, Object> map, /* delete 담겨있음(삭제 버튼) */
								HttpServletRequest req, /* 파일 저장 경로 탐색용 */
								RedirectAttributes ra) throws IOException {

		// 경로 작성하기
		// 1) 웹 접근 경로 ( /comm/resources/images/memberProfile/ )
		String webPath = "/resources/images/memberProfile/";

		// 2) 서버 저장 폴더 경로
		// C:\workspace\7_Framework\comm\src\main\webapp\resources\images\memberProfile
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		// map 에 경로 2개, uploadImage, delete, 회원번호 담기
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("memberNo", loginMember.getMemberNo());

		int result = myPageService.updateProfile(map);

		String message = null;

		if(result > 0) {
			message = "프로필 이미지가 변경되었습니다";
			loginMember.setProfileImage( (String)map.get("profileImage") );
		} else {
			message = "프로필 이미지 변경 실패";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:profile";
	}
}
