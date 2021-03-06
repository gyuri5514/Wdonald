<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.bbsSearch .srchNews button {
    width: 50px;
    height: 50px;
    margin-left: 8px;
    overflow: hidden;
    text-indent: -9999px;
    background: url(https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/icon/btn_search.png) 0 0 no-repeat;
}
</style>
<script>
	function setSearchTypeSelect() {
		var $keyword = $('#keyword');
		
		var keywordVal = $keyword.val();
		
		var url = "news.do?page=" + "${pageMaker.cri.page}"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;
	}
</script>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<div class="content">
	<div class="visualArea bgWhats01" data-title="새로운 소식" data-desc="새로운 소식">
		<div class="inner">
			<h1 class="titDep1">새로운 소식</h1>
			<ul class="navPath">
				<li><a href="/main.do">Home</a></li>
				<li><a href="/promotion.do">What's New</a></li>
				<li><a href="/news.do">새로운 소식</a></li>
			</ul>
		</div>
	</div>
	<!-- //visualArea -->
	<div class="contArea">
		<div class="inner">
			<fieldset class="bbsSearch">
				<legend>게시물 검색</legend>
				<div class="srchNews">
					<input class="form-control" type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"
					style="width: 300px; height: 50px;" onkeypress = "setSearchTypeSelect();">
					<button type="button" class="btn btn-primary" id="searchBtn" onclick="setSearchTypeSelect();">검색</button>
				</div>
			</fieldset>
			<div class="mcBoard">
				<p class="count">
					총 <b class="color01">${pageMaker.totalCount}</b>의 게시글이 있습니다.
				</p>
				<!-- 검색 결과 있음 -->
				<ul class="bbsList">
					<c:forEach items="${notice}" var="notice">
						<li class="notice">
							<a href="#" onClick="javascript:location.href='newsDetail.do?news_code=${notice.news_code}'">
								<span class="bNum">
									<b class="ico">공지</b>
								</span>
								<span class="bSubject">
									<strong class="tit">${notice.news_title}</strong>
								</span>
								<span class="bDate"><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.news_regdate}"/></span>
							</a>
						</li>
					</c:forEach>
					<c:forEach items="${list}" var="selectNews">
						<li class="notice">
							<a href="#" onClick="javascript:location.href='newsDetail.do?news_code=${selectNews.news_code}'">
								<span class="bNum">
									${selectNews.news_code}
								</span>
								<span class="bSubject">
									<strong class="tit">${selectNews.news_title}</strong>
								</span>
								<span class="bDate"><fmt:formatDate pattern="yyyy.MM.dd" value="${selectNews.news_regdate}"/></span>
							</a>
						</li>
					</c:forEach>
				</ul>
				<div class='btnPaging'>
					<ul class="btn_group_pagination">
						<c:if test="${pageMaker.prev}">
						<li class="paging_prev_btn">
							<a href='<c:url value="/news.do?page=${pageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a>
						</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						<li class="paging_number_btn ${pageMaker.cri.page == pageNum ? 'active' : ''}">
							<a href="news.do?page=${pageNum}&keyword=${pageMaker.cri.keyword}"><i class="fa">${pageNum}</i></a>
						</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="paging_next_btn">
							<a href='<c:url value="/news.do?page=${pageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a>
						</li>
						</c:if>
					</ul>
				</div>
				<form id="moveForm" method="get">
					<input type="hidden" name="page" value="${pageMaker.cri.page}">
					<input type="hidden" name="totalCount" value="${pageMaker.totalCount}">
				</form>
				<!-- //검색 결과 있음 -->
			</div>
			<!-- //mcBaord -->
		</div>
	</div>
	<!-- //contArea -->
</div>
<div class="aside">
	<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">WDonald</a>
</div>

<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<%@ include file="footer.jsp"%>