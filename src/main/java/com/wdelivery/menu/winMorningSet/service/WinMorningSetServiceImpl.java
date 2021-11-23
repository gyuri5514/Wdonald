package com.wdelivery.menu.winMorningSet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.winMorningSet.dao.WinMorningSetDAO;
import com.wdelivery.menu.winMorningSet.vo.WinMorningSetVO;

@Service
public class WinMorningSetServiceImpl implements WinMorningSetService{
	
	@Autowired
	private WinMorningSetDAO winMorningSetDAO;
	
	@Override
	public List<WinMorningSetVO> selectWinMorningSet() {
		return winMorningSetDAO.selectWinMorningSet();
	}

	@Override
	public WinMorningSetVO detailMorningSet(Integer w_code) {
		return winMorningSetDAO.detailMorningSet(w_code);
	}

	@Override
	public void insertWinMorningSet(WinMorningSetVO winMorningSetVO) {
		winMorningSetDAO.insertWinMorningSet(winMorningSetVO);
	}

	@Override
	public int wcodeCheck(int w_code) {
		int result = winMorningSetDAO.wcodeCheck(w_code);
		return result;
	}

}
