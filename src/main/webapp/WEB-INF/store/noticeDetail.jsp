<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.textareaCSS{
		margin-top : 20px;
		height: 500px;
	}
</style>
<body>
	<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					Wcdonald 관리자 공지사항 <a target="_blank" href="main.do">Wcdonald's</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공지사항
				</div>
				
				<div>
					<div style="margin: 10px 0px 10px 0px; display:flex; font-size: 30px">
						<!-- <div style="float: left"><h6>문의 내용</h6></div> -->
						<div style="margin-top: 8px;">제목 :</div>
 							<div class="form-control" style="margin: 10px 0px 10px 0px; text-align:left; margin-left:50px; border:solid 1px lightgray; width:90%; font-size: 30px">${noticeDetail.notice_title}</div>
						<%-- <input class="form-control" value="${noticeDetail.notice_title}"> --%>
 						</div>
					<div style="margin: 10px 0px 10px 0px; display:flex; font-size: 30px">
						<div>내용 :</div>			
						<div class="form-control" style="margin: 10px 0px 10px 0px; text-align:left; margin-left:50px; border:solid 1px lightgray; width:90%; height50px; font-size: 30px">${noticeDetail.notice_content}</div>
					</div>
					
				</div>				
			</div>
		</div>
	</main>
	
	

<%@ include file="footer.jsp" %>
