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
				<li class="breadcrumb-item"><a href="index.sdo">WDonald</a></li>
				<li class="breadcrumb-item active">주문</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					매장 취소 관리 <a href="orderCancel.sdo">WDonald 취소관리</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>주문현황
				</div>
				<form action="">
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th style="display:none;">seq</th>
								<th>주문 날짜</th>
								<th>주소</th>
								<th>쿠폰명</th>
								<th>주문자</th>
								<th>주문자번호</th>
								<th>결제금액</th>
								<th>주문 상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${orderList}" var="orderList">
						<fmt:formatDate var="orderDate" value="${orderList.order_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
							<tr>
								<td style="display:none;">${orderList.order_seq}</td>
								<td>${orderDate}</td>
								<td>${orderList.user_address}</td>
								<td>${orderList.coupon_title }</td>
								<td>${orderList.user_name}</td>
								<td>${orderList.user_phone}</td>
								<td>${orderList.final_price}</td>
								<!-- Split button -->
								<td>
									<div class="btn-group" style="width: 75%; margin: 0 auto">
										<select id="order_status${orderList.order_seq}" style="border: 1px solid #dddddd;" name="order_status" class="btn btn-Default dropdown-toggle">
										<option style="background-color:#C3C3C3; border: 1px solid #dddddd;"value="">${orderList.order_status}</option>
											<option value="주문 접수" ${orderList.order_status == "주문 접수" ? 'selected="selected"':''}>주문 접수</option>
											<option value="준비 중" ${orderList.order_status == "준비 중" ? 'selected="selected"':''}>준비 중</option>
											<option value="배달 중" ${orderList.order_status == "배달 중" ? 'selected="selected"':''}>배달 중</option>
											<option value="배달 완료" ${orderList.order_status == "배달 완료" ? 'selected="selected"':''}>배달 완료</option>
										</select>
									</div>
									<input type="button" class="btn btn-warning" class="checkBtn" onclick="orderCheck('${orderList.order_seq}')" value="확인"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</form>
			</div>
		</div>
	</main>
	
	

<script type="text/javascript">
   function orderCheck(order_seq){
      var order_seq = order_seq;
      
      var order_status = $("select[id=order_status"+order_seq+"]").val();
      
      console.log("엥" + order_status.length);
      $.ajax({
         url:"tables.sdo",
         data:{ order_seq : order_seq,
               order_status : order_status
            },
         type : "get",
         success:function(data){            
            console.log(order_status);
         },error:function(){
            alert("failed");
         }
      })
      
      //var tdArr = new Array();
      console.log("zz?" + order_seq);
   }
   
</script>
	
<%@ include file="footer.jsp" %>