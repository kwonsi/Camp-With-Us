package team.project.camp.detail.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.detail.model.dao.ReservationDAO;
import team.project.camp.detail.model.vo.Reservation;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;

	/**
	 *가격계산
	 */
	@Override
	public int selectPrice() {
		return dao.selectPrice();
	}

	/**
	 *예약정보
	 */
	@Override
	public int reservationInfo(Reservation reservation) {
		return dao.reservationInfo(reservation);
	}




}