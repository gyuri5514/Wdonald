<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-area-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-pie-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/datatables-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>
<!-- !! Admin Main !! -->
<style>
#today_total{
	float:right;
}
</style>
<script type="text/javascript">
	$(function(){
		if(${message != null}) {
			alert(${message});
			location.href="login.mdo";
		}
	});
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">WDonald   <span id="today_total">일일합계 : <fmt:formatNumber value="${today_total }" type="currency" var="currencyType"/>${currencyType}</span></h1> 
			<ol class="breadcrumb mb-4">
				<!-- <li class="breadcrumb-item active">WinDelivery</li> -->
			</ol>
			<div class="row">
				
	 			</div>
			<!-- Ã¬Â°Â¨Ã­ÂÂ¸ -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> 일별 매출액&nbsp;&nbsp;
						&nbsp;&nbsp;	합계 : <span id="totalspan"></span>
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="40"></canvas>
							<script type="text/javascript">
//Set new default font family and font color to mimic Bootstrap's default styling

Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
// Area Chart Example
var total =0;
var max =0;
var today_sales= 0;
var jsonChart =  ${chartList};

var labels = jsonChart.map(function(e){
   return e.daily_chart;
})

var data = jsonChart.map(function(e){
   total += e.sales_amount;
   
   if(e.sales_amount>max)
      max = e.sales_amount;
   
   return e.sales_amount;
})
$('#totalspan').html(total);
var options = {
       scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: (max+10000),
                maxTicksLimit: 5
              },
              gridLines: {
                color: "rgba(0, 0, 0, .125)",
              }
            }],
          },
          legend: {
            display: false
          }
 }

var dataSets =  [{
    label: "sales amount",
    lineTension: 0.3,
    backgroundColor: "rgba(2,117,216,0.2)",
    borderColor: "rgba(2,117,216,1)",
    pointRadius: 5,
    pointBackgroundColor: "rgba(2,117,216,1)",
    pointBorderColor: "rgba(255,255,255,0.8)",
    pointHoverRadius: 5,
    pointHoverBackgroundColor: "rgba(2,117,216,1)",
    pointHitRadius: 50,
    pointBorderWidth: 2,
    data: data
  }];

var chartData = {
    labels: labels,
    datasets: dataSets
  }

var ctx = document.getElementById("myAreaChart").getContext('2d');

var myLineChart = new Chart(ctx,{
     type: 'line',
     data:chartData,
     options: options
   });

							</script>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> 월별 매출액 지점 순위
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100%" height="40"></canvas>
							<script type="text/javascript">
//Set new default font family and font color to mimic Bootstrap's default styling

Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
// Area Chart Example
var total =0;
var max =0;
var today_sales= 0;
var jsonChart =  ${storeSalesRank};

var labels = jsonChart.map(function(e){
   return e.store_name+(" : ")+e.store_code;
})

var data = jsonChart.map(function(e){
   total += e.sales_amount;
   
   if(e.sales_amount>max)
      max = e.sales_amount;
   
   return e.sales_amount;
})
$('#totalspan').html(total);
var options = {
       scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: (max+10000),
                maxTicksLimit: 5
              },
              gridLines: {
                color: "rgba(0, 0, 0, .125)",
              }
            }],
          },
          legend: {
            display: false
          }
 }

var dataSets =  [{
    label: "sales amount",
    lineTension: 0.3,
    backgroundColor: "rgba(2,117,216,0.2)",
    borderColor: "rgba(2,117,216,1)",
    pointRadius: 5,
    pointBackgroundColor: "rgba(2,117,216,1)",
    pointBorderColor: "rgba(255,255,255,0.8)",
    pointHoverRadius: 5,
    pointHoverBackgroundColor: "rgba(2,117,216,1)",
    pointHitRadius: 50,
    pointBorderWidth: 2,
    data: data
  }];

var chartData = {
    labels: labels,
    datasets: dataSets
  }

var xtx = document.getElementById("myBarChart").getContext('2d');
var myBarChart = new Chart(xtx,{
    type: 'bar',
    data:chartData,
    options: options
  });
							</script>
						</div>
					</div>
				</div>
			</div>
			<!-- 표 -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>
					매장 리스트
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>매장 이름</th>
								<th>매장 코드</th>
								<th>관리자</th>
								<th>매장 주소</th>
								<th>매장 번호</th>
								<th>매장 상태</th>
							</tr>
						</thead>
					    <!-- <tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot> -->
						
						<tbody>
						<c:forEach items="${adminList}" var="adminList">
							<tr>
								<td><a href="storeUpdate.mdo?admin_seq=${adminList.admin_seq}">${adminList.store_name}</a></td>
								<td>${adminList.store_code }</td>
								<td>${adminList.admin_name }</td>
								<td>${adminList.store_address }</td>
								<td>${adminList.store_phone }</td>
								<td>
								<c:set var="status" value="${adminList.store_status }" />
									<c:choose>
										<c:when test="${status eq '1' }">정상영업</c:when>
										<c:when test="${status eq '0' }"><span style="color:red;">영업마감</span></c:when>	
										<c:when test="${status eq '2' }"><span style="color:blue;">준비중</span></c:when>										
									</c:choose>
								</td>
							</tr>
							</c:forEach> 
						</tbody>
						
					</table>
					<%-- <div class='btnPaging'>
							<ul class="pagination pagination-sm" >
								<c:if test="${pageMaker.prev}">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/index.mdo?page=${pageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a>
								</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/index.mdo?page=${pageNum}"/>'><i class="">${pageNum}</i></a>
								</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
								<li class="page-item">
									<a class="page-link" href='<c:url value="index.mdo?page=${pageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a>
								</li>
								</c:if>
							</ul>
						</div> --%><!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</main>


<%@ include file="footer.jsp" %>
