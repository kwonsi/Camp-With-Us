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


	//예약정보 삽입
	public int reservationInfo(Reservation reservation) {
		return sqlSession.insert("campDetailMapper.reservationInfo", reservation);
	}

	//예약 조회
	public List<Reservation> reservationSelect(int memberNo) {
		return sqlSession.selectList("campDetailMapper.reservationSelect",memberNo);
	}

	//예약취소
	public int reservationState(int reservNo) {
		return sqlSession.update("campDetailMapper.reservationState", reservNo);
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
	public int deleteReview(int replyNo) {
		return sqlSession.update("campDetailMapper.deleteReview", replyNo);
	}

	// 리뷰 수정
	public int updateReview(Map<String, Object> map) {
		return sqlSession.update("campDetailMapper.updateReview", map);
	}


}