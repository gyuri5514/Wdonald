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
		System.out.println("selectWinMorning");
		return winMorningDAO.selectWinMorning();
	}

	@Override
	public WinMorningVO detailMorning(Integer w_code) {
		System.out.println("detailWinMorning");
		return winMorningDAO.detailMorning(w_code);
	}
}
