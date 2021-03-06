<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<script type="text/javascript">
	$(function(){
		$("#menuInsert").click(function(){
			var name = $.trim($("#select_name").val());
			if (name == "") {
				alert("메뉴 명을 정확히 작성해 주세요.");
				$("#select_name").focus();
				return false;
			}
			var price = $.trim($("#select_price").val());
			if (price == "") {
				alert("메뉴 가격을 정확히 작성해 주세요.");
				$("#select_price").focus();
				return false;
			}
			var kcal = $.trim($("#select_kcal").val());
			if (kcal == "") {
				alert("메뉴 칼로리를 정확히 작성해 주세요.");
				$("#select_kcal").focus();
				return false;
			}
			
			$("#dessertUpdate").submit();
		});
	});
	function detail(index) {
		var val = JSON.parse('${dessertVO}');
		
		for(var i = 0; i < val.length; i++) {
			if(val[i].dessert_code == $("#"+index+"").find("#ccode").text()){
				$("#select_image").attr("src",val[i].dessert_img_path);
				$("#select_code").val(val[i].dessert_code);
				$("#select_name").val(val[i].dessert_name);
				$("#select_price").val(val[i].dessert_price);
				$("#select_kcal").val(val[i].dessert_kcal);
				$("#select_regdate").val($("#"+index+"").find("#ddate").text());
				
				for(var j = 0; j < $("#select_status option").length; j++) {
					if(val[i].dessert_status == $("#select_status option:eq("+j+")").val()){
						$("#select_status option:eq("+j+")").attr("selected","selected"); 
					}
				}
				$("#update").attr("style","block");
				return;
			}
		}
	}
	
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Dessert</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
				<li class="breadcrumb-item active">윈딜리버리 디저트</li>
			</ol>
			<div style="height: 100vh">
				<!-- 표 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 윈딜리버리 디저트 내역
					</div>
					<div class="card-body">

					<button class="addcoupon btn btn-primary" id="addBanner" onclick="location='dessertRegister.mdo'">등록</button>
					<hr>
					<form id="dessertUpdate" action="dessertUpdate.mdo" method="post" > 
					<div class="update" id="update" style="display:none;">
						<img alt="dessert_image" id="select_image" src=""><br/>
						코드 : <input name="dessert_code" id="select_code" class="form-control" type="text" style="margin-bottom: 10px" readonly="readonly">
						이름 : <input name="dessert_name" id="select_name" class="form-control" type="text" style="margin-bottom: 10px">
						가격 : <input name="dessert_price" id="select_price" class="form-control" type="text" style="margin-bottom: 10px">
						칼로리 : <input name="dessert_kcal" id="select_kcal" class="form-control" type="text" style="margin-bottom: 10px">
						등록일 : <input name="dessert_regdate" id="select_regdate" class="form-control" type="text" readonly="readonly" style="margin-bottom: 10px">
						상태 : 
						<select name="dessert_status" id="select_status" class="form-control form-control-sm" style="margin-bottom: 10px">
							<option value="1">활성화</option>
							<option value="0">비활성화</option>
							<option value="2">재고소진</option>
							<option value="3">출시대기</option>
						</select>
						<button class="btn btn-primary" type="submit" id="menuInsert" onclick="insert()">수정하기</button>
					</div>
					</form>
					<!-- 큰일났다 이거 똥됐다!! -->

					<hr>
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>이름</th>
								<th>가격</th>
								<th>코드</th>
								<th>칼로리</th>
								<th>등록일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dessertList}" var="dessert_list" varStatus="status">
							<tr class="test" id="${status.index}" onclick="detail(${status.index})">
								<td id="naame">${dessert_list.dessert_name}</td>
								<td id="pprice">
								<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${dessert_list.dessert_price}"/>
								<span class="starting-price" style="margin-top:5px;"> &#8361; ${formatPrice}</span>
								</td>
								<td id="ccode">${dessert_list.dessert_code}</td>
								<td id="kkcal">${dessert_list.dessert_kcal} Kcal</td>
								<td id="ddate"><fmt:formatDate value="${dessert_list.dessert_regdate}" pattern="yyyy-MM-dd"/></td>
								<td id="sstatus"><c:set var="status" value="${dessert_list.dessert_status }" />
									<c:choose>
										<c:when test="${status eq '0'}"><span style="color: red">비활성화</span></c:when>
										<c:when test="${status eq '1'}"><span style="color: blue">활성화</span></c:when>
										<c:when test="${status eq '2'}"><span style="color: red">재고소진</span></c:when>
										<c:when test="${status eq '3'}"><span style="color: red">출시대기</span></c:when>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>