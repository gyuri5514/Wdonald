<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>

.textareaCSS {
	margin-top: 20px;
	height: 500px;
	border: 1px solid #ddd;
}

textarea {
	border: 1px solid #ddd;
	border-radius: 5px;
}

table, td, th {
	border: 1px solid #ddd;
	border-collapse: collapse;
	margin: 15px;
	padding: 10px;
	font-size: 16px;
	font-weigth: 500;
}

</style>
<body>
	<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">FAQ 등록</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">FAQ 등록</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WinDelivery FAQ 등록 <a target="_blank" href="main.do">Wcdonald's</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> FAQ 등록
					<div>
						<input type="submit" class="btn btn-warning" value="확인">
					</div>
				</div>
				<div style="margin-left: 100px;">
				<form action = "addFaq.mdo" method="post" id="addFaq">
					<table style="width: 90%;"> 
						<tr>
							<td style="text-align: center">카테고리</td>
							<td>
							<select id="faq_name" name="faq_name">
								<option value="채용">채용</option>
								<option value="구매">구매</option>
								<option value="매장이용">매장이용</option>
								<option value="윈딜리버리">윈딜리버리</option>
								<option value="메뉴">메뉴</option>
								<option value="프랜차이즈">프랜차이즈</option>
								<option value="윈도날드앱">윈도날드앱</option>
								<option value="기타">기타</option>
							</select>
							</td>
						</tr>	
						<tr>
							<td style="text-align: center">제목</td>
							<td><input type="text" class="form-control" name="faq_title" id="faq_title"/> </td>
						</tr>
						<tr>
							<td style="text-align: center">공지내용</td>
							<td style="">
								<textarea style="width: 100%; height: 500px;" id="faq_content" name="faq_content"></textarea>
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>
	</main>
<%@ include file="footer.jsp" %>
<!-- smartEditor -->
<script type="text/javascript" src="Editor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript">
/*---smartEditor---*/
 $(function() {
	 $("#submit").on("click",function(){
		if($("#faq_title").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#faq_title").focus();
			return false;
		} 
		if($("#faq_content").val() == ""){
			alert("내용을 입력해 주세요.");
			$("#faq_content").focus();
			return false;
		} 
		
		$("#addFaq").submit();
		
	 });
		/* var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : document.getElementById('faq_content'), //textareaID
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
		}); */
	});
</script>