package team.project.camp.detail.model.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import team.project.camp.detail.model.service.ReservationService;


@Controller
@RequestMapping("/campDetail")
public class ReservationController {

	@Autowired
	private ReservationService service;

	//예약하기 페이지 조회
	@GetMapping("/reservation")
	public String ReservationSelect() {

		return "common/reservation";
	}


	//가격계산
	//***@ResponseBody -> (비동기)ajax TYPE="GET"일때 
	//*****(ajax 통신을 위해 JSON 형식의 데이터를 주고는 경우 사용)***** 
	@ResponseBody
	@GetMapping("/selectPrice")
	public int selectPrice() {

		int price = service.selectPrice();

		return price;
	}
	
	
	//결제
	/*  $.ajax({
        url: "paymentConfirm",
        type: "POST",
        dataType: "json",
        data: {"rsp" : JSON.stringify(rsp)}
	 */
//	@ResponseBody
//	@PostMapping("/paymentConfirm")
//	public int paymentConfirm(HttpServletRequest req) {
//		
//		int result = 0;
//		
//		Gson gson = new Gson();
//		
//		String[] rsp = req.getParameterValues("rsp");
//		
//		String rsp2 = gson.toJson(rsp);
//		
//		String[] rsp3 = gson.fromJson(rsp2, String[].class);
//		
//		
//		
//		return result;
//	}
//	
	
	

}
