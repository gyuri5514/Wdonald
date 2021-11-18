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
				<form action = "qnaQaInsert.sdo" method="get">
				<input type="hidden" name="admin_seq" value="${sessionScope.admin.admin_seq}">
				<input type="hidden" name="qa_seq" value="${qnaDetail.qa_seq}">
				<div>
					<div style="margin: 10px 0px 10px 0px; display:flex; font-size: 30px">
						<!-- <div style="float: left"><h6>문의 내용</h6></div> -->
						<div>고객문의 제목 : &emsp;</div>
						<div>${qnaDetail.qa_title}</div>
					</div>
					<div style="display:flex">
						<div>문의내용 </div>						
					</div>
					<div style="margin: 10px 0px 10px 0px; text-align:left; margin-left:50px; border:solid 1px lightgray; width:97%">${qnaDetail.qa_content}</div>
					<div style=" margin: 10px 0px 10px 0px;text-align:left; margin-left:50px; border:solid 1px lightgray; ">
						<textarea name="qaa_content" class="int w1029" style="width: 100%; height:400px"></textarea>
					</div>
				</div>
					<div style="float:right">
						<input type="submit" class="bnt btn-warning" value="확인">
					</div>
				</form>
			</div>
		</div>
	</main>
	
	

<%@ include file="footer.jsp" %>
<script type="text/javascript">
/*---smartEditor---*/

	/* $(function() {
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : document.getElementById('ACPT_DESC'), //textareaID
			sSkinURI : "Editor/SmartEditor2Skin.html", //경로를 맞춰주기 
			fCreator : "createSEditor2",
			htParams : {
				//툴바 사용 여부 (true:사용)
				bUseToolbar : true,

				//입력창 크기 조절바 사용 여부 (true : 사용)
				bUseVerticalResizer : false,

				//모드 탭 (Editor/HTML/TEXT) 사용 여부
				bUseModeChanger : false
			}
		});
	}) */
</script>