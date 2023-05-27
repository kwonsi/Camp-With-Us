package team.project.camp.detail.model.dao;

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

	//예약정보
	public int reservationInfo(Reservation reservation) {
		return sqlSession.insert("reservationMapper.reservationInfo", reservation);
	}

}