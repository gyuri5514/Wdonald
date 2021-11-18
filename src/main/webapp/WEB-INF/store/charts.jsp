<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>

<!--  -->
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">차트</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.jsp">WinDelivery</a></li>
				<li class="breadcrumb-item active">Charts</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					Chart.js is a third party plugin that is used to generate the
					charts in this template. The charts below have been customized -
					for further customization options, please visit the official
					<a target="_blank" href="https://www.chartjs.org/docs/latest/">
						Chart.js documentation
					</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i><span id="sales_term">${start_date } ~ ${end_date }</span>  
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
						          max: 400000,
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
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
						<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
					</div>
				</div>
			</div>
		</div>
	</main>

<%@ include file="footer.jsp" %>
