package team.project.camp.detail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.detail.model.vo.Reservation;


@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 가격계산
	public int selectPrice() {
		return sqlSession.selectOne("reservationMapper.selectPrice");
	}
 
	//예약정보 삽입
	public int reservationInfo(Reservation reservation) {
		return sqlSession.insert("reservationMapper.reservationInfo", reservation);
	}

	//예약 조회
	public List<Reservation> reservationSelect() {
		return sqlSession.selectList("reservationMapper.reservationSelect");
	}

	//예약취소
	public int reservationState(int reservNo) {
		return sqlSession.update("reservationMapper.reservationState", reservNo);
	}



}