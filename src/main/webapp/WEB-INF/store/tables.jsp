<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	/* th:nth-of-type(1) {display:none;}
	td:nth-of-tpye(1) {display:none;} */
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">주문</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">주문</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					DataTables is a third party plugin that is used to generate the
					demo table below. For more information about DataTables, please
					visit the <a target="_blank" href="https://datatables.net/">official
						DataTables documentation</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> DataTable Example
				</div>
				<form action="">
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th style="display:none;">seq</th>
								<th>주문 날짜</th>
								<th>주소</th>
								<th>주문자</th>
								<th>주문자번호</th>
								<th>결제금액</th>
								<th>주문 상태</th>
							</tr>
						</thead>
						<!--  <tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot>  -->
						<c:forEach items="${orderList}" var="orderList">
						
						<fmt:formatDate var="orderDate" value="${orderList.order_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
						<tbody>
							<tr>
								<td style="display:none;">${orderList.order_seq}</td>
								<td>${orderDate}</td>
								<td>${orderList.user_address}</td>
								<td>${orderList.user_name}</td>
								<td>${orderList.user_phone}</td>
								<td>${orderList.final_price}</td>
								<%-- <td>${orderList.order_status}</td> --%>
								<!-- Split button -->
								<td>
									<div class="btn-group" style="width: 80%; margin: 0 auto">
										<select id="order_status${orderList.order_seq}" name="order_status" class="btn btn-Default dropdown-toggle">
											<option value="">${orderList.order_status}</option>
											<option value="주문접수">주문 접수</option>
											<option value="준비 중">준비 중</option>
											<option value="배달 중">배달 중</option>
											<option value="배달 완료">배달 완료</option>
										</select>
									</div>
									<input type="button" class="btn btn-warning" class="checkBtn" onclick="orderCheck('${orderList.order_seq}')" value="확인"/>
								</td>
							</tr>
						</tbody>
					</c:forEach>
					</table>
				</div>
				</form>
			</div>
		</div>
	</main>

	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">WinDelivery &copy; 대표이사 : Tommy.Lee </div>
				<div>
					<a href="../main.sdo">Privacy Policy</a> &middot; <a href="#">Term
						&amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>

<script type="text/javascript">
	
	function orderCheck(order_seq){
		var order_seq = order_seq;
		
		
		var order_status = $("select[id=order_status"+order_seq+"]").val();
		

		console.log("엥" + order_status);

		$.ajax({
			url:"tables.sdo",
			data:{ order_seq : order_seq,
					order_status : order_status
				},
			//dataType : "json",
			type : "get",
			success:function(data){				
				//alert("success ???");

			},error:function(){
				alert("failed");
			}
		})
		
		//var tdArr = new Array();
		console.log("zz?" + order_seq);
	}
	
</script>

</body>
</html>
