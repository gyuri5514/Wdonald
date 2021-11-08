<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="keywords" content="맥도날드">
<meta name="description" content="맥도날드">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<link rel="stylesheet" href="resources/css/faq/faqCommon.css" />
<link rel="stylesheet" href="resources/css/faq/faq.css" />
<title>1:1 고객문의</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/faq/ajax.js"></script>
<script type="text/javascript" src="resources/js/faq/commonTable.js"></script>
<script type="text/javascript" src="resources/js/faq/extendedComboBox.js"></script>
<script type="text/javascript" src="resources/js/faq/newUtil.js"></script>
<script type="text/javascript" src="resources/js/faq/customer_common.js"></script>
<!-- <script type="text/javascript" src="resources/js/qna.js"></script> -->
<!-- smartEditor -->
<script type="text/javascript" src="Editor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>

</head>
<body class="bg_customer_new" scroll="auto" style="overflow-x: hidden">
	<form id="qnaForm" name="mainForm" method="post" onsubmit="return false;">
		<!-- <input type="hidden" name="RECVER_TYPE_CD" value="01"> <input
			type="hidden" name="VOC_CHANNEL_CD" value="02"> <input
			type="hidden" name="ACPT_ID" id="ACPT_ID" value=""> -->
		<div class="wrapper">
			<header class="header">
				<div class="headArea">
					<strong class="hLogo"> <a
						href="main.do" target="_blank" class="logo"
						title="메인으로 이동"> <img src="resources/wcdonald.png" alt="맥도날드" />
					</a>
					</strong>
					<nav class="hMenu">
						<ul>
							<li><a href="faq.do" class="depth">FAQ</a></li>
							<li class="hMenu_li_select"><a href="#" class="depth">1:1고객문의</a>
							</li>
						</ul>
					</nav>
					<!-- menu end -->
				</div>
			</header>
			<!-- header end -->
			<div id="container">
				<div class="content">
					<div class="visualArea2 inquiryBg">
						<div class="inner" style="padding-bottom: 0px;">
							<h1 class="titDep1">1:1 고객문의</h1>
							<p class="subCopy">
								맥도날드에 대한 깊은 관심에 감사드립니다. 제품이나 서비스에 대한 문의, 불만, 제안, 칭찬과 격려사항을
								알려주세요.<br /> CS center (080-208-1588)로도 문의하실 수 있습니다. 주말 및 공휴일 등
								운영 시간(평일 09:00~18:00)외에 접수해 주신 내용은<br /> 잘 보관하였다가 CS center 운영
								시작 후 신속히 답변드리겠습니다.
							</p>
						</div>
					</div>
					<div style="display:" id="div1">
						<!-- visualArea end -->
						<div class="contArea">
							<ul class="tabType01">
								<li data-title="문의" data-desc="문의하기"><a
									href="javascript:page(1);" role="button" aria-selected="true">문의하기</a>
								</li>
								<!-- 선택 된 태그에 aria-selected="true" 추가 -->
								<li><a href="javascript:page(2);" role="button">답변보기</a></li>
							</ul>
							<div class="faq-form-warp">
								<!-- 개인정보이용동의 -->
								<div class="agree-area">
									<span><strong>1. 개인정보의 수집, 이용에 관한 사항(필수)</strong></span>
									<table class="tbl-list">
										<colgroup>
											<col style="width: 389px">
											<col style="width: 389px">
											<col style="width: 390px">
										</colgroup>
										<tbody>
											<tr>
												<th>항목</th>
												<th>수집목적</th>
												<th>보유기간</th>
											</tr>
											<tr>
												<td>이름, 연락처, 이메일, 이용매장, 고객문의사항<br> (첨부파일에 기재된 내용
													포함)
												</td>
												<td>고객불만사항 해결, 문의사항 응답 및 이와 관련한<br> 고객 연락 업무, 고객
													손해에 대한 배상 및 보험처리,<br> 서비스 향상을 위한 내부 교육자료 활용, 민원 관련<br>
													통계 자료 작성, 민원 처리에 관한 기록 보관, 블랙<br>컨슈머 확인 등
												</td>
												<td>블랙 컨슈머 관련 기록은 10년, MDS<br>(배달 서비스)기록은 3년, 그 외의
													경우 2년<br>단, 관계 법령에 따른 보관기간이 더 길 경우<br> 해당 기간까지
												</td>
											</tr>
										</tbody>
									</table>
									<span>위와 같이 개인정보를 처리하는데 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우
										서비스 제공이 제한될 수 있습니다.</span>
									<div class="check-agree">
										<span>위와 같이 개인정보를 처리하는 데 동의하십니까?</span> 
										<!-- <input type="hidden" name="qa_agree1" id="IS_PERSON_AGREE_YN">  -->
										<label class="check-container" for="agree-y">예 
											<input type="radio" name="qa_agree1" id="agree-y" value="1" checked>
											<span class="checkmark"></span>
										</label> 
										<label class="check-container" for="agree-n">아니오 
											<input type="radio" name="qa_agree1" id="agree-n" value="0">
											<span class="checkmark"></span>
										</label>
									</div>
									<span><strong>2. 개인정보의 제3자 제공에 관한 사항(필수)</strong></span>
									<p>귀하가 제공하시는 상기 개인정보는 불만사항 해결 등을 위하여 다음과 같이 제3자에게 제공될 수
										있습니다.</p>
									<table class="tbl-list">
										<colgroup>
											<col style="width: 145px">
											<col style="width: 341px">
											<col style="width: 341px">
											<col style="width: 341px">
										</colgroup>
										<thead>
											<tr>
												<th>제공받는 자</th>
												<th>제공받는 자의 이용목적</th>
												<th>제공하는 개인정보의 항목</th>
												<th>제공받는 자의 보유 및 이용기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">Dasca</th>
												<td>인적, 물적 피해에 대한<br>보험처리 업무
												</td>
												<td>이름, 연락처, 이메일, 이용매장,<br> 고객문의사항 (첨부파일에 기재된 내용
													포함)
												</td>
												<td>이용 목적 달성 시 까지<br> 단, 관계 법령에 따른 보관기간이 더 길 경우<br>
													해당 기간까지
												</td>
											</tr>
											<tr>
												<th scope="row">AON</th>
												<td>인적, 물적 피해에 대한<br>보험처리 업무
												</td>
												<td>상동</td>
												<td>상동</td>
											</tr>
											<tr>
												<th scope="row">현대해상</th>
												<td>인적, 물적 피해에 대한<br>보험처리 업무
												</td>
												<td>상동</td>
												<td>상동</td>
											</tr>
											<tr>
												<th scope="row">맥도날드 가맹점</th>
												<td>고객불만사항 해결</td>
												<td>상동</td>
												<td>상동</td>
											</tr>
										</tbody>
									</table>
									<p>
										* 가맹점은 <a
											href="http://www.mcdonalds.co.kr/www/kor/util/private.do"
											target="_blank" style="color: #C86C37;"><strong>http://www.mcdonalds.co.kr/www/kor/util/private.do</strong></a>
										에서 확인하실 수 있습니다.<br> 위와 같이 개인정보를 처리하는데 동의를 거부할 권리가 있습니다.
										그러나 동의를 거부할 경우 서비스 제공이 제한 될 수 있습니다.
									</p>
									<!-- <input type="hidden" id="IS_THIRD_AGREE_YN" name="qa_agree2"/> -->
									<div class="check-agree">
										<span>위와 같이 개인정보를 처리하는 데 동의하십니까?</span> 
											<!-- <input type="hidden" name="IS_THIRD_AGREE_YN" id="IS_THIRD_AGREE_YN"> -->
											<label class="check-container" for="agree-y2">예 
												<input type="radio" name="qa_agree2" id="agree-y2" value="1" checked>
												<span class="checkmark"></span>
											</label> 
											<label class="check-container" for="agree-n2">아니오
												<input type="radio" name="qa_agree2" id="agree-n2" value="2"> 
												<span class="checkmark"></span>
											</label>
									</div>
									<div class="prevent-sentence">
										<span>1:1 고객 문의 작성 시, 욕설/성희롱 등의 부적절한 표현은 삼가주시기를 부탁
											드립니다.<br> 부적절한 표현이 확인 될 경우 고객응대 근로자 보호 조치에 따라 회사는 적극적인
											근로자 보호 조치를 취할 수 있습니다.
										</span>
									</div>
								</div>
								<!-- agree-area end -->
								<div class="qna-form-area">
									<table class="qna-form">
										<colgroup>
											<col style="width: 139px">
											<col style="width: 432px">
											<col style="width: 165px">
											<col style="width: 432px">
										</colgroup>
										<tr>
											<th scope="row">매장명(매장위치)</th>
											<td colspan="3"><input type="hidden" name="STORE_SEQ"
												id="STORE_SEQ" value=""> <input type="hidden"
												name="qa_store" id="STORE_ADDRESS" value=""> <input
												class="int w587" type="text" name="STORE_NM" id="STORE_NM"
												value="" readonly> &nbsp;&nbsp;&nbsp;
												<button class="btnMC btnM" onclick="storeSearchPop();">매장검색</button>
											</td>
										</tr>
										<tr>
											<th scope="row">이름</th>
											<td>
												<input class="int w432" type="text" class="input" name="qa_name" id="CUST_NM"></td>
											<th scope="row">연락처</th>
											<td>
												<div class="d-flex-row gap-21">
													<!-- <input type="hidden" name="MOBILE" id="MOBILE">  -->
													<input class="int w112" type="text" name="qa_phone1" id="MOBILE1" maxlength="4" onBlur="javascript:isNumAlert('연락처',this);">
													<span>-</span>
													<input class="int w112" type="text" name="qa_phone2" id="MOBILE2" maxlength="4" onBlur="javascript:isNumAlert('연락처',this);"> <span>-</span>
													<input class="int w112" type="text" name="qa_phone3" id="MOBILE3" maxlength="4" onBlur="javascript:isNumAlert('연락처',this);">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td>
												<input class="int w432" type="text" name="qa_email" id="EMAIL"/>
											</td>
											<th scope="row">비밀번호</th>
											<td>
												<input class="int w432" type="password" name="qa_password" id="CUST_PASSWORD"/></td>
										</tr>
										<tr>
											<th scope="row">제목</th>
											<td colspan="3"><input class="int w1029" type="text"
												name="qa_title" id="ACPT_TITLE"></td>
										</tr>
										<tr>
											<th scope="row">내용</th>
											<td colspan="3">
												<textarea name="qa_content" id="ACPT_DESC" class="int w1029" style="width: 1010px"></textarea>
											</td>
										</tr>
										<!-- <tr>
											<th scope="row">파일첨부</th>
											<td colspan="3">
												<input class="int w587" id="filename" type="text"> 
												<label for="FILE_1" class="btn bg-gray">
														<input type="file" name="FILE_1" id="FILE_1" hidden="true" />
														파일선택
												</label>
											</td>
										</tr> -->
									</table>
									<p>
										파일용량: 10MB까지<br> 첨부 가능 형식 : JPG, JPEG, JPE, JFIF, GIF,
										TIF, TIFF, PNG / zip
									</p>
								</div>
							</div>
							<!-- submit button -->
							<button type="button" id="btnInsert" class="btnMC btnM insertBtn" >문의 등록하기</button>
						</div>
						<!-- content area end -->
					</div>
					
					<!-- 문의조회 -->
					<div style="display: none" id="div2">
						<!-- visualArea end -->
						<div class="contArea">
							<ul class="tabType01">
								<li data-title="문의" data-desc="문의하기">
									<a href="javascript:page(1);" role="button">문의하기</a>
								</li>
								<!-- 선택 된 태그에 aria-selected="true" 추가 -->
								<li>
									<a href="javascript:page(2);" role="button" aria-selected="true">답변보기</a>
								</li>
							</ul>
							<!-- 답변보기 page 아래로 이어지는 부분 시작, div클래스 네임 처음 동일 -->
							<div class="faq-form-warp">
								<div class="reply-check">
									<strong>문의내용 작성 시 입력하셨던 이메일, 비밀번호를 입력해 주세요.</strong>
									<div class="reply-form">
										<div class="d-flex-row">
											<label for="email">이메일</label> 
											<input type="text" name="" id="EMAIL2" class="int w432">
										</div>
										<div class="d-flex-row">
											<label for="password">비밀번호</label> 
											<input type="password" name="" id="CUST_PASSWORD2" class="int w432">
										</div>
									</div>
								</div>
							</div>
							<!-- submit button -->
							<button type="button" class="btnMC btnM" onclick="search();">문의 조회하기</button>
							<span id="req" style="red"></span> <!-- 필요없음 -->
	

							<div id="LIST_DIV"></div>
							<div id="LIST_PAGE_DIV" style="display: none"></div>

						</div>
						<!-- content area end -->
					</div>
					<!--  div2 end -->
					<div class="side-box">
						<span>고객센터</span> <strong>080.208.1588</strong>
						<p>
							평일 09:00 ~ 18:00<br> (점심시간 12:00 ~ 13:00)
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="POP_OK" class="inquiry-modal" style="display: none;">
			<!--img src="/common/images/customer/insert_ok.png" width="484" height="387" border="0" usemap="#Map" onclick="javascript:page(3);"/>
		<map name="Map" id="Map"><area shape="rect" coords="198,600,296,375" href="javascript:page(3);" /></map-->
			<div class="pop-body">
				<img src="/common/images/customer/insert_ok.png" width="650"
					height="536" border="0" />
				<button type="button" class="btnMC btnM insertBtn"
					onclick="page(3);">닫기</button>
			</div>
		</div>
	</form>
	<!-- hidden iframe 시작 -->
	<iframe name="hdfrm" width="0" height="0" scrolling="auto"
		frameborder="0"> </iframe>
	<!-- hidden iframe 끝 -->


<%@ include file="footer.jsp"%>
<script type="text/javascript">
	function page(type) {
		if(type == 1) {
			document.getElementById("div1").style.display = "block";
			document.getElementById("div2").style.display = "none";
		}
		else if(type==2) {
			document.getElementById("div1").style.display = "none";
			document.getElementById("div2").style.display = "block";
		}
		else if(type==3) {
			document.getElementById("POP_OK").style.display = "none";
			location.href="/MC/HOM/faqMain.jsp";
		}
	}
	/*---smartEditor---*/
	var VALIDATE_ERROR_MESSAGE = '';
	var email_re = /^([^@]+)@(.+)$/;								// E-mail 검사용 패턴 (기본)
	var email_user_re = /^[A-Za-z0-9#._-]+$/;						// E-mail 사용자 아이디 부분 검사용 패턴
	var email_host_re = /^([A-Za-z0-9._-]+\.)+([A-Za-z]+)\.?$/;		// E-mail 호스트 주소 부분 검사용 패턴
		
		//E-mail 유효성 검사 1단계
		function isValidEmail(email)
		{
			VALIDATE_ERROR_MESSAGE = "";
			var part = email.match(email_re);
		
			// @ 가 없는 경우
			if (part == null)
			{
				VALIDATE_ERROR_MESSAGE = 'E-mail 주소 형식이 올바르지 않습니다.';
				return false;
			}
		
			var user = RegExp.$1;
			var host = RegExp.$2;
					
			return isValidEmail2(user, host);
		}
		
		// E-mail 유효성 검사 2단계
		function isValidEmail2(user, host)
		{
			VALIDATE_ERROR_MESSAGE = "";
		
			if (!email_user_re.test(user))
			{
				VALIDATE_ERROR_MESSAGE = 'E-mail 주소 형식이 올바르지 않습니다.';
				return false;
			}
		
			if (!email_host_re.test(host))
			{
				VALIDATE_ERROR_MESSAGE = 'E-mail 주소 형식이 올바르지 않습니다.';
				return false;
			}
		
			return true;
		}
			
	
		$(function() { 
			var oEditors =[];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : document.getElementById('ACPT_DESC'), //textareaID
				sSkinURI : "Editor/SmartEditor2Skin.html", //경로를 맞춰주기 
				fCreator : "createSEditor2",
				htParams : {
					//툴바 사용 여부 (true:사용)
					bUseToolbar : true,
					
					//입력창 크기 조절바 사용 여부 (true : 사용)
					bUseVerticalResizer : false,
					
					//모드 탭 (Editor/HTML/TEXT) 사용 여부
					bUseModeChanger : false
				}
				
			});
			
			$("#btnInsert").click(function() { 
				oEditors.getById["ACPT_DESC"].exec("UPDATE_CONTENTS_FIELD", []); //textarea의 id를 적어줍니다. 
				var selcatd = $("#selcatd > option:selected").val(); 
				var title = $("#ACPT_TITLE").val(); 
				var content = document.getElementById("ACPT_DESC").value; 
				if (selcatd == "") { 
					alert("카테고리를 선택해주세요."); 
					return; 
				} 
				if(($("#CUST_NM").val()).trim() == ""){
					alert("이름을 입력해 주세요.");
					$('#CUST_NM').focus();
					return false;
				}
				if (($("#MOBILE1").val()).trim() == "" || ($("#MOBILE2").val()).trim() == ""  || ($("#MOBILE3").val()).trim() == "" )
				{
					alert("연락처를 입력해 주세요.");
					$('#MOBILE1').focus();
					return false;
				}
				if (!isValidEmail($("#EMAIL").val())){
					alert("이메일 형식 오류입니다.");
					console($("#EMAIL").val());
					$('#EMAIL').focus();
					return false;
				}
				
				if(($("#CUST_PASSWORD").val()).trim() == ""){
					alert("비밀번호를 입력해 주세요.");
					$('#CUST_PASSWORD').focus();
					return false;
				}
				if (title == null || title == "") { 
					alert("제목을 입력해주세요."); 
					$("#ACPT_TITLE").focus(); 
					return; 
				} 
			/* 	if(($("#ACPT_DESC").val()).trim() == "")
				{
					alert("내용을 입력해 주세요.");
					$('#ACPT_DESC').focus();
					return false;
				} */
				if(content == "" || content == null || content == '&nbsp;' || content == '<br>' || 
				content == '<br/>' || content == '<p>&nbsp;</p>'){ 
					alert("내용을 작성해주세요."); 
					oEditors.getById["ACPT_DESC"].exec("FOCUS"); //포커싱 
					return; 
				} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
				
				var result = confirm("문의등록 하시겠습니까?"); 
				alert("뭐냐 " +document.getElementsByName("qa_email").length);

				if(result){ 
					var a = $("input[name='qa_agree1']:checked").val();
					var b = $("input[name='qa_agree2']:checked").val();
					//alert("동의 a =" + a); ,
					
					if(a == 1 && b == 1){
					
						alert("등록 완료!"); 
						//$("#IS_PERSON_AGREE_YN").val($(':radio[name="agree-y"]:checked').val());
						//$("#IS_THIRD_AGREE_YN").val($(':radio[name="agree-y2"]:checked').val());
						
						var qnaForm = document.getElementById("qnaForm");
						qnaForm.action="qnaInsert.do";
						qnaForm.submit();
					}else{
						alert("동의해주세요.");
					}
				}else{ 
					return; 
				} 
			}); 
		})
		
		
		
		//문의 조회
		function search() {
			if(($("#EMAIL2").val()).trim() == ""){
				alert("이메일을 입력해 주세요.");
				$('#EMAIL2').focus();
				return false;
			}
			if(($("#CUST_PASSWORD2").val()).trim() == ""){
				alert("비밀번호를 입력해주세요.");
				$('#CUST_PASSWORD2').focus();
				return false;
			}
			
			var qa_email = document.getElementById('EMAIL2').value;
			var qa_password = document.getElementById('CUST_PASSWORD2').value;

					$.ajax({
						url:"qnaSelect.do",
						data:{
							qa_email : qa_email,
							qa_password : qa_password
						},
						dataType: "json",  
						type: "post",
						success:function(data){
							//alert(data);
							//alert("ajax 성공");
							
							$("#req").html(
								"<div class='reply-view-area' id='LIST_REPLY_DIV'>" + 
									"<table class='reply-view' >" +
										"<colgroup>" + 
											"<col style='width: 144px'>" +
											"<col style='width: auto'>" +
											"<col style='width: 144px'>" +
											"<col style='width: 144px'>" +
											"<col style='width: 144px'>" +
										"</colgroup>" +
								"<thead>" + 
									"<tr>" + 
										"<th scope='col'>접수번호</th>" +
										"<th scope='col'>제목</th>" +
										"<th scope='col'>방문매장</th>" +
										"<th scope='col'>접수일</th>" +
										"<th scope='col'>상태</th>" +
									"</tr>" +
								"</thead>" +
								"<tbody>" +
									"<tr>" +
										"<th scope='row'>" + data["qa_seq"] + "</th>" + 
										"<th>" + data["qa_title"] + "</th>" + 
										"<th>" + data["qa_store"] + "</th>" + 
										"<th>" + data["qa_regdate"] + "</th>" + 
										"<th>" + data["qa_status"] + "</th>" + 
									"</tr>" +
									"<tr>" +
										"<th scope='row'>내용</th>" +
											"<td colspan='4'>" + data["qa_content"] + "</td>" +
									"</tr>" +
									"<tr>" +
										"<th scope='row' class='color-mcdRed'>답변</th>" + 
										"<td colspan='4' class='color-mcdRed'>" + 
										//안녕하세요, 고객님! 행복을 전하는 맥도날드 고객센터입니다!<br>문의주신 이번달 맥도날드의 해피밀은 말이죠! 맥도날드 공식 사이트에서 직접 확인할 수 있답니다~~~ 지금 바로 공식 사이트로 방문해보세요! 그럼 또 만나요~@@@@ +
										"</td>" + 
									"</tr>" +
								"</tbody>" +
								"</table>" + 
							"</div>"
								
							);
						},
						error:function(data){
							alert("이메일과 비밀번호를 다시 확인해주세요."); //ajax failed
						}
					})
			
		}
		
		
		//매장검색
		function storeSearchPop(){
			//window.open("/MC/HOM/storeSearch.jsp","","width=412,height=380, menubar=no, status=no, toolbar=no");
			window.open("qnaStoreSearch.do","","width=660,height=500, menubar=no, status=no, toolbar=no");
		}

		
</script>