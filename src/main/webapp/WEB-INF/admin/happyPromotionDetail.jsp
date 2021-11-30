<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/mdo.css"> -->
<style>
.textareaCSS {
	margin-top: 20px;
	height: 500px;
}

table, td, th {
	border: 1px solid #ddd;
	border-collapse: collapse;
	margin: 15px;
	padding: 10px;
	font-size: 20px;
}

.modify_btn {
	float: right;
	margin-right: 15px;
	margin-bottom: 10px;
}

</style>
<body>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">이 달의 해피밀</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
					<li class="breadcrumb-item active"><a href="happyPromotion.mdo">이 달의 해피밀</a></li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						WDonald 이 달의 해피밀 <a target="_blank" href="main.do">WDonald</a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 이 달의 해피밀
					</div>
					<form action="updateHappyPromotion.mdo" method="get" enctype="multipart/form-data">
						<table style="width: 97.5%;">
							<tr>
								<td style="text-align: center">제목
									<input type="hidden" name="hp_code" value="${happyPromotionDetail.hp_code}" />
								</td>
								<td>
									<textarea id="hp_name" name="hp_name" style="width: 100%;">${happyPromotionDetail.hp_name}</textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align: center">진행 여부</td>
								<td>
									<select name="hp_status" id="hp_status">
										<option value=1>활성화</option>
										<option value=2>비활성화</option>
									</select>
								</td>
							</tr>
						</table>
						<div class="modify_btn">
							<input type="submit" class="btn btn-primary" value="수정하기">
							<button class="btn btn-danger" onclick="deleteFaq();">삭제하기</button>
							<a href="happyPromotion.mdo" class="btn btn-primary">목록</a>
						</div>
					</form>
				</div>
			</div>
		</main>
<%@ include file="footer.jsp"%>
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
			function deleteFaq() {
				if (confirm("정말 삭제하시겠습니까?") == true) {

					location.href = "/controller/deleteHappyPromotion.mdo?hp_code=${happyPromotionDetail.hp_code}";
					alert("삭제되었습니다.");
				} else {
					return;
				}
			}
			var name = '${promotionDetail.p_title}';
			for (var i = 0; i < $("#p_title option").length; i++) {
				if (name == $("#p_title option:eq(" + i + ")").val()) {
					$("#p_title option:eq(" + i + ")").attr("selected",
							"selected");
				}
			}

			$(function() {
				var subject = $('#p_title option:selected').text();
				console.log("sub" + subject);
			})
		</script>