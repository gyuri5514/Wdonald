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
			<h1 class="mt-4">FAQ</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">FAQ</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WinDelivery FAQ <a target="_blank" href="main.do">Wcdonald's</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> FAQ
				</div>
				<form action = "updateFaq.mdo" method="get" id="updateFaq">
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
						
				<%-- <c:set value="${'#faq_name.val()' }" var="subject"></c:set>
				<c:if test="${subject eq '채용' }">
						<input type="hidden" value="recruit" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '맥딜리버리' }">
					<input type="hidden" value="delivery" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '메뉴' }">
					<input type="hidden" value="menu" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '프랜차이즈' }">
					<input type="hidden" value="franchise" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '기타' }">
					<input type="hidden" value="etc" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '구매' }">
					<input type="hidden" value="purchase" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '매장이용' }">
					<input type="hidden" value="store" name="faq_subject"/>
				</c:if>
				<c:if test="${subject eq '맥도날드앱' }">
					<input type="hidden" value="app" name="faq_subject"/>
				</c:if>
			 --%>
				 <tr>
					<td style="text-align: center">제목<input type="hidden" name="faq_seq" value="${faqDetail.faq_seq}"/></td>
					<td>
						<textarea id="faq_title" name="faq_title" style="width: 90%;">${faqDetail.faq_title}</textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align: center">공지내용</td>
					<td style="">
					<textarea id="faq_content" name="faq_content" style="width: 90%; height: 200px;">${faqDetail.faq_content}</textarea></td>
	 			</tr>
			</table>
					<div style="float:right">
						<input id="submit" type="submit" class="btn btn-primary" value="수정하기">
						<button class="btn btn-danger" onclick="deleteFaq();" >삭제하기</button>
						<a href="faqBoard.mdo" class="btn btn-primary">목록</a>
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
	function deleteFaq(){
		if (confirm("정말 삭제하시겠습니까?")==true) {
			//alert("되나??" + ${faqDetail.faq_seq});
			
			location.href = "/controller/deleteFaq.mdo?faq_seq=${faqDetail.faq_seq}";
			alert("삭제되었습니다.");
		}else{
			return;
		}
	}
	var name = '${faqDetail.faq_name}';
	for (var i = 0; i < $("#faq_name option").length; i++) {
		if (name == $("#faq_name option:eq("+i+")").val()) {
			$("#faq_name option:eq("+i+")").attr("selected","selected");
		}
	}
	
	$(function(){
		$("#submit").on("click", function(){
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
			$("#updateFaq").submit();
		})
		
	})
</script>