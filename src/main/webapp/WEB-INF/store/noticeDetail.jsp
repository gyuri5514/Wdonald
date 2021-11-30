<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.textareaCSS{
		margin-top : 20px;
		height: 500px;
	}
	
	table, td, th {
		border : 1px solid #dddddd;
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
				<li class="breadcrumb-item"><a href="index.sdo">WDonald</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WDonald 관리자 공지사항 <a target="_blank" href="main.do">WDonald</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공지사항
					<div>
						<a href="layout-sidenav-light.sdo" style="margin-left:1000px; margin-top: -20px; float: right;" class="btn btn-warning">목록</a>
					</div>
				</div>
				<div style="margin-left:100px;">
					<table style="width: 90%;">
						<tr>
							<td style="text-align: center;">제목</td>
							<td>${noticeDetail.notice_title}</td>
						</tr>
						<tr>
							<td style="text-align: center;">문의내용</td>
							<td style=""><textarea style="width: 100%" rows="20" cols="90" readonly="readonly">${noticeDetail.notice_content}</textarea></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="footer.jsp" %>