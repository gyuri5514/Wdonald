<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<form id="searchForm" method="get">
				<input type="hidden" name="page" id="page">
				<input type="hidden" name="seq" id="seq">
				<input type="hidden" name="rnum" id="rnum">
				<input type="hidden" name="temp_seq" id="temp_seq">
				<fieldset class="bbsSearch">
					<legend>게시물 검색</legend>
					<div class="srch">
						<input type="text" title="검색어 입력" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요.">
						<button type="button" class="btn" onclick="search()">검색</button>
					</div>
				</fieldset>
			</form>

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
					<ul class="btn_group pagination">
						<c:if test="${pageMaker.prev}">
						<li class="paging_prev_btn">
							<a href='<c:url value="/news.do?page${pageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a>
						</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						<li class="paging_number_btn">
							<a href='<c:url value="/news.do?page=${pageNum}"/>'><i class="fa">${pageNum}</i></a>
						</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="paging_next_btn">
							<a href='<c:url value="/news.do?page=${pageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a>
						</li>
						</c:if>
					</ul>
				</div>
				<!-- //검색 결과 있음 -->
			</div>
			<!-- //mcBaord -->
		</div>
	</div>
	<!-- //contArea -->
</div>
<div class="aside">
	<a href="cart.do" class="goDelivery" target="_blank" title="새창 열림">Mcdelivery</a>
</div>

<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<%@ include file="footer.jsp"%>