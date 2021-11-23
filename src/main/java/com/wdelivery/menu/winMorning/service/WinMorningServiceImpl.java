package com.wdelivery.menu.winMorning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.winMorning.dao.WinMorningDAO;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;

@Service
public class WinMorningServiceImpl implements WinMorningService {

	@Autowired
	public WinMorningDAO winMorningDAO;

	@Override
	public List<WinMorningVO> selectWinMorning() {
		return winMorningDAO.selectWinMorning();
	}

	@Override
	public WinMorningVO detailMorning(Integer w_code) {
		return winMorningDAO.detailMorning(w_code);
	}

	@Override
	public void insertWinMorning(WinMorningVO winMorningVO) {
		winMorningDAO.insertWinMorning(winMorningVO);
	}

	@Override
	public int wcodeCheck(int w_code) {
		int result = winMorningDAO.wcodeCheck(w_code);
		return result;
	}
}
