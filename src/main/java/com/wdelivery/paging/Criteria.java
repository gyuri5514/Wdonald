package com.wdelivery.paging;

public class Criteria {
	private int page;
	private int perPageNum;
	int startRow;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPageStart() {
		this.startRow = (this.page-1)*perPageNum;
	}
}

/*
<select id="getQnaContent" resultType="qnavo" parameterType="int">
SELECT * FROM QNA WHERE QNA_NO = #{qna_no}
</select>
*/