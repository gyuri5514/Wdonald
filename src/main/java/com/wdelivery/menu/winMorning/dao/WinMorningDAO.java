package com.wdelivery.menu.winMorning.dao;

import java.util.List;

import com.wdelivery.menu.winMorning.vo.WinMorningVO;

public interface WinMorningDAO {

	public List<WinMorningVO> selectWinMorning();
	
	public WinMorningVO detailMorning(Integer w_code);
	
	public void insertWinMorning(WinMorningVO winMorningVO);
}
