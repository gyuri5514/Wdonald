package com.wdelivery.menu.side.dao;

import java.util.List;

import com.wdelivery.menu.side.vo.SideVO;

public interface SideDAO {
	
	public List<SideVO> selectSide();
	
	SideVO detailSide(int side_code);

}
