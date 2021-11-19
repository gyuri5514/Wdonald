package com.wdelivery.store.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminNoticeVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.util.MapPointVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;

public interface StoreDAO {
	
	public void storeStatus(AdminVO adminVO);
	public void adminUpdate(AdminVO adminVO);
	public List<AdminVO> findProximateStore(MapPointVO mpv);
	
	public List<AdminNoticeVO> noticeSelect();
	public AdminNoticeVO noticeDetail(AdminNoticeVO adminNoticeVO);
	
	public List<QnaVO> storeQnaSelect(AdminVO adminVO);
	public QnaVO qnaDetail(QnaVO qnaVO);
	public void qnaQaInsert(QaaVO qaaVO);
	public void qaaCompletion(QnaVO qnaVO);
}
