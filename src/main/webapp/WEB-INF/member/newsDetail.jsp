<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<div class="content">
	<div class="visualArea bgWhats01" data-title="새로운 소식"
		data-desc="새로운 소식">
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
			<div class="bbsDetail">
				<div class="bbsTit">
					<h2 id="news_title">${detailNews.news_title}</h2>
					<span class="date"> <em><b class="hide">등록일 :</b><fmt:formatDate pattern="yyyy.MM.dd" value="${detailNews.news_regdate}"/></em>
						<em><b class="hide">조회수 :</b>${detailNews.news_count}</em>
					</span>
				</div>
				<article class="bbsCon">
					<div align="" style="">
						<div align="" style="">
							<p>
								<img src="${detailNews.news_img_path}" title="pc_1168.png" width="100%"><br style="clear: both;">&nbsp;
							</p>
						</div>
						<p>&nbsp;</p>
					</div>
					<p>
						<br>
					</p>
				</article>
				<div class="btnArea">
					<c:if test="${detailNews.news_code ne 105}">
						<button type="button" onclick="javascript:location.href='newsDetail.do?news_code=${detailNews.news_code - 1}'" class="prev">이전 글</button>
					</c:if>
					<a href="news.do" role="button" class="btnMC btnM"><span>목록보기</span></a>
					<c:if test="${detailNews.news_code ne 1}">
						<button type="button" onclick="javascript:location.href='newsDetail.do?news_code=${detailNews.news_code + 1}'" class="next">다음 글 보기</button>
					</c:if>
				</div>
			</div>
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