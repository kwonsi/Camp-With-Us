package team.project.camp.member.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/myPage")
public class MyPageController {

	@GetMapping("/reservation")
	public String reservation() {
		return "member/reservation"; 
	}
}
