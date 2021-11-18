<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<!--  -->
<script src="https://kit.fontawesome.com/d0b304acae.js"
	crossorigin="anonymous"></script>
<!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->

<!-- Font Awesome -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!--  -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="/js/jquery/ui/themes/base/jquery-ui.css" />

<script src="resources/js/join/datepicker.js"></script>

<!--  -->
<script type="text/javascript">
function getNewChart(){
	var start_date = $('input[name="start_date"]').val();
	var end_date = $('input[name="end_date"]').val();
	var date_term = $('input[name="date_term"]:checked').val();
	var type = $('input[name="type"]:checked').val();
	var order_status = $('input[name="order_status"]:checked').val();
	console.log(start_date);
	console.log(end_date);
	console.log(date_term);
	console.log(type);
	console.log(order_status);
	$.ajax({
		type:"post",
		url: "getNewChart.sdo",
		async :false,
		data : JSON.stringify({
			"start_date" : start_date,
			"end_date" : end_date,
			"date_term" : date_term,
			"type" : type,
			"order_status" : order_status
		}),
		contentType :"application/json"
	}).done(function(res){
		console.log(res);
	})
}
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">차트</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.jsp">WinDelivery</a></li>
				<li class="breadcrumb-item active">Charts</li>
			</ol>
			<div class="card mb-4"  style="width:50%;">
				<div class="card-body">
					<div class="form-check">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="date_term"
								id="flexRadioDefault2" checked value="daily"> <label
								class="form-check-label" for="flexRadioDefault2"> 일 별</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="date_term"
								id="flexRadioDefault1" value="month"> <label
								class="form-check-label" for="flexRadioDefault1"> 월 별</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="date_term"
								id="flexRadioDefault1" value="year"> <label
								class="form-check-label" for="flexRadioDefault1"> 년 별</label>
						</div>
						<div class="form-check">
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type"
								id="flexRadioDefault2" checked value="none"> <label
								class="form-check-label" for="flexRadioDefault2"> 없 음</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type"
								id="flexRadioDefault1" value="gender"> <label
								class="form-check-label" for="flexRadioDefault1"> 성 별</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type"
								id="flexRadioDefault1" value="pay_status"> <label
								class="form-check-label" for="flexRadioDefault1"> 결제 유형</label>
						</div>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="order_status"
								id="flexRadioDefault1" checked value="배달 완료"> <label
								class="form-check-label" for="flexRadioDefault1"> 배달 완료</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="order_status"
								id="flexRadioDefault1" value="주문 취소"> <label
								class="form-check-label" for="flexRadioDefault1"> 주문 취소</label>
						</div>
						<br>
							<input type="text" name="start_date" id="start_history"
						maxlength="10" readonly="readonly" /> &nbsp; ~ &nbsp; <input
						type="text" name="end_date" id="end_history" maxlength="10"
						readonly="readonly" />
					<button type="button" class="btn btn-warning"
						onclick='getNewChart()'>검색</button>

				</div>
				<div class="card-body"></div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i><span id="sales_term">20${start_date }
						~ 20${end_date } 별 매출</span>
				</div>
				<div class="card-body">
					<canvas id="myChart" width="100%" height="30"></canvas>

				
					<script type="text/javascript">
					//Set new default font family and font color to mimic Bootstrap's default styling

					Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
					Chart.defaults.global.defaultFontColor = '#292b2c';

					// Area Chart Example

					var jsonChart =  ${chartList};

					var labels = jsonChart.map(function(e){
						return e.daily_chart;
					})
					 for(var i in labels){
					console.log(labels[i])
					}
					console.log(labels); 
					var data = jsonChart.map(function(e){
						return e.sales_amount;
					})
					 for(var i in data){
						console.log(data[i])
						}
					console.log(data); 
					var ctx = document.getElementById("myChart");
					var myLineChart = new Chart(ctx,{
						  type: 'line',
						  data: {
						    labels: labels,
						    datasets: [{
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
						    }]
						  },
						  options: {
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
						          max: (${max}+10000),
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
						});
					</script>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> 월별 총 매출액
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100%" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-pie me-1"></i> 상품 인기순
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>