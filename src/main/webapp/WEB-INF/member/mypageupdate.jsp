<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>McDonald's Crew</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- @todo: fill with your company info or remove -->
<meta name="description" content="">
<meta name="author" content="Themelize.me">
 
<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901"> 
<script src="https://kit.fontawesome.com/d0b304acae.js" crossorigin="anonymous"></script> <!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->	
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="/m/appstrap/css/font-awesome.min.css" rel="stylesheet">

<!-- Mcdonalds Font -->
<link href="/m/appstrap/css/font-mcdonalds.css" rel="stylesheet">

<!-- Plugins -->
<link href="/m/appstrap/plugins/animate/animate.css" rel="stylesheet">
<!-- <link href="/m/appstrap/plugins/flexslider/flexslider.css" rel="stylesheet"> -->
<link href="/m/appstrap/plugins/clingify/clingify.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!--Your custom colour override-->
<link href="/m/appstrap/css/colour-red_sh.css" id="colour-scheme" rel="stylesheet">

<link rel="stylesheet" href="/m/appstrap/css/font-awesome-4.5.0" />

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">

<!-- HTML5 shiv & respond.js for IE6-8 support of HTML5 elements & media queries -->
<!--[if lt IE 9]>
      <script src="/m/appstrap/plugins/html5shiv/dist/html5shiv.js"></script>
      <script src="/m/appstrap/plugins/respond/respond.min.js"></script>
    <![endif]-->
<!-- Le fav and touch icons - @todo: fill with your icons or remove -->
<link rel="shortcut icon" href="/m/appstrap/img/icons/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed" href="/m/appstrap/img/icons/default.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti' rel='stylesheet' type='text/css'>

<!--Retina.js plugin - @see: http://retinajs.com/-->
<script src="/m/appstrap/plugins/retina/js/retina-1.1.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts --> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/m/appstrap/js/jquery.min.js"></script>
<script src="/m/appstrap/js/jquery-migrate-1.2.1.min.js"></script> <!--Legacy jQuery support for quicksand plugin--> 
<script src="resources/js/commons.js"></script>

</head>

		<div style="padding: 40px 0px 40px;">
			<div class="container" id="sub-page-content">
				<div class="row">
					<div class="col-md-3 sidebar">
						<div class="section-menu">
							<ul class="nav nav-list">
								<li class="nav-header lnb-header">마이페이지<span>MyPage</span></li>
								<li class="active"><a href="mypageupdate.do" class="first">마이페이지<small>MyPage</small><i class="fa fa-angle-right"></i></a></li>
								<li class=""><a href="addressBook.do" class="first">주소<small>Address</small><i class="fa fa-angle-right"></i></a></li>
								<li class=""><a href="trackOrder.do" class="first">주문조회<small>Order check</small><i class="fa fa-angle-right"></i></a></li>
								<li class=""><a href="orderHistory.do" class="first">주문내역<small>Order details</small><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>			
					</div>
					
					<!-- 테이블 -->
					
					<div class="col-md-9">
					<h3 class="title-divider mt_0"><span>마이페이지</span> <small>MyPage</small></h3>
						<div class="page-content">
							<div class="panel-lg panel panel-default">
								<div class="panel-heading">
									<h3>회원정보 수정</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12">
										<script type="text/javascript" src="resources/js/join/memJoin.js"></script>
											<form  method="post"
												role="form" data-form-sync="#form_consentnewnumber"
												class="form form-register" id="form_accountsetting"
												name="form_accountsetting" data-required-symbol="*"
												autocomplete="off">
												<input type="hidden" name="user_seq"value="${userVO.user_seq }"> <!-- 여기 수정 중 -->
												<input type="hidden" name="" id="m_email" value="${userVO.user_email}">
												<div class="form-register error-container">
													<p>표시된 필수 항목을 입력해 주세요.</p>
												</div>
												<fieldset class="fieldset">
													<div class="fieldset-heading">
														<h2 class="fieldset-title">회원 정보</h2>
														<p class="instructions">* 필수 항목</p>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="field-label" for="form_accountsetting_firstname">성함:</label>
																<input type="text"
																	class="form-control input-lg required no-special-characters"
																	id="form_accountsetting_firstname" name="user_name"
																	value="${userVO.user_name }"/>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-6">
															<div class="form-group">
																<label class="field-label" for="form_accountsetting_gender">성별:</label> 
																<input type="text"
																	class="form-control input-lg required no-special-characters"
																	id="form_accountsetting_firstname" name="user_gender"
																	value="${userVO.user_gender }" readonly/>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="field-label" for="form_accountsetting_contactno">휴대전화 번호:</label> 
																	<input type="text" class="form-control input-lg required number digit-only"
																	maxlength="11" id="form_accountsetting_contactno"
																	name="user_phone" placeholder="숫자만 입력"
																	value="${userVO.user_phone }" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
							<label for="m_password">새로운 패스워드</label>
							 <input type="hidden" id="login_pwd_chk" name="login_pwd_chk" value="0" /> 
							 <input type="password" id="m_password" name="user_password" value="" maxlength="16" class="form-control placeholder" /> 
							 <span id="pwd_chk_msg" class="f11_ment">
							  	
							  	<span class="pwd_str_msg" level="0" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level0 text-danger">사용불가</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="1" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level1 text-warning">낮음</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="2" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level2 text-primary">적정</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="3" style="display: none;">
									<small>패스워드	안전도 : <strong class="level3 text-success">높음</strong></small>
								</span>
								
							</span>
						</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
						<div class="form-group">
							<label for="m_password2">패스워드 확인</label> 
							<input type="password" id="m_password2" value="" maxlength="16" class="form-control placeholder" />
								 <span id="pwd_chk_msg2" class="f11_ment"></span>
				
							<div class="box-info mt_10" id="collapseExam">
								<h5>
									<i class="fa fa-check-circle-o"></i> 패스워드 만들기
								</h5>
								<p>
									<small> 1) 비밀번호 작성 규칙은 3개 문자 조합으로 8자리 이상 가능합니다.<br />
										2) 비밀번호 작성 규칙은 2개 문자 조합으로 10자리 이상 가능합니다.<br /> 3) 주민번호, 생일,
										아이디, 전화번호, 연속된 숫자와 문자, <br /> 사전에 포함된 단어가 포함된 패스워드는 피해주시기
										바랍니다.<br /> 4) 타 사이트와 동일한 패스워드의 사용, 이전에 사용했던<br /> 패스워드의 재사용은
										안전하지 않을 수 있습니다.<br /> 5) 패스워드는 길수록, 그리고 많이 혼용할수록 안전합니다.<br />
									</small>
								</p>
								<h5>
									<i class="fa fa-check-circle-o"></i> 패스워드 안전도
								</h5>
								<p class="last">
									<strong>- 사용불가</strong> : 보안에 매우 취약하여 사용할 수 없습니다.<br /> <strong>-
										낮음</strong> : 사용은 가능하지만 보안에 다소 취약합니다.<br /> <strong>- 적정</strong> : 사용
									가능하며 적정수준의 안전한 패스워드입니다.<br /> <strong>- 높음</strong> : 매우 안전한
									패스워드입니다.
								</p>
							</div>
						</div>
														</div>
													</div>
											</fieldset>
												<!-- START Notification Channel -->
												
									<fieldset class="fieldset form-actions">
									<div class="form-group">
										<button type="button" class="btn btn-red btn-xl btn-submit" id="join_ok" onclick="updatego()">수정사항 저장</button>	
										<a id="button" class="btn btn-red btn-xl btn-submit" href="mypageDelete.do?user_email=${sessionScope.user_email }">회원 탈퇴</a>		
									</div>
							</fieldset>
						</form>
						<!-- END Notification Channel -->
					</div>
					<!--  -->
				</div>
			</div>
		</div>
	</div>
</div>
<!--  myPage 사이드바 <div> 부분 -->


<script type="text/javascript">

function updatego() {
	
	if(($("#m_password").val()).trim() == ""){
		
		var user_pw = "${userVO.user_password}";
    	//alert("회원이 비번변경안함 : " + user_pw);
    	
    	document.getElementById("m_password").value = user_pw;
    	confirm("변경하시겠습니까?");
    	var mypageUpdateForm = document.getElementById("form_accountsetting");
		mypageUpdateForm.action="mypageUpdate.do";
		mypageUpdateForm.submit();
 	}else{
 		var m_password =  $.trim($("#m_password").val());
 	    if (m_password=="") {
 	        alert('패스워드를 입력해주세요..');
 	        $("#m_password").focus();
 	        return false;
 	    }

 	    var m_password2 = $.trim($("#m_password2").val());
 	    if (m_password2=="") {
 	        alert('패스워드 확인을 입력해주세요.');
 	        $("#m_password2").focus();
 	        return false;
 	    }
 		
 		if(m_password != m_password2){
 			alert('패스워드가 일치하지 않습니다. 다시 확인바랍니다.');
 			$("#m_password2").focus();
 	        return false;
 		}
 		var pwd_chk = $("#login_pwd_chk").val();
 		if(pwd_chk == 0){
 			alert('비밀번호 안전도 올려올려');
 			$("#m_password").focus();
 			return false;
 		}
   		//alert("회원이 비번 변경 함"); 

		if(confirm("변경하시겠습니까?")){
			var mypageUpdateForm = document.getElementById("form_accountsetting");
			mypageUpdateForm.action="mypageUpdate.do";
			mypageUpdateForm.submit();
		}else{
			alert("변경실패");
			return;
		}
 	}
}

/* function delete() {
	alert("탈퇴");
	var mypageDeleteForm = document.getElementById("form_accountsetting");
	mypageDeleteForm.action="mypageDelete.do";
	mypageDeleteForm.submit();
} */

</script>

<%@ include file="footer.jsp"%>