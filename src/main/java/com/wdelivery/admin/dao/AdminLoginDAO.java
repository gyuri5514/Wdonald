package com.wdelivery.admin.dao;

import com.wdelivery.admin.vo.AdminVO;

public interface AdminLoginDAO {
	
	AdminVO findAdmin(AdminVO adminVO);
	
	public void register(AdminVO registerAdmin) throws Exception;
	
	public AdminVO storeUpdate(AdminVO adminVO);
	public void storeUpdatedo(AdminVO adminVO);
	
}
