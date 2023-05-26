package team.project.camp.member.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/myPage")
public class MyPageController {

<<<<<<< HEAD

	@GetMapping("/myReservation")
	public String reservation() {
		return "member/myReservation"; 
	}
	
	@GetMapping("/myBoard")
	public String myBoard() {
		return "member/myBoard"; 
	}
	
	@GetMapping("/myReview")
	public String myReview() {
		return "member/myReview"; 
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "member/profile"; 
	}
	
	@GetMapping("/changePw")
	public String changePw() {
		return "member/changePw"; 
	}
	
	
	@GetMapping("/secession")
	public String secession() {
		return "member/secession"; 

	}

=======
	@GetMapping("/reservation")
	public String reservation() {
		return "member/reservation"; 
	}
>>>>>>> eunju
}
