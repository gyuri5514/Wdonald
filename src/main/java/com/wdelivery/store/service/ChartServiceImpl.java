package com.wdelivery.store.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.store.chart.dao.ChartDAO;
import com.wdelivery.store.chart.vo.ChartVO;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private ChartDAO chartDAO;
	
	@Override
	public ArrayList<ChartVO> getinitialChart(ChartVO chartVO) {
		return chartDAO.getInitialChart(chartVO);
	}

}