package com.wdelivery.qna.dao;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QnaVO;

public interface QnaDAO {
	
	public AdminVO storeSelect(AdminVO adminVO);
	public void qnaInsert(QnaVO qnaVO);
	public QnaVO qnaSelect(QnaVO qnaVO) throws Exception;
	
	
}
