<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
th {
	width: auto;
}

.btn-warning {
	background-color: #0d6efd;
}
</style>
<script>
	$('#dataTable-selector').click(function(){
		alert('perPageNum' + $('#dataTable-selector').val());
	})
</script>
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
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">회원 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">HOME</a></li>
				<li class="breadcrumb-item active">윈딜리버리 회원</li>
			</ol>
				<canvas id="myPieChart" style="width:50%; height:50%; margin-bottom: 10px"></canvas>
			<div style="height: 100">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 윈딜리버리 회원 내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="width: auto;">회원 이름</th>
									<th style="width: auto;">회원 이메일</th>
									<th style="width: auto;">회원 전화번호</th>
									<th style="width: auto;">회원 등록일</th>
									<th style="width: auto;">회원 상태</th>
									<th style="width: auto;">문자 수신동의</th>
									<th style="width: auto;">이메일 수신동의</th>
									<th style="width: auto;">회원 삭제</th>
								</tr>
							</thead>
								<tbody>
								<c:forEach items="${userInfo}" var="userInfo">
									<tr id="${userInfo.user_seq }">
										<td>${userInfo.user_name}</td>
										<td>${userInfo.user_email}</td>
										<td>${userInfo.user_phone}</td>
										<td><fmt:formatDate value="${userInfo.user_regdate}"
												pattern="yyyy-MM-dd" /></td>
										<td><c:set var="status" value="${userInfo.user_status }" />
											<c:choose>
												<c:when test="${status eq 0}">탈퇴</c:when>
												<c:when test="${status eq 1}">정상</c:when>
												<c:when test="${status eq 2}">회원정지</c:when>
												<c:when test="${status eq 3}">이메일 미인증</c:when>
												<c:when test="${status eq 4}">카카오 로그인</c:when>
												<c:when test="${status eq 5}">네이버 로그인</c:when>
												<c:when test="${status eq 9}">비회원</c:when>
												<c:when test="${status eq 7}">휴면계정</c:when>
											</c:choose></td>
										<td><c:set value="${userInfo.sms_agree }" var="sms" /> <c:choose>
												<c:when test="${sms eq '0'}">미동의</c:when>
												<c:when test="${sms eq '1'}">동의</c:when>
											</c:choose></td>
										<td><c:set value="${userInfo.email_agree }" var="email" />
											<c:choose>
												<c:when test="${email eq '0'}">미동의</c:when>
												<c:when test="${email eq '1'}">동의</c:when>
											</c:choose></td>
										<th><button id="infoDelete" class="btn btn-danger" onclick="deleteUser('${userInfo.user_seq}','${userInfo.user_name}');">삭제</button><c:if test="${status ne '2'}">
										<button id="infoSuspend${userInfo.user_seq }" style="width:auto; margin: auto;" class="btn btn-warning" onclick="suspendUser('${userInfo.user_seq}','${userInfo.user_name}',2);">정지</button></c:if>
										<c:if test="${status eq '2'}">
										<button id="infoActive${userInfo.user_seq }" class="btn btn-success" onclick="suspendUser('${userInfo.user_seq}','${userInfo.user_name }',1);">활성화</button></c:if></th>
									</tr>
									</c:forEach>
								</tbody>
							
						</table>
						<script type="text/javascript">
							Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	   		                Chart.defaults.global.defaultFontColor = '#292b2c';
	   		                
	   		             var jsonpieChart =  ${genderPie};
	   					
	   	               var plabels = jsonpieChart.map(function(e){
	   	                  return e.user_gender;
	   	               })

	   	               var pdata = jsonpieChart.map(function(e){
	   	                    return e.sales_count;
	   	               })
	   	               // Pie Chart Example
	   	               var ptx = document.getElementById("myPieChart");
	   	               var color = [
	   	            		"#FF0000","#FF5E00","#FFBB00","#FFE400","#ABF200","#1DDB16",
	   	            		"#00D8FF","#0054FF","#0100FF","#5F00FF","#FF00DD","#FF007F","#000000","#FFD8D8",
	   	            		"#FAECC5","#E4F7BA","#D4F4FA","#DAD9FF","#FFD9FA","#FFA7A7","#FFE08C","#CEF279",
	   	            		"#B2CCFF","#D1B2FF","#CC723D","#CCA63D","#9FC93C","#47C83E","#4374D9","#8041D9"
	   	               ]
	   	               var myPieChart = new Chart(ptx, {
	   	                 type: 'pie',
	   	                 data: {
	   	                   labels: plabels,
	   	                   datasets: [{
	   	                     data: pdata,
	   	                     backgroundColor: color,
	   	                   }],
	   	                 },
	   	               });
						
						
								function suspendUser(user_seq,user_name,user_status){
									if(confirm(user_name+'님 (회원번호 : '+user_seq+')을 '+(user_status==2?'정지':'활성화')+'하시겠습니까?')){
										
										$.ajax({
											type:"POST",
											url: "suspendUser.mdo",
											asnyc:false,
											data: JSON.stringify({
												"user_seq" : user_seq,
												"user_status" : user_status
											}),
											contentType:"application/json"
										}).done(function(res){
											if(res=='1'){
											$('#infoSuspend'+user_seq).text((user_status==2?'활성화':'정지'));
											$('#infoSuspend'+user_seq).attr('onclick',"suspendUser('"+user_seq+"','"+user_name+"',"+(user_status==2?1:2)+");")
											alert('successfully '+(user_status==2?'supsend ':'activate ')+user_name+' member');
											}else{
												alert('failed : 뭔가 문제가 생겼어요.');
											}
										})
									}
								}
								function deleteUser(user_seq,user_name){
									if(confirm('회원 삭제 기능은 데이터베이스에서 삭제되는 기능입니다. 정말로 '+user_name+'님을 삭제하시겠습니까?')){
										if(confirm(' 진짜로 '+user_name+'님을 삭제하시겠습니까?')){
											if(confirm(' 진짜 ?')){
												$.ajax({
													type:"POST",
													url: "deleteUser.mdo",
													asnyc:false,
													data: JSON.stringify({
														"user_seq" : user_seq
													}),
													contentType:"application/json"
												}).done(function(res){
													console.log("seq " + user_seq);
													if(res=='1'){
														console.log("success");
														alert('successfully delete '+user_name+' member');
														$('#'+user_seq).remove();
													}else{
														console.log("no");
														alert('failed : 뭔가 문제가 생겼어요.');
													}
												})
											}
										}
									}
								}
						</script>
						<!-- 페이징 끝 -->
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>