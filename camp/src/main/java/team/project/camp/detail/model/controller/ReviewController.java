package team.project.camp.detail.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import team.project.camp.detail.model.service.CampDetailService;
import team.project.camp.detail.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private CampDetailService service;
	
	// 리뷰 목록 조회
	@ResponseBody
	@GetMapping("/selectReplyList")
	public String selectReplyList(int campNo) {
		
		List<Review> rList = service.selectReplyList(campNo);
		
		return new Gson().toJson(rList);
	}
	
	// 리뷰 작성
	@PostMapping("/insertReview")
	@ResponseBody
	public String insertReview(Review review) {
		return service.insetReview(review);
	}
}
