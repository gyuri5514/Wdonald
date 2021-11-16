package com.wdelivery.store.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.util.MapPointVO;

public interface StoreDAO {
	
	public void adminUpdate(AdminVO adminVO);
	public List<AdminVO> findProximateStore(MapPointVO mpv);
}
