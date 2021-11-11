<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
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
 
<link rel="stylesheet" href="resources/css/mypage/trackOrder.css">
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="resources/js/join/datepicker.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/join/orderhistory.css">

<!--Retina.js plugin - @see: http://retinajs.com/-->
<script src="/m/appstrap/plugins/retina/js/retina-1.1.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts --> 
<script src="/m/appstrap/js/jquery.min.js"></script>
<script src="/m/appstrap/js/jquery-migrate-1.2.1.min.js"></script> <!--Legacy jQuery support for quicksand plugin--> 
<script src="resources/js/commons.js"></script>
</head>
<body>

	<div style="padding: 40px 0px 40px;">
		<div class="container" id="sub-page-content">
			<div class="row">
				<div class="col-md-3 sidebar">
					<div class="section-menu">
						<ul class="nav nav-list">
							<li class="nav-header lnb-header">마이페이지<span>MyPage</span></li>
							<li><a href="mypageupdate.do" class="first">마이페이지<small>MyPage</small><i class="fa fa-angle-right"></i></a></li>
							<li><a href="addressBook.do" class="first">주소<small>Address</small><i class="fa fa-angle-right"></i></a></li>
							<li><a href="trackOrder.do" class="first">주문조회<small>Order check</small><i class="fa fa-angle-right"></i></a></li>
							<li class="active"><a href="orderHistory.do" class="first">주문내역<small>Order details</small><i class="fa fa-angle-right"></i></a></li>
							<li><a href="coupon.do" class="first">쿠폰함<small>Coupon</small><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>			
				</div>

<script>
$(function () {
    $('#btn_empty').click( function() {
        $( '#table_historyorder > tbody').empty();
    });
});

function goSearch(){
	var frm  = document.orderHistoryFind;
	frm.method = "GET";
	frm.action = "/search.do";
	frm.submit();
}

$(function(){
	if(${start_history != null && start_history != "" && end_history != null && end_history != ""}){
		$('#start_history').val("${start_history}");
		$('#end_history').val("${end_history}");
	}
	
	$("#btnSearch").click(function(){
		goSearch()
	});
	
});
</script>
  	<div class="container" id="sub-page-content">
      <!--main content-->
      <div class="col-md-9">
		<h3 class="title-divider mt_0"><span>주문내역</span> <small>Order History</small></h3>
		<form name="orderHistoryFind" method="post" action="orderHistory.do">
		<input type="hidden" value="#회원번호값" name="user_seq">
			<div class="form-group">
				<input type="text" name="start_history" id="start_history" maxlength="10" readonly="readonly" /> 
					&nbsp;	-  &nbsp; 
				<input type="text" name="end_history" id="end_history" maxlength="10"  readonly="readonly" />
					&nbsp;&nbsp;&nbsp;<a href="" class="btn btn-md btn-red" id="btnSearch">검색</a>
					     <a href="javascript:historySearch()" id="btn_empty" class="btn btn-md btn-red" >초기화</a>
				<table class="table_historyorder" id="table_historyorder">
			         <thead class="table_head_historyorder">
			            <tr>
			               <td class="table_head_td">주문 번호</td>
			               <td class="table_head_td">주문 날짜</td>
			               <td class="table_head_td">배송지</td>
			               <td class="table_head_td">요청 사항</td>
			            </tr>
			         </thead>
			         <c:forEach items="${paymentVO }" var="paymentVO" varStatus="status">
			         <tbody class="table_body_historyorder">
			            <tr>
			               <td class="table_head_td">${paymentVO.order_seq }</td>
			               <td class="table_head_td"><fmt:formatDate pattern="yyyy-MM-dd" value="${paymentVO.order_date }" /></td>
			               <td class="table_head_td">${paymentVO.user_address }</td>               
			               <td class="table_head_td">${paymentVO.order_comment}</td> 
			            </tr>
			         </tbody>
			        </c:forEach>
			      </table>
			</div>
			<hr>
		</form>
      </div>
     </div>
	  <!-- //content -->
<!--Hidden elements - excluded from jPanel Menu on mobile-->
</html>
</body>