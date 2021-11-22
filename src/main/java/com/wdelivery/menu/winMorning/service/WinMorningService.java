package com.wdelivery.menu.winMorning.service;

import java.util.List;

import com.wdelivery.menu.winMorning.vo.WinMorningVO;

public interface WinMorningService {
	
	public List<WinMorningVO> selectWinMorning();

	public WinMorningVO detailMorning(Integer w_code);
	
	public void insertWinMorning(WinMorningVO winMorningVO);
}
