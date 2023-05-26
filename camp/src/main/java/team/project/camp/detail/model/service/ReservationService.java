package team.project.camp.detail.model.service;

import team.project.camp.detail.model.vo.Reservation;

public interface ReservationService {

	//가격계산
	int selectPrice();

	//예약정보
	int reservationInfo(Reservation reservation);

}
