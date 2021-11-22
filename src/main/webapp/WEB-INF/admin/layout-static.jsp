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
			<!-- <div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						This page is an example of using static navigation. By removing
						the
						<code>.sb-nav-fixed</code>
						class from the
						<code>body</code>
						, the top navigation and side navigation will become static on
						scroll. Scroll down this page to see an example.
					</p>
				</div>
			</div> -->
			<div style="height: 100vh">
				<!-- 표 -->
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
										<th><button id="infoDelete" onclick="deleteUser('${userInfo.user_seq}');">삭제</button><c:if test="${status ne '2'}">
										<button id="infoSuspend" onclick="suspendUser('${userInfo.user_seq}');">정지</button></c:if>
										<c:if test="${status eq '2'}">
										<button id="infoActive" onclick="activeUser('${userInfo.user_seq},${userInfo.user_name }');">활성화</button></c:if></th>
									</tr>
									</c:forEach>
								</tbody>
							
						</table>
						<script type="text/javascript">
								function deleteUser(user_seq,user_name){
									if(confirm('회원 삭제 기능은 데이터베이스에서 삭제되는 기능입니다. 정말로 '+user_name+'님을 삭제하시겠습니까?')){
										alert(user_seq);
										$.ajax({
											
										}).done(function(){
											$('#'+user_seq).remove();
										})
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