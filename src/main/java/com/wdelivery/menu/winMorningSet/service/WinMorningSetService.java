package com.wdelivery.menu.winMorningSet.service;

import java.util.List;

import com.wdelivery.menu.winMorningSet.vo.WinMorningSetVO;

public interface WinMorningSetService {

	public List<WinMorningSetVO> selectWinMorningSet();

	public WinMorningSetVO detailMorningSet(Integer w_code);

	public void insertWinMorningSet(WinMorningSetVO winMorningSetVO);
}
