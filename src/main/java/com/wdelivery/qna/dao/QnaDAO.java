package com.wdelivery.qna.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QnaVO;

public interface QnaDAO {
	
	List<AdminVO> storeSelect(String store_address);
	public void qnaInsert(QnaVO qnaVO);
	public QnaVO qnaSelect(QnaVO qnaVO) throws Exception;
	
	
}
