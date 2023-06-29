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

	//예약정보 삽입(무통장입금)
	@Override
	public int reservationInfoCash(Reservation reservation) {
		return dao.reservationInfoCash(reservation);
	}

	// 카드결제
	@Override
	public int reservationInfoCard(Reservation reservation) {
		return dao.reservationInfoCard(reservation);
	}


	//예약조회
	@Override
	public List<Reservation> reservationSelect(int memberNo) {
		return dao.reservationSelect(memberNo);
	}

	// 모든 예약 조회(매니저)
	@Override
	public List<Reservation> AllreservationSelect(){
		return dao.AllreservationSelect();
	}

	//예약취소
	@Override
	public int reservationState(int reservNo) {
		return dao.reservationState(reservNo);
	}
	//매니저용 예약확정
	@Override
	public int reservationConfirm(int reservNo) {
		return dao.reservationConfirm(reservNo);
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
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

	// 리뷰 수정
	@Override
	public int updateReview(Map<String, Object> map) {
		return dao.updateReview(map);
	}

	// 리뷰 작성을 위한 예약 내역 조회
	@Override
	public int memberReservList(Map<String, Object> map) {
		return dao.memberReservList(map);
	}

}