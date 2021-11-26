<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script>
	$('#dataTable-selector').click(function(){
		alert('perPageNum' + $('#dataTable-selector').val());
	})
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">회원 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">HOME</a></li>
				<li class="breadcrumb-item active">윈딜리버리 회원</li>
			</ol>
			<div style="height: 100vh">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 윈딜리버리 회원 내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>회원 이름</th>
									<th>회원 이메일</th>
									<th>회원 전화번호</th>
									<th>회원 등록일</th>
									<th>회원 상태</th>
									<th>문자 수신동의</th>
									<th>이메일 수신동의</th>
									<th>회원 삭제</th>
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
												<c:when test="${status eq '0'}">탈퇴</c:when>
												<c:when test="${status eq '1'}">정상</c:when>
												<c:when test="${status eq '2'}">회원정지</c:when>
												<c:when test="${status eq '3'}">이메일 미인증</c:when>
												<c:when test="${status eq '4'}">카카오 로그인</c:when>
												<c:when test="${status eq '5'}">네이버 로그인</c:when>
												<c:when test="${status eq '9'}">비회원</c:when>
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
										<button id="infoSuspend${userInfo.user_seq }" class="btn btn-warning" onclick="suspendUser('${userInfo.user_seq}','${userInfo.user_name}',2);">정지</button></c:if>
										<c:if test="${status eq '2'}">
										<button id="infoActive${userInfo.user_seq }" class="btn btn-success" onclick="suspendUser('${userInfo.user_seq}','${userInfo.user_name }',1);">활성화</button></c:if></th>
									</tr>
									</c:forEach>
								</tbody>
							
						</table>
						<script type="text/javascript">
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