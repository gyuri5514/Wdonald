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
		System.out.println("selectSide");
		return sideDAO.selectSide();
	}

	@Override
	public SideVO detailSide(Integer s_code) {
		System.out.println("detailSide");
		return sideDAO.detailSide(s_code);
	}

}
