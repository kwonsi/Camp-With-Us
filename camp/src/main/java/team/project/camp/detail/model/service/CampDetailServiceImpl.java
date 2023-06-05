package team.project.camp.detail.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
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
	public List<Reservation> reservationSelect() {
		return dao.reservationSelect();
	}

	//예약취소
	@Override
	public int reservationState(int reservNo) {
		return dao.reservationState(reservNo);
	}


	@Override
	public List<Review> selectReplyList(int campNo) {
		return dao.selectReplyList(campNo);
	}
}