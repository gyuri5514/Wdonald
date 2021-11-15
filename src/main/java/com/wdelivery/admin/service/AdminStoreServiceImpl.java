package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminStoreDAO;
import com.wdelivery.admin.vo.AdminVO;

@Service
public class AdminStoreServiceImpl implements AdminStoreService{
	
	@Autowired
	private AdminStoreDAO adminStoreDAO;
	
	@Override
	public List<AdminVO> searchStore(String searchWord) {
		return adminStoreDAO.searchStore(searchWord);
	}

}
