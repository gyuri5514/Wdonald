<!-- 관리자 로그인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyles.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-black">
<c:if test="${!empty status }">
	<c:choose>
		<c:when test="${status eq 1}">
		<script>
			alert('관리자 아이디를 다시 입력해주세요.');
			</script>
		</c:when>
		<c:when test="${status eq 3}">
		<script>
			alert("관리자 비밀번호를 다시 확인해주세요.");
		</script>
		</c:when>
		
	</c:choose>
</c:if>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">관리자 로그인</h3>
								</div>
								<div class="card-body">
									<form action="login.mdo" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="admin_id" id=""placeholder="name@example.com" />
											<label for="inputEmail">Id</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="admin_password" id="inputPassword" type="password" placeholder="Password" />
											<label for="inputPassword">Password</label>
										</div>
										<div class="form-check mb-3">
											<!-- <input class="form-check-input" id="inputRememberPassword"
												type="checkbox" value="" /> <label class="form-check-label"
												for="inputRememberPassword">Remember Password</label> -->
										</div>
										<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small"></a>
											<input type="submit" class="btn btn-danger" value="로그인"/>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="register.mdo">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../resources/js/scripts.js"></script>

</body>
</html>
