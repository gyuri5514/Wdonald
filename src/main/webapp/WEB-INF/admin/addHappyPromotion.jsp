<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/mdo.css"> -->
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
<<script type="text/javascript">
function submitPromotion(){
	$('#submitPromotion').submit();
}
</script>
<body>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">이 달의 해피밀 등록</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
					<li class="breadcrumb-item active"><a href="happypromotion.mdo">이 달의 해피밀 등록</a></li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						WDonald 이 달의 해피밀 등록 <a target="_blank" href="main.do">WDonald</a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 이 달의 해피밀 등록
						<div>
							<input type="button" onclick="submitPromotion();" class="btn btn-warning" value="확인">
						</div>
					</div>
					<div style="margin-left: 100px;">
						<form action = "addHappyPromotion.mdo" id="submitPromotion" method="post" enctype="multipart/form-data">
							<table style="width: 90%;">
								<tr>
									<td style="text-align: center">제목</td>
									<td>
										<input style="border: 1px solid #ddd; border-radius: 5px;" type="text" class="form-control" name="hp_name" id="hp_name" />
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
								<tr>
									<td style="text-align: center">이미지 등록</td>
									<td>
										<div style="margin-top: 10px;">
											<button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">이미지 미리보기</button>
											<div class="happypromotion-container" id="happypromotion-container" style="display: none;">
												<img style="width: 100%;" id="image">
											</div>
										</div>
										<div class="row mb-3" style="margin-top: 20px;">
											<div class="input-group">
												<label class="input-group-btn">
													<span class="btn btn-primary" role="button"> Upload 
														<input type="file" name="file1" id="file1" style="display: none;" multiple>
													</span>
												</label>
												<input type="text" id="hp_img_path" class="form-control" readonly>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="text-align: center">상세페이지 이미지 등록</td>
									<td>
										<div style="margin-top: 10px;">
											<button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">이미지 미리보기</button>
											<div class="happypromotion-container" id="happypromotion-container" style="display: none;">
												<img style="width: 100%;" id="image">
											</div>
										</div>
										<div class="row mb-3" style="margin-top: 20px;">
											<div class="input-group">
												<label class="input-group-btn">
													<span class="btn btn-primary" role="button"> Upload 
														<input type="file" name="file2" id="file2" style="display: none;" multiple>
													</span>
												</label>
												<input type="text" id="hp_detail_img_path" class="form-control" readonly>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</main>
<%@ include file="footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	/* $("#p_code").blur(function(){
		var code = $('#p_code').val();
		$.ajax({
			type : "get",
			url : "pcodeChk.mdo",
			data : {"p_code" : code},
			success : function(data){
				console.log("중복 확인 : " + data);
				if (data == 1) {
					$("#codetxt").html('<small><strong class="text-danger">이미 사용중인 코드 입니다.</strong></small>');
					$("#p_code").focus();
					return false;
				}else{
					$("#codetxt").html('<small><strong class="text-success">사용 가능한 코드 입니다.</strong></small>');
				}
			},
			error : function(){
				alert("실패");
			}
		})
	}); */
	
	/* $("#cancle").on("click", function() {
		location.href = "p.mdo";
	}) */
	$("#submit").on("click", function() {
		var regExp = /\s/g;
		if ($("#p_title").val() == "") {
			alert("제목을 입력하세요.");
			$("#p_title").focus();
			return false;
		}
		if ($("#p_content").val() == "") {
			alert("공지내용을 입력하세요.");
			$("#p_content").focus();
			return false;
		}
		if ($("#p_regdate").val() == "") {
			alert("등록일을 입력하세요.");
			$("#p_regdate").focus();
			return false;
		}
		$('#addp').submit();
	});

	$('#file1').on('fileselect', function(event, numFiles, label) {
		var input = $(this).parents(
				'.input-group').find(
				':text'), log = numFiles > 1 ? numFiles
				+ ' files selected'
				: label;

		if (input.length) {
			input.val(log);
		} else {
			if (log)
				alert(log);
		}
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$('#image').attr("src", tmppath);
	});
	$(document).on('change',":file",function() {
		var input = $(this), numFiles = input
				.get(0).files ? input
				.get(0).files.length : 1, label = input
				.val();
		input.trigger('fileselect', [
				numFiles, label ]);
	});

	$('#file2').on('fileselect', function(event, numFiles, label) {
		var input = $(this).parents(
				'.input-group').find(
				':text'), log = numFiles > 1 ? numFiles
				+ ' files selected'
				: label;

		if (input.length) {
			input.val(log);
		} else {
			if (log)
				alert(log);
		}
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$('#Dimage').attr("src", tmppath);
	});
	$(document).on('change',":file",function() {
		var input = $(this), numFiles = input
				.get(0).files ? input
				.get(0).files.length : 1, label = input
				.val();
		input.trigger('fileselect', [
				numFiles, label ]);
	});
})
function slideButton() {
	var img = $('#promotion-container');
	if (img.attr("style") == "display:none;") {
		img.attr("style", "display:block;");
		$('#slideBtn').text("이미지 미리보기 취소");
	} else {
		img.attr("style", "display:none;");
		$('#slideBtn').text("이미지 미리보기");
	}
};
</script>