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
        <title>Register - SB Admin</title>
        <link href="${pageContext.request.contextPath}/resources/css/adminStyles.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc50f0bdab0c2e48e4552db155399164&libraries=services"></script>
    </head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#dessert_code").blur(function(){
			var code = $('#dessert_code').val();
			$.ajax({
				type : "get",
				url : "dessertCodeChk.mdo",
				data : {"dessert_code" : code},
				success : function(data){
					//console.log("중복 확인 : " + data);
					if (data == 1) {
						$("#codetxt").html('<small><strong class="text-danger">이미 사용중인 코드 입니다.</strong></small>');
						$("#dessert_code").focus();
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
			location.href = "dessert.mdo";
		})
		$("#submit").on("click", function() {
			var regExp = /\s/g;
			if ($("#dessert_code").val() == "") {
				alert("디저트코드를 입력하세요.");
				$("#dessert_code").focus();
				return false;
			}
			if (regExp.test($("#dessert_code").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#dessert_code").focus();
				return false;
			}
			if ($("#dessert_name").val() == "") {
				alert("디저트 이름을 입력하세요.");
				$("#dessert_name").focus();
				return false;
			}
			if (regExp.test($("#dessert_name").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#dessert_name").focus();
				return false;
			}
			if ($("#dessert_kcal").val() == "") {
				alert("디저트 칼로리를 입력하세요.");
				$("#dessert_kcal").focus();
				return false;
			}
			if (regExp.test($("#dessert_kcal").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#dessert_kcal").focus();
				return false;
			}
			if ($("#dessert_price").val() == "") {
				alert("디저트 가격을 입력하세요.");
				$("#dessert_price").focus();
				return false;
			}
			if (regExp.test($("#dessert_price").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#dessert_price").focus();
				return false;
			}
			if ($("#dessert_type").val() == "") {
				alert("분류를 입력하세요.");
				$("#dessert_type").focus();
				return false;
			}
			if (regExp.test($("#dessert_type").val())) {
				alert("공백을 사용할 수 없습니다.");
				$("#dessert_type").focus();
				return false;
			}
			if ($("#dessert_regdate").val() == "") {
				alert("디저트 등록일을 입력하세요.");
				$("#dessert_regdate").focus();
				return false;
			}
			if ($("#dessert_detail").val() == "") {
				alert("디저트 상세설명을 입력하세요.");
				$("#dessert_detail").focus();
				return false;
			}
			if ($("#dessert_img").val() == "") {
				alert("디저트 이미지를 업로드하세요.");
				$("#dessert_img").focus();
				return false;
			}
			if ($("#dessert_detail_img").val() == "") {
				alert("디테일 이미지를 업로드하세요.");
				$("#dessert_detail_img").focus();
				return false;
			}
			$('#addDessert').submit();
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
			var tmppath = URL
					.createObjectURL(event.target.files[0]);
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
			var tmppath = URL
					.createObjectURL(event.target.files[0]);
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
		var img = $('#dessert-container');
		if (img.attr("style") == "display:none;") {
			img.attr("style", "display:block;");
			$('#slideBtn').text("디저트 미리보기 취소");
		} else {
			img.attr("style", "display:none;");
			$('#slideBtn').text("디저트 미리보기");
		}
	};
	function slideDButton() {
		var img = $('#dessert-detail-container');
		if (img.attr("style") == "display:none;") {
			img.attr("style", "display:block;");
			$('#slideDBtn').text("디저트 미리보기 취소");
		} else {
			img.attr("style", "display:none;");
			$('#slideDBtn').text("디저트 미리보기");
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">디저트 등록</h3></div>
                                    <div class="card-body">
                                        <form action="dessertRegister.mdo" method="post" id="addDessert" enctype="multipart/form-data">
                                        	<div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="dessert_code" name="dessert_code" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 50px);"/>
                                                        <label for="dessert_code">디저트 코드 - (800~899)</label><span id="codetxt"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dessert_name" name="dessert_name" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="dessert_name">디저트 이름</label>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row mb-3">
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dessert_kcal" name="dessert_kcal" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="dessert_kcal">디저트 칼로리</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dessert_price" name="dessert_price" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="dessert_price">디저트 가격</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<select class="form-select" id="dessert_type" name="dessert_type" aria-label="Default select example"
                                                    		style="font-size: 13px; font-weight: 1000; padding-top: 1.1rem;">
                                                    		<option selected>기본</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dessert_regdate" name="dessert_regdate" type="date"/>
                                                        <label for="dessert_regdate">디저트등록일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="dessert_detail" name="dessert_detail" type="text"/>
                                                <label for="dessert_detail">상세설명 / 판매시간</label>
                                            </div>
                                            <div style="margin-top: 10px;">
	                                            <button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">이미지 미리보기</button>	
	                                            <div class="dessert-container" id="dessert-container" style="display:none;">
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
									                <input type="text" id="dessert_img" class="form-control" readonly>
								           		</div>
								           		<small>기본 이미지 : 사진크기 240*180</small>
                                            </div>
                                            
                                            <div style="margin-top: 10px;">
	                                            <button type="button" id="slideDBtn" onclick="slideDButton();" class="btn btn-primary">이미지 미리보기</button>	
	                                            <div class="dessert-detail-container" id="dessert-detail-container" style="display:none;">
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
									                <input type="text" id="dessert_detail_img" class="form-control" readonly>
								           		</div>
								           		<small>디테일 이미지 : 사진크기 772*530</small>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">디저트 등록</a></div>
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
