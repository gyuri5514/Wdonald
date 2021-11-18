package com.wdelivery.store.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;

public interface StoreService {
	
	public void adminUpdate(AdminVO adminVO);
	
	public List<QnaVO> storeQnaSelect(AdminVO adminVO);
	public QnaVO qnaDetail(QnaVO qnaVO);
	public void qnaQaInsert(QaaVO qaaVO);
	public void qaaCompletion(QnaVO qnaVO);
}
