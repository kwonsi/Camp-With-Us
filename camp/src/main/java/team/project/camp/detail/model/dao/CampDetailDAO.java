package team.project.camp.detail.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.detail.model.vo.Reservation;
import team.project.camp.detail.model.vo.Review;


@Repository
public class CampDetailDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 가격계산
	//성수기
	public int selectPriceP(String month) {
		return sqlSession.selectOne("campDetailMapper.selectPriceP", month);
	}
	//비성수기
	public int selectPriceNp(String month) {
		return sqlSession.selectOne("campDetailMapper.selectPriceNp", month);
	}


	//예약정보 삽입(무통장 입금)
	public int reservationInfoCash(Reservation reservation) {
		return sqlSession.insert("campDetailMapper.reservationInfoCash", reservation);
	}

	// 예약정보 삽입(카드결제)
	public int reservationInfoCard(Reservation reservation) {

		return sqlSession.insert("campDetailMapper.reservationInfoCard", reservation);
	}

	//예약 조회
	public List<Reservation> reservationSelect(int memberNo) {
		return sqlSession.selectList("campDetailMapper.reservationSelect",memberNo);
	}
	// 관리자용 예약 조회
	public List<Reservation> AllreservationSelect(){
		return sqlSession.selectList("campDetailMapper.AllreservationSelect");
	}

	//예약취소
	public int reservationState(int reservNo) {
		return sqlSession.update("campDetailMapper.reservationState", reservNo);
	}

	// 매니저용 예약확정
	public int reservationConfirm(int reservNo) {

		return sqlSession.update("campDetailMapper.reservationConfirm", reservNo);
	}

	// 리뷰 목록 조회
	public List<Review> selectReplyList(int campNo) {
		return sqlSession.selectList("campDetailMapper.selectReplyList", campNo);
	}

	// 리뷰 작성
	public int insertReview(Review review) {
		return sqlSession.insert("campDetailMapper.insertReview", review);
	}

	// 리뷰 삭제
	public int deleteReview(int reviewNo) {
		return sqlSession.update("campDetailMapper.deleteReview", reviewNo);
	}

	// 리뷰 수정
	public int updateReview(Map<String, Object> map) {
		return sqlSession.update("campDetailMapper.updateReview", map);
	}

	// 리뷰 작성을 위한 예약 내역 조회
	public int memberReservList(Map<String, Object> map) {
		return sqlSession.selectOne("campDetailMapper.memberReservList", map);
	}


}