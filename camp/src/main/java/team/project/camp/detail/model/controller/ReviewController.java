package team.project.camp.detail.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import team.project.camp.detail.model.service.CampDetailService;
import team.project.camp.detail.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private CampDetailService service;
	
	// 댓글 목록 조회
	@GetMapping("/selectReplyList")
	public String selectReplyList(int campNo) {
		
		List<Review> rList = service.selectReplyList(campNo);
		
		return new Gson().toJson(rList);
	}
}
