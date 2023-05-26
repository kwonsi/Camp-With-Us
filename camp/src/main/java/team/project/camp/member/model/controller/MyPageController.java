package team.project.camp.member.model.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.detail.model.service.ReservationService;
import team.project.camp.detail.model.vo.Reservation;

@Slf4j
@Controller
@RequestMapping("/member/myPage")
public class MyPageController {

	@Autowired
	private ReservationService service;

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

	
	//-------------------------------------------------------------------------------
	
	
	// 예약내역 조회
	@PostMapping("/myReservation")
	public String reservationSelect(Model model) {
		
		List<Reservation> reservationList = service.reservationSelect();
		
		model.addAttribute("reservationList", reservationList);
		
		//System.out.println("예약내역 : " + reservationList.get(2));
		return "member/myReservation";
	}
	
	
	
//	@PostMapping("/myReservation")
//	public String reservationSelect() {
//		
//		Map<String, Object> map = null; 
//		
//		map = service.reservationSelect();
//		
//		//log.info(map.get(campingName));
//		
//		return "/myReservation";
//	}
	
	
	
}
