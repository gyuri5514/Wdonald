package com.wdelivery.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;
import com.wdelivery.store.dao.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public void storeStatus(AdminVO adminVO) {
		storeDAO.storeStatus(adminVO);
	}
	
	
	@Override
	public void adminUpdate(AdminVO adminVO) {
		storeDAO.adminUpdate(adminVO);
	}

	@Override
	public List<QnaVO> storeQnaSelect(AdminVO adminVO) {
		return storeDAO.storeQnaSelect(adminVO);
	}

	@Override
	public QnaVO qnaDetail(QnaVO qnaVO) {
		return storeDAO.qnaDetail(qnaVO);
	}

	@Override
	public void qnaQaInsert(QaaVO qaaVO) {
		storeDAO.qnaQaInsert(qaaVO);
	}
	@Override
	public void qaaCompletion(QnaVO qnaVO) {
		storeDAO.qaaCompletion(qnaVO);
	}

	
}
