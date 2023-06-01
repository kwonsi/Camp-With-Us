package team.project.camp.member.model.controller;

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
	
	//----------------------------
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
			
		} else {
		
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/";
	}
	
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout( /*HttpSession session,*/
						SessionStatus status) {

		logger.info("로그아웃 수행됨");
		
		status.setComplete(); // 세센이 할 일이 완료됨 -> 없앰
		
		return "redirect:/"; // 메인페이지 리다이렉트
		
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