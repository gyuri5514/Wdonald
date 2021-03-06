<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>윈모닝 등록</title>
        <link href="${pageContext.request.contextPath}/resources/css/adminStyles.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66de1c95d1d79be93897b045b9aca54a&libraries=services"></script>
    </head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#winMorning_code").blur(function(){
			var code = $('#winMorning_code').val();
			$.ajax({
				type : "get",
				url : "wcodeChk.mdo",
				data : {"w_code" : code},
				success : function(data){
					//console.log("중복 확인 : " + data);
					if (data == 1) {
						$("#codetxt").html('<small><strong class="text-danger">이미 사용중인 코드 입니다.</strong></small>');
						$("#winMorning_code").focus();
						return false;
					}else{
						$("#codetxt").html('<small><strong class="text-success">사용 가능한 코드 입니다.</strong></small>');
					}
				},
				error : function(){
					alert("실패");
				}
			})
		});
		
		$("#cancle").on("click", function() {
			location.href = "burger.mdo";
		})
		$("#submit").on("click", function() {
			var regExp = /\s/g;
			if ($("#winMorning_code").val() == "") {
				alert("버거코드를 입력하세요.");
				$("#winMorning_code").focus();
				return false;
			}
			if (regExp.test($("#winMorning_code").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#winMorning_code").focus();
				return false;
			}
			if ($("#winMorning_name").val() == "") {
				alert("버거 이름을 입력하세요.");
				$("#winMorning_name").focus();
				return false;
			}
			if (regExp.test($("#winMorning_name").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#winMorning_name").focus();
				return false;
			}
			if ($("#winMorning_kcal").val() == "") {
				alert("버거 칼로리를 입력하세요.");
				$("#winMorning_kcal").focus();
				return false;
			}
			if (regExp.test($("#winMorning_kcal").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#winMorning_kcal").focus();
				return false;
			}
			if ($("#winMorning_price").val() == "") {
				alert("버거 가격을 입력하세요.");
				$("#winMorning_price").focus();
				return false;
			}
			if (regExp.test($("#winMorning_price").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#winMorning_price").focus();
				return false;
			}
			if ($("#winMorning_type").val() == "") {
				alert("분류를 입력하세요.");
				$("#winMorning_type").focus();
				return false;
			}
			if (regExp.test($("#winMorning_type").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#winMorning_type").focus();
				return false;
			}
			if ($("#winMorning_regdate").val() == "") {
				alert("버거 등록일을 입력하세요.");
				$("#winMorning_regdate").focus();
				return false;
			}
			if ($("#winMorning_detail").val() == "") {
				alert("버거 상세설명을 입력하세요.");
				$("#winMorning_detail").focus();
				return false;
			}
			if ($("#winMorning_img").val() == "") {
				alert("버거 이미지를 업로드하세요.");
				$("#winMorning_img").focus();
				return false;
			}
			if ($("#winMorning_detail_img").val() == "") {
				alert("디테일 이미지를 업로드하세요.");
				$("#winMorning_detail_img").focus();
				return false;
			}
			$('#addWinMorning').submit();
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
		var img = $('#winMorning-container');
		if (img.attr("style") == "display:none;") {
			img.attr("style", "display:block;");
			$('#slideBtn').text("버거 미리보기 취소");
		} else {
			img.attr("style", "display:none;");
			$('#slideBtn').text("버거 미리보기");
		}
	};
	function slideDButton() {
		var img = $('#winMorning-detail-container');
		if (img.attr("style") == "display:none;") {
			img.attr("style", "display:block;");
			$('#slideDBtn').text("버거 미리보기 취소");
		} else {
			img.attr("style", "display:none;");
			$('#slideDBtn').text("버거 미리보기");
		}
	};
</script>
    <body class="bg-black">
    <div id="map" style="width: 0px; height:0px;"></div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container1" style="max-width:100%;">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">원모닝 등록</h3></div>
                                    <div class="card-body">
                                        <form action="winMorningRegister.mdo" method="post" id="addWinMorning" enctype="multipart/form-data">
                                        	<div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="winMorning_code" name="winMorning_code" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 50px);"/>
                                                        <label for="winMorning_code">원모닝 코드 - 단품(400~499),세트(600~699)</label><span id="codetxt"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="winMorning_name" name="winMorning_name" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="winMorning_name">원모닝 이름</label>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row mb-3">
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="winMorning_kcal" name="winMorning_kcal" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="winMorning_kcal">원모닝 칼로리</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="winMorning_price" name="winMorning_price" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="winMorning_price">원모닝 가격</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<select class="form-select" id="winMorning_type" name="winMorning_type" aria-label="Default select example"
                                                    		style="font-size: 13px; font-weight: 1000; padding-top: 1.1rem;">
                                                    		<option selected>전체</option>
															<option value="단품">단품
															<option value="세트">세트                                                     
                                                        </select>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="winMorning_regdate" name="winMorning_regdate" type="date"/>
                                                        <label for="winMorning_regdate">원모닝 등록일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="winMorning_detail" name="winMorning_detail" type="text"/>
                                                <label for="winMorning_detail">상세설명 / 판매시간</label>
                                            </div>
                                           <div style="margin-top: 10px;">
	                                            <button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">이미지 미리보기</button>	
	                                            <div class="dessert-container" id="winMorning-container" style="display:none;">
	                                            	<img style="width:100%;" id="image">
                                            	</div>
                                            </div>
                                            <div class="row mb-3" style="margin-top: 20px;">
                                                <div class="input-group">
									                <label class="input-group-btn">
									                    <span class="btn btn-primary">
									                        Upload <input type="file" name="file1" id="file1" style="display: none;" multiple>
									                    </span>
									                </label>
									                <input type="text" id="burger_img" class="form-control" readonly>
								           		</div>
								           		<small>기본 이미지 : 사진크기 240*180</small>
                                            </div>
                                            
                                            <div style="margin-top: 10px;">
	                                            <button type="button" id="slideDBtn" onclick="slideDButton();" class="btn btn-primary">이미지 미리보기</button>	
	                                            <div class="burger-detail-container" id="winMorning-detail-container" style="display:none;">
	                                            	<img style="width:100%;" id="Dimage">
                                            	</div>
                                            </div>
                                            <div class="row mb-3" style="margin-top: 20px;">
                                                <div class="input-group">
									                <label class="input-group-btn">
									                    <span class="btn btn-primary">
									                        Upload <input type="file" name="file2" id="file2" style="display: none;" multiple>
									                    </span>
									                </label>
									                <input type="text" id="burger_detail_img" class="form-control" readonly>
								           		</div>
								           		<small>디테일 이미지 : 사진크기 772*530</small>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">원모닝 등록</a></div>
                                                <div class="d-grid" style="padding-top: 5px"><a class="btn btn-danger btn-block" id="cancle" style="background-color: #0d6efd; border:solid 1px #0d6efd;">취	소</a></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>	
    </body>
</html>
