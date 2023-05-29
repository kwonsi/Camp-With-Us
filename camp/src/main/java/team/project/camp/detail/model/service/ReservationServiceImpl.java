package team.project.camp.detail.model.service;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;
=======
import java.util.List;
>>>>>>> a781cfd01bb173f264eea633926f011cae432ee6

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

//	@Override
//	public Map<String, Object> reservationSelect() {
//
//		Map<String, Object> map = new HashMap<>();
//		
//		dao.reservationSelect();
//		return map;
//	}
<<<<<<< HEAD

	//예약확인 
	@Override
	public List<Reservation> reservationSelect() {
		return dao.reservationSelect();
	}

=======
>>>>>>> a781cfd01bb173f264eea633926f011cae432ee6

	//예약확인 
	@Override
	public List<Reservation> reservationSelect() {
		return dao.reservationSelect();
	}


}