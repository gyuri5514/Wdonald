package com.wdelivery.store.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.util.MapPointVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;

public interface StoreDAO {
	
	public void adminUpdate(AdminVO adminVO);
	public List<AdminVO> findProximateStore(MapPointVO mpv);
	
	public List<QnaVO> storeQnaSelect(AdminVO adminVO);
	public QnaVO qnaDetail(QnaVO qnaVO);
	public void qnaQaInsert(QaaVO qaaVO);
	public void qaaCompletion(QnaVO qnaVO);
}
