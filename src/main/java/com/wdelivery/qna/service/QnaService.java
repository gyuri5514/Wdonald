package com.wdelivery.qna.service;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QnaVO;

public interface QnaService {
	
	public AdminVO storeSelect(AdminVO adminVO);
	public void qnaInsert(QnaVO qnaVO);
	public QnaVO qnaSelect(QnaVO anaVO) throws Exception;
	
}
