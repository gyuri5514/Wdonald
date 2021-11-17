<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<<style>
	.textareaCSS{
		margin-top : 20px;
		height: 500px;
	}
</style>
<body>
	<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">1:1 고객문의</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">1:1 고객문의</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					Wcdonald의 1:1 고객문의 <a target="_blank" href="main.do">Wcdonald's</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 고객문의
				</div>
				<form action = "">
				<div>
					<div style="display:flex; font-size: 30px">
						<!-- <div style="float: left"><h6>문의 내용</h6></div> -->
						<div>고객문의 제목 : &emsp;</div>
						<div>${qnaDetail.qa_title}</div>
					</div>
					<div style="display:flex">
						<div>문의내용 </div>						
					</div>
					<div style="text-align:left; margin-left:50px; border:solid 1px lightgray; width:750px">${qnaDetail.qa_content}</div>
					<div>
						<textarea class="form-control textareaCSS" rows="" cols=""></textarea>
					</div></div>
					<div>
						<input type="button" class="bnt btn-warning" value="확인">
					</div>
				</form>
			</div>
		</div>
	</main>
	
</body>
</html>