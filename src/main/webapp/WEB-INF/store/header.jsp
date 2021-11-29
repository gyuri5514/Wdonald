<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>WDelivery 관리자</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeStyles.css?ver=1.1">
<link rel="shortcut icon" type="image/x-icon" href="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/favicon.ico">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<!-- smartEditor -->
<script type="text/javascript" src="Editor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.sdo">${sessionScope.store_admin.store_name }</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div style="display: inline-block;">
				<!-- <div class="input-group" > -->
				<div class="btn-group" style="width: 80%; margin: 0 auto">
					<select id="store_status" name="store_status" class="btn btn-Default dropdown-toggle" style="background: #ffffff;
					border-radius: 5px; font-weight: 500; font-family: 'SpeedeeK';">
							<%-- <c:if test="${sessionScope.admin.store_status eq 1}">

							<option value="">정상영업</option>
							</c:if>
							<c:if test="${sessionScope.store_admin.store_status eq 2}">
							<option value="">준비 중</option>
							</c:if>
							<c:if test="${sessionScope.store_admin.store_status eq 0}">
							<option value="">영업마감</option>
							</c:if>  --%>
							<option value="1">정상영업</option>
							<option value="2">준비 중</option>
							<option value="0">영업마감</option>
					</select>
					<input type="button" class="btn btn-warning" style="margin: auto; background-color: #ffffff; color: #000000; margin-left : 5px; 
					font-weight: 500;font-family: 'SpeedeeK';border-radius: 5px;" onclick="statusSubmit()" value="확인">
					<input type="hidden" id="status2" value="${status}">
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<c:choose>
			<c:when test="${not empty sessionScope.store_admin }">
				<h1 class="navbar-brand">${sessionScope.store_admin.admin_name}님 안녕하세요.</h1>
				<a class="navbar-brand ps-3" style="width: 100px" href="logout.mdo">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a class="navbar-brand ps-3" style="width: 100px" href="login.mdo">로그인</a>
			</c:otherwise>
		</c:choose>
			<!-- <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="logout.mdo">Logout</a></li>
				</ul>
			</li> -->
		</ul>
	</nav>
	<div id="layoutSidenav"> <!-- 토글 -->
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.sdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">관리</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon"> <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!! Layouts 페이지 필요없을 듯 !!!!!!!!!!!!!!!!!!!! -->
								<i class="fas fa-columns"></i>
							</div> 문의 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
							<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="layoutStatic.sdo">1:1 고객문의</a>
									<a class="nav-link" href="layout-sidenav-light.sdo">관리자 공지</a>
								</nav>
							</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 계정 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
									관리자 정보
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
									<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<!-- <a class="nav-link" href="">관리자 정보 보기</a> -->
											<a class="nav-link" href="adminUpdate.sdo">정보수정</a>	
										</nav>
									</div>
								<!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
									Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
									<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="401.sdo">401 Page</a> 
											<a class="nav-link" href="404.sdo">404 Page</a>
											<a class="nav-link" href="500.sdo">500 Page</a>
									</div> -->
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">통계</div>
						<a class="nav-link" href="charts.sdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매장 통계
						</a>
						<a class="nav-link" href="tables.sdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 주문 관리
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					WinDelivery
				</div>
			</nav>
		</div>
		
<script type="text/javascript">
	$(function(){
		var status = $('#status2').val();
		for(var j = 0; j < $("#store_status option").length; j++) {
			if(status == $("#store_status option:eq("+j+")").val()){
				$("#store_status option:eq("+j+")").attr("selected","selected"); 
			}
		}
	})
	
	
	function statusSubmit() {
		
		var store_status = $("#store_status option:selected").val();
		
		$.ajax({
			url:"storeStatus.sdo",
			data:{ 
				store_status : store_status
			},
			dataType : "json",
			type : "get",
			success:function(data){				
				console.log(data.store_status);
				for(var i = 0; i < $("#store_status option").length; i++) {
					if(data.store_status == $("#store_status option:eq("+i+")").val()){
						$("#store_status option:eq("+i+")").attr("selected","selected"); 
					} else
						$("#store_status option:eq("+i+")").removeAttr("selected"); 
				}

			},error:function(){
				alert("failed");
			}
		})
		
	}

</script>