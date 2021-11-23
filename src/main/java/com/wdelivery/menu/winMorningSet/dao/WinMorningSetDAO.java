package com.wdelivery.menu.winMorningSet.dao;

import java.util.List;

import com.wdelivery.menu.winMorningSet.vo.WinMorningSetVO;

public interface WinMorningSetDAO {

	public List<WinMorningSetVO> selectWinMorningSet();

	public WinMorningSetVO detailMorningSet(Integer w_code);

	public void insertWinMorningSet(WinMorningSetVO winMorningSetVO);
	
	int wcodeCheck (int w_code);
}
