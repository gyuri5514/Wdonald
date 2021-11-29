package com.wdelivery.store.service;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public ArrayList<ChartVO> getResponsiveChart(ChartVO chart) {
		return chartDAO.getResponsiveChart(chart);
	}

	@Override
	public ArrayList<ChartVO> getPieChart(ChartVO c) {
		return chartDAO.getPieChart(c);
	}

	@Override
	public List<ChartVO> getSalesRank(ChartVO c) {
		return chartDAO.getSalesRank(c);
	}

	@Override
	public List<ChartVO> getUserGender(ChartVO chartVO) {
		return chartDAO.getUserGender(chartVO);
	}

}
