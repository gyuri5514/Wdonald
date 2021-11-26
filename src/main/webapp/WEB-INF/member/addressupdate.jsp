<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="mypage.jsp"%>
<link rel="stylesheet" href="resources/css/address/addressupdate.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc50f0bdab0c2e48e4552db155399164&libraries=services"></script>
<script>
	/*------------ DaumPost ------------*/
	function openDaumPostcode() {
		 var themeObj = {
				 bgColor: "#F8B01B"
				};
		new daum.Postcode({
			
			oncomplete : function(data) {
				document.querySelector("#address1").value = data.address;
				
				var address1 = $("#address1").val();
				
				var map = document.getElementById("map");
				
				//좌표 반환 객체
				var geocoder = new kakao.maps.services.Geocoder();
				//좌표 검색
				geocoder.addressSearch(address1, function(result, status){
					if(status === kakao.maps.services.Status.OK){
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						document.getElementById("address_lat").value = result[0].y; //위도
						document.getElementById("address_lon").value = result[0].x; //경도
						
					}
				});
				
			},
			theme: themeObj 
		}).open();
	}
	/*---------- insert Button -----------*/
	$(function(){
		
		$('#concon').click(function(){
			var add1 = $('#address1').val();
			var add2 = $('#address2').val();
			//alert("dfdfd" + add1);
			var allAdd = (add1 +" , "+ add2);
			//alert("2222" + allAdd);
			$('#delivery_addr').text(allAdd);
		})
		
		$('#submit_button').click(function(){
			var address1 = $.trim($('#address1').val());
			if( address1 == ""){
				alert('검색을 완료해 주세요.');
				$("#address1").focus();
				return false;
			}
			
			var address2 = $.trim($('#address2').val());
			if( address2 == ""){
				alert('상세주소를 입력해 주셔야 합니다.');
				$("#address2").focus();
				return false;
			}
			
			if($('#delivery_addr').html() == ""){
				alert('확인 버튼을 눌러주세요.');
				$("#address2").focus();
				return false;
			}
			$("#form_deliveryaddress").submit();
		})

	});
	
</script>
<!-- 주소 추가하기 테이블 -->
<div id="map" style="width: 0px; height:0px;"></div>
<div class="col-md-10">
	<h3 class="title-divider mt_0">
		<span>주소 추가하기</span><small>주소 추가하기</small>
	</h3>
	<div class="page-content">
		<div class="panel-group panel-lg panel panel-default">
			<div class="panel-heading">
				<h3>새로운 주소 추가</h3>
			</div>
			<div class="panel-body">
				<form method="post" role="form" class="form form_deliveryaddress" id="form_deliveryaddress" data-required-symbol="*"
					action="addressupdate.do">
					<fieldset class="fieldset">
						<div class="fieldset-heading">
							<h2 class="fieldset-title">배달 받을 주소를 한글로 입력해 주세요.</h2>
						</div>
						<div class="wrap">
							<!-- <div class="flow" style="position: absolute center;">
								<img
									src="https://www.mdsgisprod.co.kr/mdsgis/resources/old/images/order_floww_01.gif"
									width="825" height="100" alt="새로운 주소 추가 단계">
							</div> -->
							<!-- <form id="jibunSform" name="jibunSform" method="post" action=""> -->
								<div id="p_inbox gibun_add" style="margin-left: 20px;">
									<p class="tip01">&nbsp;</p>
									<table border="0">
										<tbody>
											<tr>
												<th>지역명</th>
												<td class="area" width="500">
												<span class="add_01">
													<input type="text" id="address1" name="address1" class="input_add" placeholder="지번,도로명,건물명으로 검색해주세요" readonly />
													<input type="hidden" name="address_lat" id="address_lat">
													<input type="hidden" name="address_lon" id="address_lon">
												</span> 
												<span class="add_02">
													<button type="button" onclick="openDaumPostcode();" class="btn" focus="address2">검색</button>
												</span></td>
											</tr>
										</tbody>
									</table>
									<table border="0" id="detail-addr_el" style="display: block;">
										<tbody>
											<tr>
												<th>상세주소</th>
												<td width="700px" id="sangse">
												<ul id="juso">
													<!-- 시작: 상세주소 -->
													
													<li id="juso">
														<span class="add_01">
															<input type="text" id="address2" name="address2" class="input_add" placeholder="나머지 주소를 입력해주세요."/>
														</span>
														<span class="add_02">
															<button type="button" id="concon" class="btn">확인</button>
														</span>
													</li>
													<li class="tip">신속한 배달을 위해 동-호수를 정확히 입력해 주세요</li>
												</ul>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							<!-- </form> -->
							<table id="sangseAddress">
								<tbody>
									<tr>
										<th>최종 배달주소</th>
										<td>
											<div id="delivery_addr" name="delivery_addr" class="cnfm_input"></div>
										</td>
									</tr>
									<tr>
										<th>배달 특이사항</th>
										<td id="remarkTd">
											<textarea id="remark" name="order_comment" class="apply_text" placeholder="예) 아이가 있으니 노크해 주세요"></textarea>
										</td>
								</tbody>
							</table>
						</div>
					</fieldset>
					<div id="save_submit_button">
						<fieldset class="fieldset form-actions">
							<div class="form-group">
								<button type="submit" id="submit_button" name="submit_button" class="btn btn-red btn-lg btn-submit">주소록 추가</button>
							</div>
							<div class="form-group">
								<a class="h5 text-default text-ucase btn-back" href="">
									<i class="text-primary fa fa-caret-left"></i>
									<span>뒤로 가기</span>
								</a>
							</div>
						</fieldset>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>