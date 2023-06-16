package team.project.camp.member.model.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.camp.member.model.service.MemberService;
import team.project.camp.member.model.vo.Member;

@Controller // 생성된 bean이 Contorller임을 명시 + bean 등록
@RequestMapping("/member")
@SessionAttributes({"loginMember"}) // Model에 추가된 값의 key와 어노테이션에 작성된 값이 같으면
									// 해당 값을 session scope 이동시키는 역할*/
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired // bean으로 등록된 객체 중 타입이 같거나, 상속 관계인 bean을 주입 해주는 역할
	private MemberService service;   // -> 의존성 주입(DI, Dependency Injection)


	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}

	@GetMapping("/signUp")

	public String signUpPage() {
		return "member/signUp";
	}
	// 아이디/비밀번호 찾기
	@GetMapping("/findIdPw")
	public String findIdPw() {
		return "member/findIdPw";
	}
	//----------------------------


	// 임시 비밀번호 생성 함수
	public String getRamdomPassword(int len) {
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
				'U', 'V', 'W', 'X', 'Y', 'Z'
				};
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		logger.info("charSet.length : "+charSet.length);

		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			// 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			logger.info("idx : "+idx);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

	//----------------------구글로그인 start----------------------------------
	@ResponseBody
	@PostMapping("/googleLoginInfo")
	public int googleLoginInfo( @ModelAttribute Member googleKakaoMember,
								String memberEmail, String memberNickname,
								Model model,
								HttpServletResponse resp,
								HttpServletRequest req) {

		logger.info("memberEmail : " + memberEmail);
		logger.info("memberNickname : " + memberNickname);

		Member member = new Member();
		member.setMemberEmail(memberEmail);
		member.setMemberNickname(memberNickname);

		System.out.println("googleMember :  " + googleKakaoMember);

		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기

		Member googleLoginMember = service.googleKakaoLogin(googleKakaoMember);

		System.out.println("googleLoginMember :  " + googleLoginMember);

		int loginCheck = 0;

		if(googleLoginMember == null) { // 로그인 성공 시 (로그인정보 조회 성공 시)

			int result = service.googleKakaoInsert(member);
			if(result>0) {
				logger.info("구글 로그인 정보 DB 삽입 성공");
				Member googleLoginMember2 = service.googleKakaoLogin(googleKakaoMember);
				model.addAttribute("loginMember", googleLoginMember2);
			}else {
				logger.info("구글 로그인 정보 DB 삽입 실패");
			}


		} else {	//로그인정보 조회 실패 시 DB에 구글로그인 정보 삽입(구글아이디로 처음 로그인시)

			int result = service.googleKakaoEmailCheck(googleKakaoMember);  // 이메일,닉네임값으로 select 다시돌린다.

			if ( result > 0 ) {   // 이메일,닉네임값으로 select 성공시

				logger.info("기존 로그인 실행 ");

				model.addAttribute("loginMember", googleLoginMember); // == req.setAttribute("loginMember", loginMember);

				loginCheck = 0;
				return loginCheck;
			} else {
				logger.info("중복회원입니다.");
				loginCheck = 1;
				return loginCheck;
			}
		}

		return loginCheck;

	}
	//----------------------구글로그인 end----------------------------------



	//----------------------카카오로그인 start----------------------------------
	@ResponseBody
	@PostMapping("/kakaoLoginInfo")
	public int kakaoLoginInfo(@ModelAttribute Member googleKakaoMember,
								String memberEmail,
								String memberNickname,
								Model model,
								 RedirectAttributes ra,
								HttpServletResponse resp,
								HttpServletRequest req) {
		logger.info("memberNickname : " + memberNickname);

		Member member = new Member();
		member.setMemberNickname(memberNickname);
		member.setMemberEmail(memberEmail);

		System.out.println("kakaoMember :  " + googleKakaoMember);

		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기
		Member kakaoLoginMember = service.googleKakaoLogin(googleKakaoMember);

		System.out.println("kakaoLoginMember :  " + kakaoLoginMember);


		int loginCheck = 0;
		if ( kakaoLoginMember == null ) {
			int result = service.googleKakaoInsert(member);
			if(result>0) {
				logger.info("카카오 로그인 정보 DB 삽입 성공");
				Member kakaoLoginMember2 = service.googleKakaoLogin(googleKakaoMember);
				model.addAttribute("loginMember", kakaoLoginMember2);
				loginCheck = 0;
				return loginCheck;
			}else {
				logger.info("카카오 로그인 정보 DB 삽입 실패");
			}
		} else {  // 안에 같은이메일이 존재할때.
			int result = service.googleKakaoEmailCheck(googleKakaoMember);  // 이메일,닉네임값으로 select 다시돌린다.

			if ( result > 0 ) {   // 이메일,닉네임값으로 select 성공시

				logger.info("기존 로그인 실행 ");
				model.addAttribute("loginMember", kakaoLoginMember);
				loginCheck = 0;
				return loginCheck;
			} else {
				logger.info("중복회원입니다.");
				loginCheck = 1;
				return loginCheck;
			}
		}
		return loginCheck;
	}

	//----------------------카카오로그인 end----------------------------------



	//----------------------일반로그인 start----------------------------------
	@PostMapping("/login")
	public String login( @ModelAttribute Member inputMember
						, Model model
						, RedirectAttributes ra
						, HttpServletResponse resp
						, HttpServletRequest req
						, @RequestParam(value="saveId", required = false) String saveId ) {

		logger.info("로그인 기능 수행됨");


		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기
		Member loginMember = service.login(inputMember);


		if(loginMember != null) { // 로그인 성공 시
			model.addAttribute("loginMember", loginMember); // == req.setAttribute("loginMember", loginMember);

			// 로그인 성공 시 무조건 쿠키 생성
			// 단, 아이디 저장 체크 여부에 따라서 쿠기의 유지 시간을 조정
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());

			if(saveId != null) { // 아이디 저장이 체크 되었을 때

				cookie.setMaxAge(60 * 60 * 24 * 365); // 초 단위로 지정 (1년)

			} else { // 체크 되지 않았을 때
				cookie.setMaxAge(0); // 0초 -> 생성 되자마자 사라짐 == 쿠키 삭제
			}

			// 쿠키가 적용될 범위(경로) 지정
			cookie.setPath(req.getContextPath());

			// 쿠키를 응답 시 클라이언트에게 전달
			resp.addCookie(cookie);

			return "redirect:/";

		} else {

			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");

			return "redirect:/member/login";
		}


	}
	//----------------------일반로그인 end----------------------------------

	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {

		logger.info("로그아웃 수행됨");

		status.setComplete(); // 세센이 할 일이 완료됨 -> 없앰

		return "redirect:/"; // 메인페이지 리다이렉트

	}

	// 아이디 찾기
	@PostMapping("/findId")
	public String findId(String memberTel, RedirectAttributes ra) {

		List<String> idList = service.findId(memberTel);

		logger.info("id : " + idList);
		
		String id = "";
		
		for(int i=0; i<idList.size(); i++) {
			
			if( i == idList.size() - 1 ) id += idList.get(i);
			else id += idList.get(i) + " / ";
			
		}
		
		ra.addFlashAttribute("message", "회원님의 ID는 " + id + " 입니다");

		return "redirect:/member/findIdPw";
	}


	// 비밀번호 찾기(임시 비밀번호 설정)
	@PostMapping("/findPw")
	public String findPw(String memberEmail, RedirectAttributes ra) {

		String randomPassword = getRamdomPassword(8);

		int result=0;

	    String subject = "임시 비밀번호가 발급되었습니다."; //제목
	    String content =
	    	"<p>안녕하세요 고객님!<br>발급된 임시 비밀번호는"
	    	+ randomPassword
	    	+"입니다.<br>로그인하고 비밀번호를 변경해주세요.</p>"; //본문
	    String from = "camping@camp.com"; //보내는사람 이메일주소
	    String to = memberEmail;

	    try {
	        MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");

	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(subject);
	        mailHelper.setText(content, true);
	        // html태그를 사용하려면 true
	        mailSender.send(mail);

	        result=1;

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

//	    if(result > 0) {
//
//	    	Member member = new Member();
//	    	member.setMemberEmail(memberEmail);
//	    	member.setMemberPw(randomPassword);
//
//	    	result = service.setTempPassword(member);
//
//	    	if(result > 0) {
//	    		ra.addFlashAttribute("message", "가입하신 이메일로 임시 비밀번호가 전송되었습니다."
//						+ "비밀번호를 변경해주세요");
//
//	    	}
//	    	else return "임시 비밀번호 설정 오류";
//
//	    } else return "메일 발송 오류";

	    Member member = new Member();
    	member.setMemberEmail(memberEmail);
    	member.setMemberPw(randomPassword);

    	result = service.setTempPassword(member);

    	if(result > 0) {
    		logger.info("임시 비밀번호 : " + randomPassword);

    		ra.addFlashAttribute("message", "가입하신 이메일로 임시 비밀번호가 전송되었습니다."
				+ "비밀번호를 변경해주세요");
    	}
		return "redirect:/member/login"; // 메일 발송 성공 시 임시 비밀번호 반환
	}


	// 이메일 중복 검사
	@ResponseBody  // ajax 응답 시 사용!
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(String memberEmail) {

		int result = service.emailDupCheck(memberEmail);

		return result;

	}


	//이메일 인증 번호 보내기
	@Autowired
	private JavaMailSender mailSender;
	/*@Autowired
	private EmailSendService emailService;*/


	// mailSending 코드
	@GetMapping("/sendEmail")
	@ResponseBody
	public int mailSending(String inputEmail) {
		//뷰에서 넘어왔는지 확인
		System.out.println("이메일 전송 시험");

		//난수 생성(인증번호)
		Random r = new Random();
		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
		System.out.println("인증번호:" + num);

		/* 이메일 보내기 */
        String setFrom = "ilypsj@gmail.com"; //보내는 이메일
        String toMail = inputEmail; //받는 사람 이메일
        String title = "캠핑보내조 회원가입 인증 이메일 입니다.";
        String content =
                "캠핑보내조 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" +
                "인증 번호는 " + num + "입니다." +
                "<br>" +

                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);

        }catch(Exception e) {
            e.printStackTrace();
        }

        //String rnum = Integer.toString(num);  //view로 다시 반환할 때 String만 가능

        return num;
	}

	// 닉네임 중복 검사
	@ResponseBody
	@GetMapping("/nicknameDupCheck")
	public int nicknameDupCheck(String memberNickname) {
		int result = service.nicknameDupCheck(memberNickname);

		return result;

	}

	// 회원 가입
	@PostMapping("/signUp")
	public String signUp( Member inputMember
						, String[] memberAddress
						, RedirectAttributes ra) {


		inputMember.setMemberAddress(  String.join(",,", memberAddress)  );

		if( inputMember.getMemberAddress().equals(",,,,") ) { // 주소가 입력되지 않은 경우

			inputMember.setMemberAddress(null); // null로 변환
		}

		// 회원 가입 서비스 호출
		int result = service.signUp(inputMember);

		String message = null;
		String path = null;

		if(result > 0) { // 회원 가입 성공
			message = "회원 가입 성공";
			path = "redirect:/"; // 메인페이지

		}else { // 실패
			message = "회원 가입 실패";
			path = "redirect:/member/signUp"; // 회원 가입 페이지
		}

		ra.addFlashAttribute("message", message);
		return path;
	}

	// 회원 컨트롤러에서 발생하는 모든 예외를 모아서 처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();

		model.addAttribute("errorMessage", "서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);

		return "common/error";
	}

}