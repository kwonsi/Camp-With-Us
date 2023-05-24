package team.project.camp.detail.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.detail.model.dao.ReservationDAO;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;

	@Override
	public int selectPrice() {
		return dao.selectPrice();
	}
	
	
	
	
}