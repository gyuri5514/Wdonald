<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.textareaCSS{
		margin-top : 20px;
		height: 500px;
	}
	
	table, td, th {
		border : 1px solid #FFD232;
		border-collapse : collapse;	
		margin: 15px;
		padding: 10px;
		font-size: 20px;
	};
</style>
<body>
	<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WinDelivery</a></li>
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
			
				<div style="margin-left:60px;">
					<table style="width: 90%;">
						<tr>
							<td style="text-align: center;">제목</td>
							<td>${noticeDetail.notice_title}</td>
						</tr>
						<tr>
							<td style="text-align: center; width: 100">문의내용</td>
							<td style=""><textarea rows="20" cols="90" readonly="readonly">${noticeDetail.notice_content}</textarea></td>
						</tr>
					</table>
					<div>
				<!-- 	<input type="submit" class="btn btn-warning" style="margin-left: 1350px; margin-bottom: 20px;" value="확인"></div> -->
				
				</div>
				<%-- <div>
					<div style="margin: 10px 0px 10px 40px; display:flex; font-size: 30px">
						<!-- <div style="float: left"><h6>문의 내용</h6></div> -->
						<div style="margin-top: 10px;">제목 :</div>
 							<div class="form-control" style="margin: 10px 0px 10px 0px; text-align:left; margin-left:30px; border:solid 1px lightgray; width:90%; font-size: 30px">${noticeDetail.notice_title}</div>
						<input class="form-control" value="${noticeDetail.notice_title}">
 						</div>
					<div style="margin: 10px 0px 10px 40px; display:flex; font-size: 30px">
						<div style="margin-top: 10px;">내용 :</div>			
						<div class="form-control" style="margin: 10px 0px 10px 0px; text-align:left; margin-left:30px; border:solid 1px lightgray; width:90%; height50px; font-size: 30px">${noticeDetail.notice_content}</div>
					</div>
					
				</div>		 --%>		
			</div>
		</div>
	</main>
	
	

<%@ include file="footer.jsp" %>
