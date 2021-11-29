package com.wdelivery.store.service;

import java.util.ArrayList;
import java.util.List;

import com.wdelivery.member.vo.UserVO;
import com.wdelivery.store.chart.vo.ChartVO;

public interface ChartService {


	ArrayList<ChartVO> getinitialChart(ChartVO c);

	ArrayList<ChartVO> getResponsiveChart(ChartVO chart);

	ArrayList<ChartVO> getPieChart(ChartVO c);

	List<ChartVO> getSalesRank(ChartVO c);
	
	List<ChartVO> getUserGender(ChartVO chartVO);

}
