<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>버거이름</th>
				<th>버거 영어 이름</th>
				<th>버거 가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${selectBurger}" var="selectBurger">
				<tr>
					<td>${selectBurger.b_name}</td>
					<td>${selectBurger.b_e_name}</td>
					<td>${selectBurger.b_price}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>