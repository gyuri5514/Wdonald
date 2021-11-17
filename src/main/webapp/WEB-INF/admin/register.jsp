<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc50f0bdab0c2e48e4552db155399164&libraries=services"></script>
    </head>
    <script type="text/javascript">
    	$(document).ready(function(){
    	 $("#cancle").on("click",function(){ 
    		
    		 location.href = "/controller/index.mdo";
    	 })
    	 $("#submit").on("click",function(){
    		 var regExp = /\s/g;
    		 if($("#admin_id").val()==""){
    			 alert("아이디를 입력해주세요.");
    			 $("#admin_id").focus();
    			 return false;
    		 } 
    		 if(regExp.test($("#admin_id").val())) {
				 alert("공백을 사용할 수 없습니다.");
				 $("#admin_id").focus();
    			 return false;
    		 }
    		 if($("#admin_password").val()==""){
    			 alert("비밀번호를 입력해주세요.");
    			 $("#admin_password").focus();
    			 return false;
    		 }
    		 if($("#admin_name").val()==""){
    			 alert("관리자 이름을 입력해주세요.");
    			 $("#admin_name").focus();
    			 return false;
    		 }
    		 if(regExp.test($("#admin_name").val())){
    			 alert("공백을 사용할 수 없습니다.");
    			 $("#admin_name").focus();
    			 return false;
    		 }
    		 if($("#admin_phone").val()==""){
    			 alert("관리자 번호를 입력해주세요.");
    			 $("#admin_phone").focus();
    			 return false;
    		 }
    		 if(regExp.test($("#admin_phone").val())){
    			 alert("공백을 사용할 수 없습니다.");
    			 $("#admin_name").focus();
    			 return false;
    		 }
    		 if($("#store_name").val()==""){
    			 alert("매장명을 입력해주세요.");
    			 $("#store_name").focus();
    			 return false;
    		 }
    		 if(regExp.test($("#store_name").val())){
    			 alert("공백을 사용할 수 없습니다.");
    			 $("#store_name").focus();
    			 return false;
    		 }
    		 if($("#store_address").val()==""){
    			 alert("매장 위치를 입력해주세요.");
    			 $("#store_address").focus();
    			 return false;
    		 }
    		 if($("#store_code").val()==""){
    			 alert("매장 코드를 입력해주세요.");
    			 $("#store_code").focus();
    			 return false;
    		 }
    		 if( regExp.test($("#store_code").val())){
    			 alert("공백을 사용할 수 없습니다.");
    			 $("#store_code").focus();
    			 return false;
    		 }
    		 if($("#store_phone").val()==""){
    			 alert("매장 번호를 입력해주세요.");
    			 $("#store_phone").focus();
    			 return false;
    		 }
    		 if(regExp.test($("#store_phone").val())){
    			 alert("공백을 사용할 수 없습니다.");
    			 $("#store_phone").focus();
    			 return false;
    		 }
    		 $.ajax({
    			type : 'post',
    			url : '/controller/adminCheck.mdo',
    			data : {
    				admin_id : $("#admin_id").val()		
    			},
    			dataType : 'json',
    			success : function(data) {
    				console.log(data);
    				if(data == 1) {
    					$('#content').attr("style", "display:block; color:red;");
    					$('#content').text("이미 존재하는 관리자 아이디입니다.");
    					$('#content').fadeOut(2000);
    					return;
    				} else {
    					console.log(data);
    					$.ajax({
    						type : 'post',
    		    			url : '/controller/adminCheck.mdo',
    		    			data : {
    		    				store_name : $("#store_name").val()
    		    			},
    		    			dataType : 'json',
    		    			success : function(data) {
    		    				if(data == 1) {
    		    					$('#content').attr("style", "display:block; color:red;");
    		    					$('#content').text("이미 존재하는 매장명입니다.");
    		    					$('#content').fadeOut(2000);
    		    					return;    		    					
    		    				} else {
    		    					console.log(data);
	    		    				$.ajax({
	    	    						type : 'post',
	    	    		    			url : '/controller/adminCheck.mdo',
	    	    		    			data : {
	    	    		    				store_code : $("#store_code").val()
	    	    		    			},
	    	    		    			dataType : 'json',
	    	    		    			success : function(data) {
	    	    		    				if(data == 1) {
	    	    		    					$('#content').attr("style", "display:block; color:red;");
	    	    		    					$('#content').text("이미 존재하는 매장코드입니다.");
	    	    		    					$('#content').fadeOut(2000);
	    	    		    					return;   
	    	    		    				} 
	    	    		    			 $('#registerAdmin').submit(); 
	    	    		    			}
	    		    				});
    		    				}
    		    			}
    					});
    				}
    			}, 
    			error : function(message) {
    				alert("상태 : " +message.status+ "\n\n메세지 : " +message.responseText+ "\n\nerror : " +message.error);
    			}
    		 });
    	 });
    	})
    	
    	//매장검색
    	function openDaumPostcode() {
		 var themeObj = {
				 bgColor: "#F8B01B"
				};
			new daum.Postcode({
			
			oncomplete : function(data) {
				document.querySelector("#store_address").value = data.address;
				
				var m_zipcode = $("#store_address").val();
				var map = document.getElementById("map");
		
				var geocoder = new kakao.maps.services.Geocoder();
				
				geocoder.addressSearch(m_zipcode, function(result, status){
					if(status === kakao.maps.services.Status.OK){
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						document.getElementById("store_lat").value = result[0].y; //위도
						document.getElementById("store_lon").value = result[0].x; //경도
						
					}
				});
				
			},
			theme: themeObj 
		}).open();
	}
    </script>
    <body class="bg-black">
    <div id="map" style="width: 0px; height:0px;"></div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">매장 등록</h3></div>
                                    <div class="card-body">
                                        <form action="registerInsert.mdo" method="post" id="registerAdmin">
                                        <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="Enter your first name" />
                                                        <label for="admin_id">아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="admin_password" name="admin_password" type="password" placeholder="Enter your first name" />
                                                        <label for="admin_password">비밀번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="admin_name" name="admin_name" type="text" placeholder="Enter your last name" />
                                                        <label for="admin_name">관리자 이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="admin_phone" name="admin_phone" type="text" placeholder="Enter your last name" />
                                                        <label for="admin_phone">관리자 번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="store_name" name="store_name" type="text" placeholder="name@example.com" />
                                                <label for="store_name">매장명</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input style="width: 89%; display: inline" class="form-control" id=store_address name="store_address" type="text" placeholder="name@example.com" readonly/>
                                                <label for="store_address">매장 위치</label>
                                                <a onclick="openDaumPostcode();" class="btn btn-danger btn-block" style="margin-left: 10px;">검색</a>
                                                <input type="hidden" name="store_lat" id="store_lat">
												<input type="hidden" name="store_lon" id="store_lon">
												
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="store_code" name="store_code" type="text" placeholder="placeholder" />
                                                        <label for="store_code">매장 코드 ex) M0001</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="store_phone" name="store_phone" type="text" placeholder="Confirm password" />
                                                        <label for="store_phone">매장 번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="content" style="display:none; color:red;"></div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit">사업자 등록</a></div>
                                                <div class="d-grid" style="padding-top: 5px"><a class="btn btn-danger btn-block" id="cancle">취	소</a></div>
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>	
    </body>
</html>
