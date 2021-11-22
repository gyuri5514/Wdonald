package com.wdelivery.store.chart.dao;

import java.util.ArrayList;
import java.util.List;

import com.wdelivery.store.chart.vo.ChartVO;

public interface ChartDAO {
	ArrayList<ChartVO> getInitialChart(ChartVO chartVO);
	ArrayList<ChartVO> getResponsiveChart(ChartVO chart);
	ArrayList<ChartVO> getPieChart(ChartVO c);
	List<ChartVO> getSalesRank(ChartVO c);
}
