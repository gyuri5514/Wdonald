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
   		
   		 location.href = "/controller/board.mdo"
   	 })
   	$("#submit").on("click",function(){
		 if($("#notice_title").val()==""){
			 alert("공지사항 제목을 입력하세요.");
			 $("#notice_title").focus();
			 return false;
		 }
		 /* if($("#notice_regdate").val()==""){
			 alert("등록일을 입력하세요.");
			 $("#notice_regdate").focus();
			 return false;
		 } */
		 if($("#notice_content").val()==""){
			 alert("공지사항 내용을 입력하세요.");
			 $("#notice_content").focus();
			 return false;
		 }
		 
			$('#addBoard').submit(); 
			
		 });
	 });
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 공지사항 등록</h3></div>
                                    <div class="card-body">
                                        <form action="addboardInsert.mdo" method="post" id="addBoard">
                                        <div class="row mb-3">
                                                <div class="col-md-6">
	                                                <div class="input-group mb-3">
													  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
													  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="notice_title" id="notice_title">
													</div>
                                                </div>
                                               <!--  <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="notice_regdate" name="notice_regdate" type="date" placeholder="Enter your first name" />
                                                        <label for="notice_regdate">등록일</label>
                                                    </div>
                                                </div> -->
                                            </div>
                                           <!--  <label for="notice_content">공지사항 내용</label> -->
                                            <div class="form-floating mb-3">
                                                <div class="input-group">
												  <span class="input-group-text">내용</span>
												  <textarea class="form-control" aria-label="With textarea" id="notice_content" name="notice_content" style="height: 270px;"></textarea>
												</div>                                            
											</div>
                                            <div id="content" style="display:none"></div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">공지사항 등록</a></div>
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
