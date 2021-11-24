<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>couponBook</title>
<style>
table{	
	border-radius: 3px;
   	box-shadow: inset 0 0 8px #bcbcbc;
   	width: auto;
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
</style>
<%-- <c:if test="${addressList eq 'emptyAddress' }">
<script>
	alert('등록된 주소가 없습니다.');
	close();
</script>
</c:if> --%>
</head>
<body>
	<table class="table-default table-panel table-addressbook">
				<thead>
					<tr>
						<th scope="colgroup" colspan="5">쿠폰 목록</th>
					</tr>
				</thead>
				<c:forEach items="${couponList}" var="addressBook"> 
				<tbody>
					<tr>
						<td class="address-number" colspan="2"><small>
						<a href="javascript:void(0);" 
							onclick="thisOnePlease('${addressBook.address1 }','${addressBook.address2 }','${addressBook.address1 } ${addressBook.address2}','${addressBook.address_lat}','${addressBook.address_lon}','${addressBook.order_comment }')">
							${addressBook.address1} ${addressBook.address2}</a>
							</small>
						</td>
					</tr>
					<tr>
						<td class="special-instructions" colspan="5">
							<span style="margin-left: 15px;"><small>배달 시 요청사항 : ${addressBook.order_comment}</small></span>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
</body>
<script type="text/javascript">
 function thisOnePlease(address1,address2,address,lat,lon,order_comment){
	 window.opener.document.getElementById('userAddress_lat').value = lat;
	 window.opener.document.getElementById('userAddress_lon').value = lon;
	 
	 window.opener.document.getElementById('address').value = address;
	 window.opener.document.getElementById('m_zipcode').value = address1;
	 
	 window.opener.document.getElementById('addressLink').text = address1;
	 window.opener.document.getElementById('order_comment').value = order_comment;
	 
	 window.opener.document.getElementById('m_zipcode2').value = address2;
	 window.opener.document.getElementById('order_comment_out').value = order_comment;
	 window.close();
 }
</script>
</html>