package com.wdelivery.qna.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QnaVO;

public interface QnaService {
	
	List<AdminVO> storeSelect(String store_address);
	public void qnaInsert(QnaVO qnaVO);
	public QnaVO qnaSelect(QnaVO anaVO) throws Exception;
	
}
