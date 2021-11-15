package com.wdelivery.admin.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;

public interface AdminStoreService {
	
	List<AdminVO> searchStore(String searchWord);
	
}
