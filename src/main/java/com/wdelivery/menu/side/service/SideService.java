package com.wdelivery.menu.side.service;

import java.util.List;

import com.wdelivery.menu.side.vo.SideVO;

public interface SideService {
	
	public List<SideVO> selectSide();
	
	SideVO detailSide(Integer s_code);

}
