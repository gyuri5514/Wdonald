package com.wdelivery.admin.service;

import com.wdelivery.admin.vo.AdminVO;

public interface AdminLoginService {
	
	AdminVO findAdmin(AdminVO adminVO);
	
	AdminVO register(AdminVO registerAdmin) throws Exception;
}
