<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>WDelivery 관리자</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyles.css?ver=1.1"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
</head>
<body class="sb-nav-fixed">
   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="index.mdo">관리자 Win Delivery</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
         <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
         <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button">
               <i class="fas fa-search"></i>
            </button>
         </div>
      </form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
      
      <c:choose>
         <c:when test="${not empty sessionScope.admin }">
            <h1 class="navbar-brand">${sessionScope.admin.admin_name}님 안녕하세요.</h1>
            <a class="navbar-brand ps-3" style="width: 100px" href="logout.mdo">로그아웃</a>
         </c:when>
         <c:otherwise>
            <a class="navbar-brand ps-3" style="width: 100px" href="login.mdo">로그인</a>
         </c:otherwise>
      </c:choose>
         <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               <i class="fas fa-user fa-fw"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
               <li><a class="dropdown-item" href="#!">Settings</a></li>
               <li><a class="dropdown-item" href="#!">Activity Log</a></li>
               <li><hr class="dropdown-divider" /></li>
               <li><a class="dropdown-item" href="logout.mdo">Logout</a></li>
            </ul>
         </li>
      </ul>
   </nav>
   <div id="layoutSidenav"> <!-- 토글 -->
      <div id="layoutSidenav_nav">
         <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
               <div class="nav">
                  <div class="sb-sidenav-menu-heading">Core</div>
                  <a class="nav-link" href="index.mdo">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-tachometer-alt"></i>
                     </div> Dashboard
                  </a>
                  <div class="sb-sidenav-menu-heading">관리</div>
                     <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBanner" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"> 
                           <i class="fas fa-columns"></i>
                        </div> 배너 관리
                        <div class="sb-sidenav-collapse-arrow">
                           <i class="fas fa-angle-down"></i>
                        </div>
                     </a>
                     <div class="collapse" id="collapseBanner" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                           <a class="nav-link" href="banner.mdo">배너 관리</a> 
                        </nav>
                     </div>
                      <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMenu" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"> 
                           <i class="fas fa-columns"></i>
                        </div> 메뉴 관리
                        <div class="sb-sidenav-collapse-arrow">
                           <i class="fas fa-angle-down"></i>
                        </div>
                     </a>
                     <div class="collapse" id="collapseMenu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                              <nav class="sb-sidenav-menu-nested nav">
                                 <a class="nav-link" href="burger.mdo">Burger</a> 
                                 <a class="nav-link" href="winMorning.mdo">WinMorning</a>
                                 <a class="nav-link" href="side.mdo">Side & Dessert</a>
                                 <a class="nav-link" href="drink.mdo">Drink</a>
                                 <a class="nav-link" href="happyMeal.mdo">Happymeal & Toy</a>
                                <!--  <a class="nav-link" href="500.mdo">500 Page</a> -->
                           </div>
                     <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"> <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!! Layouts 페이지 필요없을 듯 !!!!!!!!!!!!!!!!!!!! -->
                           <i class="fas fa-columns"></i>
                        </div> 게시판 관리
                        <div class="sb-sidenav-collapse-arrow">
                           <i class="fas fa-angle-down"></i>
                        </div>
                     </a>
                     <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">

                           <a class="nav-link" href="layoutStatic.mdo">회원관리</a> 
                           
                           <a class="nav-link" href="layout-sidenav-light.mdo">쿠폰관리</a>

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
                           관리자 로그인
                           <div class="sb-sidenav-collapse-arrow">
                              <i class="fas fa-angle-down"></i>
                           </div>
                        </a>
                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
					<nav class="sb-sidenav-menu-nested nav">
					<c:choose>
						<c:when test="${not empty sessionScope.admin }">
							<a></a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href="login.mdo">로그인</a>
						</c:otherwise>
					</c:choose>
						<a class="nav-link" href="register.mdo">매장 등록</a>
						<!-- <a class="nav-link" href="password.mdo">Forgot Password</a> --> <!-- 필요없음 -->
					</nav>
					</div>
                    </nav>
                  </div>
                  <div class="sb-sidenav-menu-heading">통계</div>
                  <a class="nav-link" href="charts.mdo">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-chart-area"></i>
                     </div> 통계
                  </a>
                  <a class="nav-link" href="tables.mdo">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-table"></i>
                     </div> 회원관리
                  </a>
               </div>
            </div>
            <div class="sb-sidenav-footer">
               <div class="small">Logged in as:</div>
               WinDelivery
            </div>
         </nav>
      </div>