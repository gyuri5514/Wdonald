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
<c:if test="${empty totalCouponList }">
<script>
	alert('진행중인 할인행사가 없습니다.');
	close();
</script>
</c:if> 
</head>
<body>
	<table class="table-default table-panel table-addressbook">
				<thead>
					<tr>
						<th scope="colgroup" colspan="5">쿠폰 목록</th>
					</tr>
				</thead>
				<c:forEach items="${totalCouponList}" var="couponBook"> 
				<tbody>
					<tr>
						<td class="address-number" colspan="3"><small>
							${couponBook.coupon_title}
							<c:if test="${couponBook.coupon_type =='freebie' }">(증정)</c:if>
							<c:if test="${couponBook.coupon_type =='discount' }">(할인)</c:if>
							&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${couponBook.coupon_enddate}" var="couponEndDate" pattern="yyyy-MM-dd"/>${couponEndDate} 까지
							<c:choose>
								<c:when test="${couponBook.user_seq == 0}">
									<a href="javascript:void(0);" 
											onclick="userWantThisCoupon('${couponBook.coupon_code}','${sessionScope.userInfo.user_seq }','${couponEndDate }','${couponBook.coupon_title}');" id="takeThis">받기</a>
								</c:when>
							<c:otherwise>
								<font color="green" id="takeThis">수령 완료</font>
							</c:otherwise>
						</c:choose>
							</small>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
</body>
<script type="text/javascript">
 	function userWantThisCoupon(code,user_seq,enddate,title){
 		var tbodyNode='';
 		alert(code+" "+ user_seq);
 		$.ajax({
 			type:"POST",
 			url:"registerUserCoupon.do",
 			data:JSON.stringify({
 				"user_seq" : user_seq,
 				"coupon_code" : code
 				}),	
 			contentType:"application/json"
 		}).done(function(res){
 			if(res==1){
 				 tbodyNode='<tr><td class="table-addressbook"></td><td class="address-details">'+
 				'<div>'+title+'</div></td><td >'+code+'</td>'+
 				'<td class="special-instructions">'+enddate+'</td>'+
 				'<td class="controls">미사용</td></tr>';
 				$('#couponTbody',opener.document).append(tbodyNode);
 				close();
 			}
 		})
 	}
 
</script>
</html>