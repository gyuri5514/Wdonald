<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>couponBook</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table{	
	border-radius: 3px;
   	box-shadow: inset 0 0 8px #bcbcbc;
   	width: 100%;
}
.table-panel td, .table-panel th {
    padding: 5px 11px;
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
    background-color: rgb(255, 165, 0);
}
.table-addressbook .address-number {
    font-family: "Din Black",sans-serif;
}
.table-default td, .table-default th {
    /* vertical-align: top; */
     
}
.table-addressbook tfoot .actions, .table-mycards .controls, .table-mycards tfoot .actions {
    text-align: center;
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
#takeThis{
margin-right:10px;
float : right;
}
</style>

</head>
<body>
	<table class="table-default table-panel table-addressbook">
				<thead>
					<tr>
						<th scope="colgroup" colspan="5">쿠폰 목록</th>
					</tr>
				</thead>
				<c:forEach items="${myCouponList}" var="couponBook"> 
				<tbody>
					<tr>
						<td class="address-number" colspan="3"><small>
							${couponBook.coupon_title}
							<c:if test="${couponBook.coupon_type =='freebie' }">(증정)</c:if>
							<c:if test="${couponBook.coupon_type =='discount' }">(할인)</c:if>
							&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${couponBook.coupon_enddate}" var="couponEndDate" pattern="yyyy-MM-dd"/>${couponEndDate} 까지
									<a href="javascript:void(0);" 
											onclick="applyCoupon('${couponBook.coupon_type}','${couponBook.coupon_code}','${couponBook.coupon_discount}','${couponEndDate }','${couponBook.coupon_title}');" id="takeThis">적용</a>
							</small>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table><br>
			<div align="center"><a href="javascript:close();">닫기</a></div>
</body>
<script type="text/javascript">
function applyCoupon(coupon_type,code,discount,enddate,coupon_title){
	var price = ${price};
	
	var coupon_final_title = coupon_title+'('+(coupon_type=='discount'?'할인':'증정')+')'
	console.log(coupon_type+' '+discount+' '+enddate
			+' '+coupon_title+' '+price+' '+coupon_final_title);
	if(coupon_type=='discount' && (price-discount)<10000){
		alert('할인 적용시 최종금액이 만원 이상인 결제에만 쿠폰 적용가능합니다.')
		return false;
	}
	
	if(coupon_type=='discount'){
		var totalprice = price - discount;
		$('#discount',opener.document).val(0);
		$('#discount',opener.document).val(discount);
		$('#spanPrice',opener.document).text(numberWithCommas(totalprice));
	}else if(coupon_type=='freebie'){
		$('#discount',opener.document).val(0);
		$('#spanPrice',opener.document).text(numberWithCommas(price));
	}
	if($('#coupon_code',opener.document).val()==code){
			alert('현재 적용중인 쿠폰입니다.');
			return false;
	}
	$('#coupon_title',opener.document).val(coupon_final_title);
	$('#coupon_code',opener.document).val(code);
	$('#couponCode',opener.document).val(coupon_final_title);
	
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
</html>