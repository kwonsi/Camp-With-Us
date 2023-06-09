package team.project.camp.detail.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.common.Util;
import team.project.camp.detail.model.dao.CampDetailDAO;
import team.project.camp.detail.model.vo.Reservation;
import team.project.camp.detail.model.vo.Review;

@Slf4j
@Service
public class CampDetailServiceImpl implements CampDetailService {

	@Autowired
	private CampDetailDAO dao;

	//가격계산
	//성수기
	@Override
	public int selectPriceP(String month) {
		return dao.selectPriceP(month);
	}

	//비성수기
	@Override
	public int selectPriceNp(String month) {
		return dao.selectPriceNp(month);
	}

	//예약정보 삽입
	@Override
	public int reservationInfo(Reservation reservation) {
		return dao.reservationInfo(reservation);
	}

	//예약조회
	@Override
	public List<Reservation> reservationSelect(int memberNo) {
		return dao.reservationSelect(memberNo);
	}

	//예약취소
	@Override
	public int reservationState(int reservNo) {
		return dao.reservationState(reservNo);
	}


	// 리뷰 목록 조회
	@Override
	public List<Review> selectReplyList(int campNo) {
		return dao.selectReplyList(campNo);
	}
	
	// 리뷰 작성
	@Override
	public int insetReview(Review review) {
		
		// XSS, 개행문자 처리
		review.setReviewContents( Util.XSSHandling( review.getReviewContents()) );
		review.setReviewContents( Util.newLineHandling( review.getReviewContents()) );
				
		return dao.insertReview(review);
	}
	
	// 리뷰 삭제
	@Override
	public int deleteReview(int replyNo) {
		return dao.deleteReview(replyNo);
	}
	
	// 리뷰 수정
	@Override
	public int updateReview(Map<String, Object> map) {
		return dao.updateReview(map);
	}
	
}