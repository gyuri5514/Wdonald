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
					총 <b class="color01">79건</b>의 게시글이 있습니다.
				</p>
				<!-- 검색 결과 있음 -->
				<ul class="bbsList">
					<c:forEach items="${selectNews}" var="selectNews" begin="0" end="4">
						<li class="notice">
							<a href="#">
								<span class="bNum">
									<b class="ico">공지</b>
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
					<a href='javascript:page(1);' role='button' class='arrow first'>맨앞으로</a>
					<a href='javascript:page(1);' role='button' class='arrow prev'>이전</a>
						<span class='num'>
							<a href='javascript:blank();' role='button' aria-selected='true'>1</a>
							<a href='javascript:page(2);' role='button'>2</a>
							<a href='javascript:page(3);' role='button'>3</a>
							<a href='javascript:page(4);' role='button'>4</a>
							<a href='javascript:page(5);' role='button'>5</a>
							<a href='javascript:page(6);' role='button'>6</a>
							<a href='javascript:page(7);' role='button'>7</a>
							<a href='javascript:page(8);' role='button'>8</a>
							<a href='javascript:page(9);' role='button'>9</a>
							<a href='javascript:page(10);' role='button'>10</a>
						</span>
						<a href='javascript:page(11);' role='button' class='arrow next'>다음</a>
						<a href='javascript:page(16);' role='button' class='arrow last'>맨끝으로</a>
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