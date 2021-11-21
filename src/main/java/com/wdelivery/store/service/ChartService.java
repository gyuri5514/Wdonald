package com.wdelivery.store.service;

import java.util.ArrayList;

import com.wdelivery.store.chart.vo.ChartVO;

public interface ChartService {


	ArrayList<ChartVO> getinitialChart(ChartVO c);

	ArrayList<ChartVO> getResponsiveChart(ChartVO chart);

	ArrayList<ChartVO> getPieChart(ChartVO c);

}
