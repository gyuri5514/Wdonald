<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<script type="text/javascript">
	$(function(){
		$("#update").hide();
		//alert("으악");
		var val = JSON.parse('${burgerVO}');
		$("tr").each(function(){
			$(this).click(function(){
				for(var i = 0; i < val.length; i++) {
					if($(this).find('#ccode').text() == val[i].b_code){
						$("#select_image").attr("src",val[i].b_img_path);
						$("#select_code").val(val[i].b_code);
						$("#select_name").val(val[i].b_name);
						$("#select_price").val(val[i].b_price);
						$("#select_kcal").val(val[i].b_kcal);
						$("#select_regdate").val($(this).find("#ddate").text());
						
						//alert($(this).find("#ddate").text()+"+"+val[i].b_name);
						
						for(var j = 0; j < $("#select_status option").length; j++) {
							//console.log("22 "+$("#select_status option:eq("+j+")").val());
							if(val[i].b_status == $("#select_status option:eq("+j+")").val()){
								$("#select_status option:eq("+j+")").attr("selected","selected"); 
								//alert("이거 왜 안되냐???" + val[i].b_status);
								//$("#select_status").val("eq(j)").prop("selected", true);
							}
						}
					}
				}
				$("#update").show();
			});
		})
		
		$('.dataTable-selector').change(function(){
			$("#update").hide();
			//alert("으악");
			var val = JSON.parse('${burgerVO}');
			$("tr").each(function(){
				$(this).click(function(){
					for(var i = 0; i < val.length; i++) {
						if($(this).find('#ccode').text() == val[i].b_code){
							$("#select_image").attr("src",val[i].b_img_path);
							$("#select_code").val(val[i].b_code);
							$("#select_name").val(val[i].b_name);
							$("#select_price").val(val[i].b_price);
							$("#select_kcal").val(val[i].b_kcal);
							$("#select_regdate").val($(this).find("#ddate").text());
							
							//alert($(this).find("#ddate").text()+"+"+val[i].b_name);
							
							for(var j = 0; j < $("#select_status option").length; j++) {
								//console.log("22 "+$("#select_status option:eq("+j+")").val());
								if(val[i].b_status == $("#select_status option:eq("+j+")").val()){
									$("#select_status option:eq("+j+")").attr("selected","selected"); 
									//alert("이거 왜 안되냐???" + val[i].b_status);
									//$("#select_status").val("eq(j)").prop("selected", true);
								}
							}
						}
					}
					$("#update").show();
				});
			})
		})
		$('.dataTable-pagination').find("li").click(function(){
			$(this).toggle(function(){
				$(this).click(function(){
					alert("dafdaf");
				})
				
			})
			/* $(this).click(function(){
				
			}) */
		})
			
		/* for(var i = 0; i < val.length; i++) {
			console.log($(this).find('#ccode').text());
			if($(this).find('#ccode').text() == val[i].b_code){
				$("#select_image").attr("src",val[i].b_img_path);
				$("#select_code").val(val[i].b_code);
				$("#select_name").val(val[i].b_name);
				$("#select_price").val(val[i].b_price);
				$("#select_kcal").val(val[i].b_kcal);
				$("#select_regdate").val($(this).find("#ddate").text());
				
				//alert($(this).find("#ddate").text()+"+"+val[i].b_name);
				
				for(var j = 0; j < $("#select_status option").length; j++) {
					//console.log("22 "+$("#select_status option:eq("+j+")").val());
					if(val[i].b_status == $("#select_status option:eq("+j+")").val()){
						$("#select_status option:eq("+j+")").attr("selected","selected"); 
						//alert("이거 왜 안되냐???" + val[i].b_status);
						//$("#select_status").val("eq(j)").prop("selected", true);
					}
				}
			}
			$("#update").show();
		} */
		
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
			
			$("#sideUpdate").submit();
		});
	});
	
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Burger</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">HOME</a></li>
				<li class="breadcrumb-item active">윈딜리버리 버거</li>
			</ol>
			<div style="height: 100vh">
				<!-- 표 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 윈딜리버리 버거 내역
					</div>
					<div class="card-body">

					<button class="addcoupon btn btn-primary" id="addBanner" onclick="location='burgerRegister.mdo'">등록</button>
					<hr>
					<form id="burgerUpdate" action="burgerUpdate.mdo" method="post" > 
					<div class="update" id="update">
						<img alt="b_image" id="select_image" src=""><br/>
						코드 : <input name="b_code" id="select_code" class="form-control" type="text" style="margin-bottom: 10px" readonly="readonly">
						이름 : <input name="b_name" id="select_name" class="form-control" type="text" style="margin-bottom: 10px">
						가격 : <input name="b_price" id="select_price" class="form-control" type="text" style="margin-bottom: 10px">
						칼로리 : <input name="b_kcal" id="select_kcal" class="form-control" type="text" style="margin-bottom: 10px">
						등록일 : <input name="b_regdate" id="select_regdate" class="form-control" type="text" readonly="readonly" style="margin-bottom: 10px">
						상태 : 
						<select name="b_status" id="select_status" class="form-control form-control-sm" style="margin-bottom: 10px">
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
								<c:forEach items="${burgerList}" var="b_list" varStatus="status">
									<tr class="test" id="${status.count}">
										<td id="naame">${b_list.b_name}</td>
										<td id="pprice">
										<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${b_list.b_price}"/>
										<span class="starting-price" style="margin-top:5px;"> &#8361; ${formatPrice}</span>
										</td>
										<td id="ccode">${b_list.b_code}</td>
										<td id="kkcal">${b_list.b_kcal} Kcal</td>
										<td id="ddate"><fmt:formatDate value="${b_list.b_regdate}" pattern="yyyy-MM-dd"/></td>
										<td id="sstatus"><c:set var="status" value="${b_list.b_status }" />
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