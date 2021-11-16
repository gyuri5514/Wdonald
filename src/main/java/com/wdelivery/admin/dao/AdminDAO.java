package com.wdelivery.admin.dao;

import java.util.List;

import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.paging.Criteria;

public interface AdminDAO {


	public List<PaymentVO> indexView();
	
	public List<UserVO> userSelect(Criteria cri);
	
	int getUserContent();
	
}
