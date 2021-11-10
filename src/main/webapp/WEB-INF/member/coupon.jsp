<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>McDonald's Crew</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- @todo: fill with your company info or remove -->
<meta name="description" content="">
<meta name="author" content="Themelize.me">

<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901">
<script src="https://kit.fontawesome.com/d0b304acae.js"
	crossorigin="anonymous"></script>
<!-- fontawesomeCDN -->

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
<link href="/m/appstrap/css/colour-red_sh.css" id="colour-scheme"
	rel="stylesheet">

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
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed"
	href="/m/appstrap/img/icons/default.png">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti'
	rel='stylesheet' type='text/css'>

<!--Retina.js plugin - @see: http://retinajs.com/-->
<script src="/m/appstrap/plugins/retina/js/retina-1.1.0.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/m/appstrap/js/jquery.min.js"></script>
<script src="/m/appstrap/js/jquery-migrate-1.2.1.min.js"></script>
<!--Legacy jQuery support for quicksand plugin-->
<script src="resources/js/commons.js"></script>
<style type="text/css">
table{	
	border-radius: 3px;
   	box-shadow: inset 0 0 8px #bcbcbc;
   	width: auto;
}
.table-panel td, .table-panel th {
    padding: 15px 24px;
    border: 1;
    border-bottom: 1px solid #bcbcbc;
    text-align: left;
}
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    /* text-align: -internal-center; */
    text-align: center;
}
.table-addressbook .address-number {
    font-family: "Din Black",sans-serif;
    font-size: 1.5rem;

    
}
.table-default td, .table-default th {
    /* vertical-align: top; */
     
}
.table-addressbook tfoot .actions, .table-mycards .controls, .table-mycards tfoot .actions {
    text-align: right;
    
  
}
#address-number{
	font-family:"Din Black",sans-serif;
	font-size:24px;
	font-size:1.5rem;
	width:5%
}
.address-details,.table-addressbook .special-instructions{
	width:40%
}
</style>
</head>

<div style="padding: 40px 0px 40px;">
	<div class="container" id="sub-page-content">
		<div class="row">
			<div class="col-md-3 sidebar">
				<div class="section-menu">
					<ul class="nav nav-list">
						<li class="nav-header lnb-header">마이페이지<span>MyPage</span></li>
						<li ><a href="mypageupdate.do" class="first">마이페이지<small>MyPage</small><i class="fa fa-angle-right"></i></a></li>
						<li><a href="addressBook.do" class="first">주소<small>Address</small><i class="fa fa-angle-right"></i></a></li>
						<li><a href="trackOrder.do" class="first">주문조회<small>Order check</small><i class="fa fa-angle-right"></i></a></li>
						<li><a href="orderHistory.do" class="first">주문내역<small>Order details</small><i class="fa fa-angle-right"></i></a></li>
						<li class="active"><a href="coupon.do" class="first">쿠폰함<small>Coupon</small><i class="fa fa-angle-right"></i></a></li>
					</ul>
				</div>
			</div>
		
			<!-- coupon -->
<div class="col-md-9">
	<h3 class="title-divider mt_0">
		<span>쿠폰</span><small>Coupon</small>
	</h3>
			<table class="table-default table-panel table-addressbook">
				<thead>
					<tr>
						<th scope="colgroup" colspan="2"><h3>쿠폰</h3></th>
						<th scope="col"><h3>만료 날짜</h3></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tfoot>
					<td colspan="4" class="actions">
						<!-- <a class="btn btn-red btn-lg" href="addressupdate.do">새로운 주소 추가</a>	 -->	
						<a class="btn btn-red btn-lg" href="main.do">메인화면으로 이동</a>
					</td>
				</tfoot>
				<c:forEach items="${addressVO}" var="addressBook" varStatus="status"> 
				<tbody>
					<tr>
						<td class="address-number">${status.count}</td>
						<td class="address-details">
							<!-- <div>${addressBook.address1}</div> gogogo -->
							<div>${addressBook.address1}</div>
							 <div>${addressBook.address2}</div>
						</td>
						<td class="special-instructions">${addressBook.order_comment}</td>
						<td class="controls">
						 <a class="text-gray-light" title="주소 삭제하기" onclick="del(${addressBook.address_seq})"><i class="far fa-trash-alt"></i>
						<!-- <input id="key" value="0" type="text"/> --> </a>
						 </td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
		</div>
			
			
<%@ include file="footer.jsp"%>