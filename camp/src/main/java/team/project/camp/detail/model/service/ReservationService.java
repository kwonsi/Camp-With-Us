package team.project.camp.detail.model.service;
import java.util.List;
import java.util.Map;

import team.project.camp.detail.model.vo.Reservation;

public interface ReservationService {

	//가격계산
	int selectPrice();

	//예약정보
	int reservationInfo(Reservation reservation);

	//Map<String, Object> reservationSelect();

	List<Reservation> reservationSelect();

}
