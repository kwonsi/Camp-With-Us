package team.project.camp.member.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import team.project.camp.detail.model.service.ReservationService;
import team.project.camp.detail.model.vo.Reservation;

@Controller
@RequestMapping("/member/myPage")
public class MyPageController {

	@Autowired
	private ReservationService service;

	@GetMapping("/myReservation")
	public String reservation(Model model) {
		
		List<Reservation> reservationList = service.reservationSelect();
		
		model.addAttribute("reservationList", reservationList);
		
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
	
}
