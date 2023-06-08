package team.project.camp.detail.model.service;
import java.util.List;

import team.project.camp.detail.model.vo.Reservation;
import team.project.camp.detail.model.vo.Review;

public interface CampDetailService {

	//가격계산
	//성수기
	int selectPriceP(String month);
	//비성수기
	int selectPriceNp(String month);

	//예약정보 삽입
	int reservationInfo(Reservation reservation);

	//예약조회
	List<Reservation> reservationSelect(int memberNo);

	//예약취소
	int reservationState(int reservNo);
	
	// 리뷰 목록 조회
	List<Review> selectReplyList(int campNo);
	
	// 리뷰 작성
	String insetReview(Review review);
	

}
