package team.project.camp.member.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.detail.model.service.CampDetailService;
import team.project.camp.detail.model.vo.Reservation;
import team.project.camp.member.model.vo.Member;
@Slf4j
@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})   // memberController의 loginMember 를 가져옴.
public class MyPageController {

	@Autowired
	private CampDetailService service;

	//예약조회
	@GetMapping("/myReservation")
	public String reservation(Model model,
				@ModelAttribute("loginMember") Member loginMember ,
				RedirectAttributes ra
			) {
		
		if ( loginMember != null ) {   // 로그인이 됐을때. 목록뽑기  . 
			String memberNickname = loginMember.getMemberNickname();
			List<Reservation> reservationList = service.reservationSelect(memberNickname);
			
		model.addAttribute("reservationList", reservationList);

		return "mypage/myReservation"; 
		
		}else { 		// 로그인이 안됐을때 . 
			
			ra.addFlashAttribute("message","로그인을 해주세요. ");
			return "redirect:/";
		}
	}

	@GetMapping("/myBoard")
	public String myBoard() {
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

	//예약취소
	@ResponseBody
	@PostMapping("/reservationState")
	public int reservationState(int reservNo) {

		System.out.println("예약번호 : " + reservNo);

		int result = service.reservationState(reservNo);

		return result;
	}



}
