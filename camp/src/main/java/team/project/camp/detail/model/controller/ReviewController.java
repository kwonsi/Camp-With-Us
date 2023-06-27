package team.project.camp.detail.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.detail.model.service.CampDetailService;
import team.project.camp.detail.model.vo.Review;

@Slf4j
@RestController
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private CampDetailService service;

	// 리뷰 목록 조회
	@GetMapping("/selectReplyList")
	public String selectReplyList(int campNo) {

		List<Review> rList = service.selectReplyList(campNo);

		return new Gson().toJson(rList);
	}

	// 리뷰 작성
	@PostMapping("/insert")
	public int insertReview(Review review
			) {
		log.info("별점 " + review.getCampRate());

		String message = "";

		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", review.getMemberNo());
		map.put("campName", review.getCampName());

		int result = service.memberReservList(map);

		if(result > 0) {
			return service.insetReview(review);
		} else {
			return result;
		}


	}

	// 리뷰 삭제
	@GetMapping("/delete")
	public int deleteReview( int reviewNo) {
		return service.deleteReview(reviewNo);
	}

	// 리뷰 수정
	@PostMapping("/update")
	public int updateReview(int reviewNo, String reviewContents, int campRate) {

		Map<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("reviewContents", reviewContents);
		map.put("campRate", campRate);

		return service.updateReview(map);
	}

}
