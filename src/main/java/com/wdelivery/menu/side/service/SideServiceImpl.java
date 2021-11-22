package com.wdelivery.menu.side.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.side.dao.SideDAO;
import com.wdelivery.menu.side.vo.SideVO;

@Service
public class SideServiceImpl implements SideService {

	@Autowired
	public SideDAO sideDAO;
	
	@Override
	public List<SideVO> selectSide() {
		return sideDAO.selectSide();
	}

	@Override
	public SideVO detailSide(Integer s_code) {
		return sideDAO.detailSide(s_code);
	}

	@Override
	public void insertSide(SideVO sideVO) {
		sideDAO.insertSide(sideVO);
	}

}
