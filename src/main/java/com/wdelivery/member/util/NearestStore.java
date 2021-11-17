package com.wdelivery.member.util;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;

public class NearestStore {
	public  AdminVO whichOneIsNearest(List<AdminVO> storeList,
			double c_lat,double c_lon) {
		AdminVO av = null;
		for(int i = 0 ; i < storeList.size(); i ++) {
			for(int j = 0 ; j<storeList.size()-i-1; j++) {
				if(returnDistance(c_lat, c_lon, storeList.get(j).getStore_lat(),storeList.get(j).getStore_lon())
						>returnDistance(c_lat, c_lon, storeList.get(j+1).getStore_lat(),storeList.get(j+1).getStore_lon())){
						av = storeList.get(j+1);
						break;
					}else {
						av = storeList.get(j);
					}
				}
			}
		return av;
	}
	private double returnDistance(double c_lat,double c_lon,double s_lat,double s_lon) {
		return Math.pow(c_lat-s_lat,2)+Math.pow(c_lon-s_lon,2);
	}
}
