package com.wdelivery.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.dao.QnaDAO;
import com.wdelivery.qna.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public void qnaInsert(QnaVO qnaVO) {
		qnaDAO.qnaInsert(qnaVO);
		System.out.println("insertServiceImpl => " + qnaVO.toString());
		//System.out.println("qna 성공");
	}

	
	  @Override
	  public QnaVO qnaSelect(QnaVO qnaVO) throws Exception{
		  return qnaDAO.qnaSelect(qnaVO);
	  }


	@Override
	public AdminVO storeSelect(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return null;
	}
	  
	  

}
