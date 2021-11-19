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
 	$(document).ready(function(){
	 	$("#cancle").on("click",function(){ 
	   		
	   		 location.href = "burger.mdo";
	   	 })
	   	$("#submit").on("click",function(){
	   		var regExp = /\s/g;
			 if($("#burger_code").val()==""){
				 alert("버거코드를 입력하세요.");
				 $("#burger_code").focus();
				 return false;
			 }
			 if(regExp.test($("#burger_code").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#burger_code").focus();
    			 return false;
    		 }
			 if($("#burger_name").val()==""){
				 alert("버거 이름을 입력하세요.");
				 $("#burger_name").focus();
				 return false;
			 }
			 if(regExp.test($("#burger_name").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#burger_name").focus();
    			 return false;
    		 }
			 if($("#burger_kcal").val()==""){
				 alert("버거 칼로리를 입력하세요.");
				 $("#burger_kcal").focus();
				 return false;
			 }
			 if(regExp.test($("#burger_kcal").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#burger_kcal").focus();
    			 return false;
    		 }
			 if($("#burger_price").val()==""){
				 alert("버거 가격을 입력하세요.");
				 $("#burger_price").focus();
				 return false;
			 }
			 if(regExp.test($("#burger_price").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#burger_price").focus();
    			 return false;
    		 }
			 if($("#burger_type").val()==""){
				 alert("분류를 입력하세요.");
				 $("#burger_type").focus();
				 return false;
			 }
			 if(regExp.test($("#burger_type").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#burger_type").focus();
    			 return false;
    		 }
			 if($("#burger_regdate").val()==""){
				 alert("버거 등록일을 입력하세요.");
				 $("#burger_regdate").focus();
				 return false;
			 }
			 if($("#burger_detail").val()==""){
				 alert("버거 상세설명을 입력하세요.");
				 $("#burger_detail").focus();
				 return false;
			 }
			 if($("#burger_img").val()==""){
				 alert("버거 이미지를 업로드하세요.");
				 $("#burger_img").focus();
				 return false;
			 }
			 $('#addBurger').submit();  
		 });
	 	
 	 $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }
          var tmppath = URL.createObjectURL(event.target.files[0]);
          $('#image').attr("src",tmppath);
      });
 	  $(document).on('change', ':file', function() {
 	     var input = $(this),
 	         numFiles = input.get(0).files ? input.get(0).files.length : 1,
 	         label = input.val();
 	     input.trigger('fileselect', [numFiles, label]);
 	   });
	})
	function slideButton(){
 		var img = $('#burger-container');
 		if(img.attr("style") == "display:none;"){
 			img.attr("style","display:block;");
 			$('#slideBtn').text("버거 미리보기 취소");	
 		}
 		else {
 			img.attr("style","display:none;");
 			$('#slideBtn').text("버거 미리보기");	
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">버거 등록</h3></div>
                                    <div class="card-body">
                                        <form action="burgerRegister.mdo" method="post" id="addBurger" enctype="multipart/form-data">
                                        	<div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="burger_code" name="burger_code" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 50px);"/>
                                                        <label for="burger_code">버거 코드 - 단품(100~199),세트(200~299),라지세트(500~599)</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="burger_name" name="burger_name" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="burger_name">버거 이름</label>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row mb-3">
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="burger_kcal" name="burger_kcal" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="burger_kcal">버거 칼로리</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="burger_price" name="burger_price" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="burger_price">버거 가격</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="burger_type" name="burger_type" type="text" placeholder="Enter your last name" />
                                                        <label for="burger_type">분류 ex)단품, 세트.....</label>
                                                    </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="burger_regdate" name="burger_regdate" type="date"/>
                                                        <label for="burger_regdate">버거등록일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="burger_detail" name="burger_detail" type="text"/>
                                                <label for="burger_detail">상세설명 / 판매시간</label>
                                            </div>
                                            <div style="display: inline-flex; flex-wrap: wrap; margin-top: 10px;">
	                                            <button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">버거 미리보기</button>	
	                                            <div class="burger-container" id="burger-container" style="display:none;">
	                                            	<img style="width:100%;" id="image">
                                            	</div>
                                            </div>
                                            <div class="row mb-3" style="margin-top: 20px;">
                                                <div class="input-group">
									                <label class="input-group-btn">
									                    <span class="btn btn-primary">
									                        Upload <input type="file" name="file" id="file" style="display: none;" multiple>
									                    </span>
									                </label>
									                <input type="text" id="burger_img" class="form-control" readonly>
								           		</div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">버거 등록</a></div>
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
