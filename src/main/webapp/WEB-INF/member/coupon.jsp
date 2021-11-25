<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!-- @todo: fill with your company info or remove -->
<meta name="description" content="">
<meta name="author" content="Themelize.me">

<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901">
<script src="https://kit.fontawesome.com/d0b304acae.js" crossorigin="anonymous"></script>
<!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">

<link rel="shortcut icon" href="/m/appstrap/img/icons/favicon.png">

<!--Retina.js plugin - @see: http://retinajs.com/-->
<script src="/m/appstrap/plugins/retina/js/retina-1.1.0.min.js"></script>


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
	width:30%
}
</style>
<script type="text/javascript">
function onSaleCouponBook(){
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	var popupY= (window.screen.height / 2) - (300 / 2)-150;
	window.open('couponBook.do','_blank','status=no,width=450,height=350,left='+popupX+',top='+popupY+',scrollbars=yes');
}
</script>
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
	<div><a class="btn btn-red btn-lg" href="javascript:void(0);" onclick="onSaleCouponBook();">쿠폰 발급</a></div><br>
			<table class="table-default table-panel table-addressbook" id="couponTbody">
				<thead>
					<tr>
						<th scope="colgroup" colspan="2" style="padding-right: 0px;"><h3>쿠폰</h3></th>
						<th scope="col"><h3>쿠폰코드</h3></th>
						<th scope="col"><h3>만료날짜</h3></th>
						<th scope="col"><h3>사용상태</h3></th>
					</tr>
				</thead>
				<c:forEach items="${UserCouponVO}" var="coupon" varStatus="status"> 
				<tbody>
					<tr>
						<td class="table-addressbook"></td>
						<td class="address-details">
							<div>${coupon.coupon_name}</div>
						</td>
						<td >${coupon.coupon_code}</td>
						<fmt:formatDate var="couponEndDate" value="${coupon.coupon_enddate}" pattern="yyyy.MM.dd"/>
						<td class="special-instructions">${couponEndDate}</td>
						<td class="controls">
						<c:if test="${coupon.coupon_status == 0}">
							미사용
						</c:if>
						<c:if test="${coupon.coupon_status == 1}">
							사용완료
						</c:if>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
		</div>
		
			
<%@ include file="footer.jsp"%>