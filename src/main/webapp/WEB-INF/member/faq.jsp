<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="keywords" content="맥도날드">
<meta name="description" content="맥도날드">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/faq/faqCommon.css">
<link rel="stylesheet" href="resources/css/faq/faq.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="resources/js/faq/ajax.js"></script> -->
<script type="text/javascript" src="resources/js/faq/extendedComboBox.js"></script>
<script type="text/javascript" src="resources/js/faq/newUtil.js"></script>
<script type="text/javascript" src="resources/js/faq/customer_common.js"></script>
<script type="text/javascript" src="resources/js/faq/customer_commonTable.js"></script> 
<script type="text/javascript" src="resources/js/faq/faqMain.js"></script>
<title>자주 찾는 질문과 답</title>
<script type="text/javascript">
		var mobile_yn = "No";
		if("ontouchend" in document){
			mobile_yn = "Yes";
		}
		
		$( document ).ready(function() {
		    console.log("ready!");
		    init();		    
		    
		    $("#category").change(function() {
		    	//alert($("#category option:selected").val());	// 01, 02
		    	 //$("#SELECTED_DATA").val = $("#category option:selected").val();
		    	search($("#category option:selected").val(),'C');
		    	changeColor($("#category option:selected").val());
		    });
	    
		});
</script>
</head>
<body>
	<div class="wrapper">
   		<header class="header">
	        <div class="headArea">
	          <strong class="hLogo">
	            <a href="main.do" target="_blank" class="logo" title="메인으로 이동">
	              <img src="resources/wcdonald.png" alt="맥도날드" />
	            </a>
	          </strong>
	          <nav class="hMenu">
	            <ul>
	              <li class="hMenu_li_select">
	                <a href="#" class="depth">FAQ</a>
	              </li>
	              <li>
	                <a href="qna.do" class="depth">1:1고객문의</a>
	              </li>
	            </ul>
	          </nav>
	          <!-- menu end -->
	        </div>
	     </header>
	      <!-- header end -->
		<div id="container">
			<div class="content">
				<div class="visualArea1 faqBg">
					<div class="inner">
						<h1 class="titDep1">FAQ</h1>
						<p class="subCopy">
							여러분들은 무엇이 궁금하세요? 질문에 앞서 읽어주세요.<br /> 많은 분들이 궁금해 하시는 내용을 모아놓았습니다.
							원하시는 내용이 없을 경우 1:1 고객문의를 통해 접수해주세요.
						</p>
					</div>
				</div>
				<!-- visualArea end -->
				<div class="contArea">
					<!--div class="inner"-->
					<div class="storeFind">
						<div class="srvcFilter">
							<div class="service">
								<span id="04" class="srvc" onclick="javascript:search('04','C');changeColor('04');">
									<input type="checkbox" id="1" value="04" disabled /> 
									<label for="1"> 메뉴 
										<span class="icon">
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_burger.png" alt="메뉴" />
										</span>
									</label>
								</span> 
								<span id="01" class="srvc"  onclick="javascript:search('01','C');changeColor('01');">
									<input type="checkbox" id="2" value="01" disabled />
									<label for="2"> 구매 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_cart.png" alt="카트" />
										</span>
									</label>
								</span> 
								<span id="02" class="srvc" onclick="javascript:search('02','C');changeColor('02');">
									<input type="checkbox" id="3" value="Y" disabled /> 
									<label for="3"> 매장이용 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_home.png"	alt="매장이용" />
										</span>
									</label>
								</span> 
								<span id="03" class="srvc" onclick="javascript:search('03','C');changeColor('03');">
									<input type="checkbox" id="4" value="Y" disabled /> 
									<label for="4"> 맥딜리버리 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_drive.png" alt="맥딜리버리" />
										</span>
									</label>
								</span> 
								<span id="05" class="srvc" onclick="javascript:search('05','C');changeColor('05');">
									<input type="checkbox" id="5" value="Y" disabled /> 
									<label for="5"> 채용 
										<span class="icon">
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_search.png" alt="채용" />
										</span>
									</label>
								</span> 
								<span id="07" class="srvc" onclick="javascript:search('07','C');changeColor('07');">
									<input type="checkbox" id="6" value="Y" disabled /> 
									<label for="6"> 프랜차이즈 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_handshake.png" alt="프랜차이즈" />
										</span>
									</label>
								</span> 
								<span id="09" class="srvc" onclick="javascript:search('09','C');changeColor('09');">
									<input type="checkbox" id="7" value="Y" disabled /> 
									<label for="7"> 맥도날드앱 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_mcd.png" alt="맥도날드앱" />
										</span>
									</label>
								</span> 
								<span id="08" class="srvc" onclick="javascript:search('08','C');changeColor('08');">
									<input type="checkbox" id="8" value="Y" disabled /> 
									<label	for="8"> 기타 
										<span class="icon"> 
											<img src="https://voc.mcd.co.kr/common/images/icon/ic_etc.png" alt="기타" />
										</span>
									</label>
								</span>
							</div>
						</div>
						<!-- 검색창 -->
						<div class="faqFind">
							<fieldset class="srchBox">
								<legend>질문 검색</legend>
								<div class="form">
									<div class="selectWrap" id="selectWrap" style="z-index: 100000; width: 150px">
										<select name="category" id="category" style="display: block; position: absolute; margin-left: -100000px;">
											<option value="" title="전체">전체</option>
											<option value="01" title="구매">구매</option>
											<option value="02" title="매장이용">매장이용</option>
											<option value="03" title="맥딜리버리">맥딜리버리</option>
											<option value="04" title="메뉴">메뉴</option>
											<option value="05" title="채용">채용</option>
											<option value="07" title="프랜차이즈">프랜차이즈</option>
											<option value="08" title="기타">기타</option>
											<option value="09" title="맥도날드앱">맥도날드앱</option>
										</select>
									</div>
									<form NAME="FNAME" class="realForm" method="post" onsubmit="return false;">
										<input type="hidden" name="RG_EMPL_ID" value=""> 
										<input type="hidden" name="FAQ_TYPE_CD" id="FAQ_TYPE_CD" value="">
										<input type="hidden" name="BBS_ID" id="BBS_ID" value="">
										<input type="hidden" name="FAQ_TYPE_CD2" id="FAQ_TYPE_CD2" value=""> 
										<input type="hidden" name="SELECTED_DATA" id="SELECTED_DATA" value=""> 
										<input type="text" placeholder="검색어를 입력해주세요." title="검색어 입력" style="width: 720px"
											name="srchKeyword" id="srchKeyword"	onkeydown="javascript:if (event.keyCode == 13) {search('','S');}"/>
									</form>
									<button type="button" class="btnMC btnM" onclick="search('','S');">검색하기</button>
								</div>
							</fieldset>
						</div>
					</div>
					<!-- //faqFind -->
					<div class="faqResult">
						<ul class="faqToggle" id="faqList">
						</ul>
						<table class="table_faq" style="text-align:center;">
							<tbody>
								<tr>
									<td width="650">
										<div id="LIST_DIV" class="table03">
											<table id="LIST_TB" width="100%" class="table01" cellspacing="1">
												<thead>
													<tr>
														<th class="colresize" style="cursor: pointer;" width="7%">
															<span onclick="">NO</span>
														</th>
														<th class="colresize" style="cursor: pointer;" width="20%">
															<span
															onclick="javascript:SELECTED_SORT_IDX[2] = 1 ; reqAll(10, 1);">분류</span>
														</th>
														<th class="colresize" style="cursor: pointer;" width="80%">
															<span
															onclick="javascript:SELECTED_SORT_IDX[2] = 2 ; reqAll(10, 1);">제목</span>
														</th>
													</tr>
													</thead>
													<tbody id="ajaxTable">
													<c:forEach var="vo" items="${vo}" varStatus="status">
													<tr id="LIST_TR_ID${status.count}"
														onmouseover="javascript:SELECTED_ROW_IDX[${vo.faq_seq}] = ${status.index} ;rOver(this.id, ${status.index}, LIST_DIV,${status.count});"
														onmouseout="javascript:rOut(this.id,${status.count});"
														onclick="javascript:changeClass(this.id, LIST_DIV,${status.count});tableClickEvent('LIST_ON_CLICK',${status.count});"
														ondblclick="tableClickEvent('LIST_ON_DBL_CLICK',${status.index});"
														style="cursor: pointer" class="">
														<td width="7%" align="center">${status.count}</td>
														<td style="text-align: center; padding-left: 0px;">${vo.faq_name}</td>
														<td style="text-align: left; padding-left: 5px;">${vo.faq_title}</td>
													</tr>
													<tr style="display: none" id="LIST_TR_ID${status.count}_DT">
														<td style="text-align: left; padding-left: 10px; padding-right: 10px;">
															<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/icon/A.gif">
														</td>
														<td colspan="3" style="text-align: left; padding-left: 10px; padding-right: 10px;">
															<font color="#920000">${vo.faq_content}</font>
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div> <!--button type="button" class="btnMC btnM" onclick="morePage('','S');">
							             	 +
							            </button-->
										<div class="btnMore" id="btnMore" style="display: none;">
											<button type="button" class="more" onclick="morePage('','S');">더보기</button>
										</div>
										<div id="LIST_PAGE_DIV" style="dispaly: none"></div>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- //faqResult -->
					</div>
				</div>
				<!--/div-->
			</div>
			<div class="side-box">
				<span>고객센터</span> <strong>080.208.1588</strong>
				<p>
					평일 09:00 ~ 18:00<br> (점심시간 12:00 ~ 13:00)
				</p>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function() { //$(document).ready(function){} 하고 같은 뜻
	
		selectMenu.init();
		$(document).find('.selectWrap').each(function()
		{
			// selectMenu.update( $(this) );
			selectMenu.update($(this).find('select'));
			$(this).css('z-index',100000);
		});
	});
		var selectMenu = {
				
				init : function( )
				{
					console.log("selectMenu");
					$.widget( "custom.customSelect", $.ui.selectmenu, 
					{

						_renderItem: function( ul, item ) 
						{
							var li = $( "<li>" ),
							wrapper = $( "<a>", { text: item.label } );
					
							if ( item.disabled ) {
								li.addClass( "ui-state-disabled" );
							}
							 console.log('--render')
							return li.append( wrapper ).appendTo( ul );
							
						},

						_drawButton: function() 
						{
							var e, i = this, s = this._parseOption(this.element.find("option:selected"), this.element[0].selectedIndex);
							this.labels = this.element.labels().attr("for", this.ids.button),
							 console.log('xxx', '',this )

							this._on(this.labels, {
								click: function(t) {
									this.button.focus(),
									t.preventDefault()
								},
							}),
							this.element.hide(),
							this.button = $("<button>", {
								tabindex: this.options.disabled ? -1 : 0,
								id: this.ids.button,
								// role: "combobox",
								"aria-expanded": "false",
								"aria-autocomplete": "list",
								"aria-owns": this.ids.menu,
								"aria-haspopup": "true",
								title: this.element.attr("title")
							}).insertAfter(this.element),
							this._addClass(this.button, "ui-selectmenu-button ui-selectmenu-button-closed", "ui-button ui-widget"),
							
							// 변경
							// e = t("<label>").appendTo(this.button),
							// this._addClass(e, "ui-selectmenu-icon", "ui-icon " + this.options.icons.button),
							// 변경

							this.buttonItem = this._renderButtonItem(s).appendTo(this.button),
							this.options.width !== !1 && this._resizeButton(),
							this._on(this.button, this._buttonEvents),
							this.button.one("focusin", function() {
								i._rendered || i._refreshMenu()
							})
							
						},

						// _setAria: function(t) 
						// {
							// var e = this.menuItems.eq(t.index).attr("id");
							// this.button.attr({
								// "aria-labelledby": e,
								// "aria-activedescendant": e
							// })
							// this.menu.attr("aria-activedescendant", e)
						// },

						_renderButtonItem: function( item ) 
						{
							var buttonItem = $( "<span>", {
								"class": "ui-selectmenu-text"
							});
							this._setText( buttonItem, item.label );
							 console.log('--xxx')
							 console.log( this.element.parent() )
							this.element.parent().find('button').attr('tabindex','-1');
							this.element.parent().find('.ui-selectmenu-menu').attr('tabindex','-2');
							return buttonItem;
						}
					});
				},
				update : function(target)
				{
					 console.log('--00')
					var select = target;
					
					if( select.data('selectBox') ){
						select.customSelect( "refresh" );

					}else{
						var opt = {
							appendTo : select.parent(),
							select : function( event, ui ) {
								 console.log('===')
								select.trigger('select');
								var list = select.parent().find('.ui-menu-item');
								list.find('a').removeAttr('aria-selected');
								list.eq(ui.item.index).find('a').attr('aria-selected',true);
							},
							close : function(){
								select.trigger('close');
								$(this).closest('.selectWrap').attr('style','z-index:10 !important');
							},
							change : function(event, ui) {
								select.trigger('change');
							},
							open : function(){
								select.trigger('open');
								$(this).closest('.selectWrap').attr('style','z-index:11 !important');
							}
						}
					/* 	if( select.attr('style') ){
							var w = parseInt(select.attr('style').replace('width:','250px'));
							opt.width = w;
						} */

						select.customSelect( opt );
						select.data('selectBox',true);

						select.one('close',function()
						{
							select.parent().find('.ui-menu-item').eq(select[0].selectedIndex).find('a').attr('aria-selected',true);
						});
						// var m = select.customSelect('instance');
						select.one('open',function()
						{
							var a = select.parent().find('.ui-menu-item a');
							a.removeAttr('tabindex');
							a.on('click',function()
							{		
							}) 
						})
						 console.log('xx ',select.parent().find('>button').length)
						
						select.css({
							display:'block',
							position:'absolute',
							// top:'100px'
							'margin-left' : '-100000px'
						})
						
						var parent = select.parent();
						select.on('focus' , function()
						{
							parent.addClass('focusLine')
						})
						select.on('focusout' , function()
						{
							parent.removeClass('focusLine')
						})

						select.on('change',function(){
							 console.log('xxx')
							select.customSelect("refresh");
							
						})
					}
				}
			};
</script>

	<%@ include file="footer.jsp"%>