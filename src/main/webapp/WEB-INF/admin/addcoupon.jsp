<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>쿠폰 등록</title>
        <link href="${pageContext.request.contextPath}/resources/css/adminStyles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66de1c95d1d79be93897b045b9aca54a&libraries=services"></script>
    </head>
    <script type="text/javascript">
    $(document).ready(function(){
   	 $("#cancle").on("click",function(){ 
   		
   		 location.href = "/controller/layout-sidenav-light.mdo"
   	 })
   	$("#submit").on("click",function(){
		 if($("#coupon_code").val()==""){
			 alert("쿠폰코드를 입력하세요.");
			 $("#coupon_code").focus();
			 return false;
		 }
		 if($("#coupon_title").val()==""){
			 alert("쿠폰명을 입력하세요.");
			 $("#coupon_title").focus();
			 return false;
		 }
		 if($("#coupon_type").val()=="none"){
			 alert("쿠폰 분류를 선택하세요.");
			 $("#coupon_type").focus();
			 return false;
		 }else if($("#coupon_type").val()=="discount"){
			 var coupon_discount = $('#coupon_discount').val();
			 var regex =  new RegExp(/^[0-9]*$/);
			 if(coupon_discount!=''){
					if(!regex.test(coupon_discount)){
						alert('할인 금액에는 숫자만 입력해주세요.');
						return false;
					}else if(coupon_discount<1000||coupon_discount>50000){
						alert('1000원이상 50000원 이하로만 입력해주세요.')
						return false;
					}
			 }else{
				 alert('금액을 입력해주세요.')
				 return false;
			 }
		 }
		 if($("#coupon_regdate").val()==""){
			 alert("쿠폰등록일을 입력하세요.");
			 $("#coupon_regdate").focus();
			 return false;
		 }
		 if($("#coupon_enddate").val()==""){
			 alert("유효일자를 입력하세요.");
			 $("#coupon_enddate").focus();
			 return false;
		 }
		 $.ajax({
			type : 'post',
			url : '/controller/couponCheck.mdo',
			data : {
				coupon_code : $("#coupon_code").val()
			},
			dataType : 'json',
			success : function(data) {
				if(data == 1){
					$('#content').attr("style","display:block; color:red;");
					$('#content').text("이미 존재하는 쿠폰코드 입니다.");
					$('#content').fadeOut(10000);
					return;
				}
				 $('#addCoupon').submit(); 
			} 	
		 });
	 });
   	$('#coupon_type').change(function(){
   		if(this.value=='discount'){
   			$("#coupon_discount").removeAttr("disabled");
   		}else{
   			$("#coupon_discount").val("");
   			$("#coupon_discount").attr("disabled","disabled");			
   		}
   	})
})
	
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">쿠폰 등록</h3></div>
                                    <div class="card-body">
                                        <form action="addcouponInsert.mdo" method="post" id="addCoupon">
                                        <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="coupon_code" name="coupon_code" type="text" placeholder="Enter your first name" />
                                                        <label for="coupon_code">쿠폰코드</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="coupon_title" name="coupon_title" type="text" placeholder="Enter your first name" />
                                                        <label for="coupon_title"><small>쿠폰명 (분류가 증정이면 증정품을 적어주세요) </small></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <!-- <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="coupon_type" name="coupon_type" type="text" placeholder="Enter your last name" />
                                                        <label for="coupon_type">분류</label>
                                                    </div> -->
                                                    <select class="form-select" id="coupon_type" name="coupon_type" aria-label="Default select example">
  														<option selected value="none">쿠폰 타입</option>
  														<option value="freebie">freebie(증정)</option>
														<option value="discount">discount</option>
													</select>
                                                     <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="coupon_discount" name="coupon_discount" type="number"  disabled="disabled"/>
                                                        <label for="coupon_discount" >할인가격</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="coupon_regdate" name="coupon_regdate" type="date"/>
                                                        <label for="coupon_regdate">쿠폰등록일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="coupon_enddate" name="coupon_enddate" type="date"/>
                                                <label for="coupon_enddate">유효일자</label>
                                            </div>
                                            <div id="content" style="display:none"></div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">쿠폰 등록</a></div>
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
        <script src="../resources/js/scripts.js"></script>	
    </body>
</html>
