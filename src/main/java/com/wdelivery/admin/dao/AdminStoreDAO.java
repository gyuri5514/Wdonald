package com.wdelivery.admin.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;

public interface AdminStoreDAO {
	
	List<AdminVO> searchStore(String searchWord);
	
}
