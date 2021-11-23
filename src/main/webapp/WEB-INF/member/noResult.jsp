<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
	<div class="content">
		<div class="contArea">
			<div class="inner">
				<div class="error">
					<strong><b>Page Not Found</b>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</strong>
					<p class="txt02">방문하시려는 페이지 주소가 잘못 입력되었거나, 페이지 주소가 변경 또는 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br>관련 문의사항은 고객문의를 이용해주세요.</p>
					${e}
				</div>
				<div class="btnArea">
					<a href="main.do" class="btnMC btnL action">윈도날드 메인으로 가기</a>
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