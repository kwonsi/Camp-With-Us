package team.project.camp.detail.model.service;
import java.util.List;

import team.project.camp.detail.model.vo.Reservation;

public interface ReservationService {

	//가격계산
	int selectPrice();

	//예약정보 삽입
	int reservationInfo(Reservation reservation);

	//예약조회
	List<Reservation> reservationSelect();

	//예약취소
	int reservationState(int reservNo);

}
