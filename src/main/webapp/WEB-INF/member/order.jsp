<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="resources/css/menu/menu.css">

<div class="order_layout">
	<h1 class="container">ORDER</h1>
	<div class="configurator-body" role="main">
		<div class="configurator-scroller scroller">
			<div class="container">
				<div class="configurator-step step-choose-meals">
					<h3 class="step-title">메뉴를 선택하세요</h3>
					<div class="step-content">
						<div id="available-sets"></div>
						<div>
							<form id="orderForm">
								<table id="table-select-meal" class="table table-select-meal">
									<c:if test="${burgerVO != null}">
										<input type="hidden" id="b_code" value="${burgerVO.b_code}">
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
												<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
												<th colspan="2" class="side-column">&nbsp;사이드</th>
												<th colspan="2"class="drink-column">&nbsp;&nbsp;음료</th>
												<th class="change-column">선택</th>
												<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
											</tr>
										</thead>
										<tbody>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="라지세트" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src= "${burgerLgSetVO.b_lgset_img_path}" alt="" class="img-block1">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item1-title">${burgerLgSetVO.b_lgset_name}</h4>
													<small>${burgerLgSetVO.b_lgset_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${burgerLgSetVO.b_lgset_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${burgerLgSetVO.b_lgset_kcal}kcal</td> --%>
												<td colspan="2" class="side-column">선택안함</td>
												<td colspan="2" class="drink-column">선택안함</td>
												<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
												<td colspan="2" class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)" disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
													
												</td>
											</tr>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="세트" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src="${burgerSetVO.b_set_img_path}" alt="" class="img-block2">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item2-title">${burgerSetVO.b_set_name}</h4>
													<small>${burgerSetVO.b_set_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${burgerSetVO.b_set_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${burgerSetVO.b_set_kcal}kcal</td> --%>
												<td colspan="2" class="side-column">선택안함</td>
												<td colspan="2" class="drink-column">선택안함</td>
												<td  class="change-column"><a href="#" onclick="sideOpen(1)">변경</a></td>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',2)" disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result2" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',2)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
												</td>
											</tr>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="단품" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src="${burgerVO.b_img_path}" alt="" class="img-block3">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item3-title">${burgerVO.b_name}</h4>
													<small>${burgerVO.b_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${burgerVO.b_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${burgerVO.b_kcal}kcal</td> --%>
												<td colspan="2" class="side-column"></td>
												<td colspan="2" class="drink-column"></td>
												<td class="change-column"></td>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',3)"disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result3" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',3)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</c:if>
									<c:if test="${winMorningVO != null}">	
										<input type="hidden" id="w_code" value="${winMorningVO.w_code}">	
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
												<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
												<th colspan="2" class="side-column">&nbsp;사이드</th>
												<th colspan="2"class="drink-column">&nbsp;&nbsp;음료</th>
												<th class="change-column">선택</th>
												<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
											</tr>
										</thead>
										<tbody>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="세트" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src= "${winMorningSetVO.w_set_img_path}" alt="" class="img-block1">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item1-title">${winMorningSetVO.w_set_name}</h4>
													<small>${winMorningSetVO.w_set_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${winMorningSetVO.w_set_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${winMorningSetVO.w_set_kcal}kcal</td> --%>
												<td colspan="2" class="side-column">선택안함</td>
												<td colspan="2" class="drink-column">선택안함</td>
												<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)" disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
													
												</td>
											</tr>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="단품" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src="${winMorningVO.w_img_path}" alt="" class="img-block2">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item2-title">${winMorningVO.w_name}</h4>
													<small>${winMorningVO.w_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${winMorningVO.w_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${winMorningVO.w_kcal}kcal</td> --%>
												<td colspan="2" class="side-column"></td>
												<td colspan="2" class="drink-column"></td>
												<td  class="change-column"></td>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',2)" disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result2" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',2)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</c:if>
									<c:if test="${sideVO != null}">
										<input type="hidden" id="s_code" value="${sideVO.s_code}">
										<input type="hidden" id="s_name" value="${sideVO.s_name}">
										<c:if test="${sideVO.s_code == 704 || sideVO.s_code == 705 || sideVO.s_code == 706}">
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
												<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
												<th colspan="2" class="side-column">&nbsp;사이드</th>
												<th class="change-column">선택</th>
												<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
											</tr>
											</thead>
											<tbody>
												<tr id="row" class="rowCheck">
													<td class="controls-column">
														<div class="input-group item-quantity item-quantity-picker">
															<input type="checkbox" name="checkbox" value="사이드" class="form-controla"/> 
														</div>
													</td>
													<td class="picture-column">
														<img src= "${sideVO.s_img_path}" alt="" class="img-block1">
													</td>
													<td colspan="2" class="description-column">
														<h4 class="item1-title">${sideVO.s_name}</h4>
														<small>${sideVO.s_kcal}kcal</small>
														<p class="item-description"></p>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${sideVO.s_price}"/>
													<td class="cost-column">&#8361;${formatPrice}</td>
													<%-- <td class="calories-column">${sideVO.s_kcal}kcal</td> --%>
													<td colspan="2" class="side-column">선택안함</td>
													<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
													<td colspan="2" class="quantity-column">
														<div class="input-group item-quantity item-quantity-picker">
															<span class="input-group-btn">
																<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)"disabled><i class="fas fa-minus"></i></button>
															</span>
															<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
															<span class="input-group-btn">
																<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
															</span>
														</div>
													</td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${sideVO.s_code != 704 && sideVO.s_code != 705 && sideVO.s_code != 706}">
											<thead>
												<tr>
													<th class="controls-colum">&nbsp;</th>
													<th class="picture-column">&nbsp;</th>
													<th colspan="2" class="description-column">&nbsp;</th>
													<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
													<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
													<th colspan="2" class="change-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
													<th colspan="2" class="quantity-column">
												</tr>
											</thead>
											<tbody>
												<tr id="row" class="rowCheck">
													<td class="controls-column">
														<div class="input-group item-quantity item-quantity-picker">
															<input type="checkbox" name="checkbox" value="사이드" class="form-controla"/> 
														</div>
													</td>
													<td class="picture-column">
														<img src= "${sideVO.s_img_path}" alt="" class="img-block1">
													</td>
													<td colspan="2" class="description-column">
														<h4 class="item1-title">${sideVO.s_name}</h4>
														<small>${sideVO.s_kcal}kcal</small>
														<p class="item-description"></p>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${sideVO.s_price}"/>
													<td class="cost-column">&#8361;${formatPrice}</td>
													<%-- <td class="calories-column">${sideVO.s_kcal}kcal</td> --%>
													<td colspan="2" class="quantity-column">
														<div class="input-group item-quantity item-quantity-picker">
															<span class="input-group-btn">
																<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)"disabled><i class="fas fa-minus"></i></button>
															</span>
															<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
															<span class="input-group-btn">
																<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
															</span>
														</div>
													</td>
												</tr>
											</tbody>
										</c:if>
									</c:if>
									<c:if test="${drinkVO != null}">
										<input type="hidden" id="d_code" value="${drinkVO.d_code}">
										<input type="hidden" id="d_name" value="${drinkVO.d_name}">
										<c:if test="${drinkVO.d_code == 323 || drinkVO.d_code == 324 || drinkVO.d_code == 325 || drinkVO.d_code == 326 || drinkVO.d_code == 327}">
											<thead>
												<tr>
													<th class="controls-colum">&nbsp;</th>
													<th class="picture-column">&nbsp;</th>
													<th colspan="2" class="description-column">&nbsp;</th>
													<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
													<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
													<th colspan="2"class="drink-column">&nbsp;&nbsp;음료</th>
													<th class="change-column">선택</th>
													<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
												</tr>
											</thead>
											<tbody>
												<tr id="row" class="rowCheck">
													<td class="controls-column">
														<div class="input-group item-quantity item-quantity-picker">
															<input type="checkbox" name="checkbox" value="음료" class="form-controla"/> 
														</div>
													</td>
													<td class="picture-column">
														<img src= "${drinkVO.d_img_path}" alt="" class="img-block1">
													</td>
													<td colspan="2" class="description-column">
														<h4 class="item1-title">${drinkVO.d_name}</h4>
														<small>${drinkVO.d_kcal}kcal</small>
														<p class="item-description"></p>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${drinkVO.d_price}"/>
													<td class="cost-column">&#8361;${formatPrice}</td>
													<%-- <td class="calories-column">${drinkVO.d_kcal}kcal</td> --%>
													<td colspan="2" class="drink-column">선택안함</td>
													<td class="change-column"><a href="#" onclick="sideOpen(0);">변경</a></td>
													<td colspan="2" class="quantity-column">
														<div class="input-group item-quantity item-quantity-picker">
															<span class="input-group-btn">
																<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)"disabled><i class="fas fa-minus"></i></button>
															</span>
															<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
															<span class="input-group-btn">
																<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
															</span>
														</div>
													</td>
												</tr>
											</tbody>
											</c:if>
											<c:if test="${drinkVO.d_code != 323 && drinkVO.d_code != 324 && drinkVO.d_code != 325 && drinkVO.d_code != 326 && drinkVO.d_code != 327}">
											<thead>
												<tr>
													<th class="controls-colum">&nbsp;</th>
													<th class="picture-column">&nbsp;</th>
													<th colspan="2" class="description-column">&nbsp;</th>
													<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
													<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
													<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
												</tr>
											</thead>
											<tbody>
												<tr id="row" class="rowCheck">
													<td class="controls-column">
														<div class="input-group item-quantity item-quantity-picker">
															<input type="checkbox" name="checkbox" value="음료" class="form-controla"/> 
														</div>
													</td>
													<td class="picture-column">
														<img src= "${drinkVO.d_img_path}" alt="" class="img-block1">
													</td>
													<td colspan="2" class="description-column">
														<h4 class="item1-title">${drinkVO.d_name}</h4>
														<small>${drinkVO.d_kcal}kcal</small>
														<p class="item-description"></p>
														
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${drinkVO.d_price}"/>
													<td class="cost-column">&#8361;${formatPrice}</td>
													<%-- <td class="calories-column">${drinkVO.d_kcal}kcal</td> --%>
													<td colspan="2" class="quantity-column">
														<div class="input-group item-quantity item-quantity-picker">
															<span class="input-group-btn">
																<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)"disabled><i class="fas fa-minus"></i></button>
															</span>
															<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
															<span class="input-group-btn">
																<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
															</span>
														</div>
													</td>
												</tr>
											</tbody>
										</c:if>
									</c:if>
									<c:if test="${dessertVO != null}">
										<input type="hidden" id="dessert_code" value="${dessertVO.dessert_code}">
										<input type="hidden" id="dessert_name" value="${dessertVO.dessert_name}">
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
												<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
												<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
											</tr>
										</thead>
										<tbody>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="디저트" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src= "${dessertVO.dessert_img_path}" alt="" class="img-block1">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item1-title">${dessertVO.dessert_name}</h4>
													<small>${dessertVO.dessert_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${dessertVO.dessert_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${dessertVO.dessert_kcal}kcal</td> --%>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)"disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</c:if>
									<c:if test="${happyMealVO != null}">
										<input type="hidden" id="h_code" value="${happyMealVO.h_code}">
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">&nbsp;&nbsp;&nbsp;가격</th>
												<!-- <th class="calories-column">&nbsp;&nbsp;kcal</th> -->
												<th colspan="2" class="side-column">&nbsp;사이드</th>
												<th colspan="2"class="drink-column">&nbsp;&nbsp;음료</th>
												<th class="change-column">선택</th>
												<th colspan="2" class="quantity-column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</th>
											</tr>
										</thead>
										<tbody>
											<tr id="row" class="rowCheck">
												<td class="controls-column">
													<div class="input-group item-quantity item-quantity-picker">
														<input type="checkbox" name="checkbox" value="세트" class="form-controla"/> 
													</div>
												</td>
												<td class="picture-column">
													<img src= "${happyMealVO.h_img_path}" alt="" class="img-block1">
												</td>
												<td colspan="2" class="description-column">
													<h4 class="item1-title">${happyMealVO.h_name}</h4>
													<small>${happyMealVO.h_kcal}kcal</small>
													<p class="item-description"></p>
												</td>
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${happyMealVO.h_price}"/>
												<td class="cost-column">&#8361;${formatPrice}</td>
												<%-- <td class="calories-column">${happyMealVO.h_kcal}kcal</td> --%>
												<td colspan="2" class="side-column">선택안함</td>
												<td colspan="2" class="drink-column">선택안함</td>
												<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
												<td colspan="2" class="quantity-column">
													<div class="input-group item-quantity item-quantity-picker">
														<span class="input-group-btn">
															<button type="button" class="btn btn-decrease action-decrease btn-black" onclick="count('minus',1)" disabled><i class="fas fa-minus"></i></button>
														</span>
														<input type="number" name="" id="result" value="0" max="10" class="form-control" readonly="readonly" style="font-size:18px">
														<span class="input-group-btn">
															<button type="button" class="btn btn-increase action-in crease btn-black" onclick="count('plus',1)" disabled><i class="fas fa-plus"></i></button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</c:if>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="configurator-step step-upsell-items" id="upsell-section"></div>
			</div>
		</div>
	</div>
	<div class="configurator-footer">
		<div class="container">
			<div class="media">
				<div class="media-left">
					<a href="list.do" class="h5 text-default text-ucase btn-back action-cancel">
					<i class="fa fa-caret-left text-primary"></i> 메뉴로 돌아가기</a>
				</div>
				<div class="media-body">
					<div id="cost-section" class="clearfix"></div>
				</div>
				<div class="media-right text-center">
					<button class="btn btn-primary btn-red btn-lg btn-block btn-submit btn-saveorder action-saveorder" id="addBtn">
						<i class="fas fa-shopping-cart"></i>&nbsp;카트에 추가하기
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 사이드 변경 폼 -->
<div class="modal fade in" id="sideModal" aria-hidden="false" style="display: none;">
	<form action="" accept-charset="utf-8">
		<div class="modal-dialog columns-{{columnsToDisplay}}">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-ucase">항목을 선택하세요</h2>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<i class="fas fa-times"></i> 	
					</button>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="pull-left">
							<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/french_fries.png" 
								alt="" class="img-block choice-image"  id="image-choice"/>
						</div>
						<div class="media-body">
							<div class="available-choices-list row">
								<div class="choices-column col-xs-12 column-0">
									<div>
										<div class="radio" data-categoryid="">
											<div class="iradio1 checked">
												<input type="radio" name="select-choice" id="side-label1" class="form-radio1"
													data-cartname="후렌치 후라이 - 라지" style="position: absolute; opacity: 0;"
													aria-invalid="false" checked>
											</div>
											<label for="side1" class="side-label1"></label>
										</div>
									</div>
									<div>
										<div class="radio " data-categoryid="">
											<div class="iradio1">
												<input type="radio" name="select-choice" id="side-label2" class="form-radio1"
													data-cartname="골든 모짜렐라 치즈스틱 2조각" style="position: absolute; opacity: 0;"
													aria-invalid="false">
											</div>
											<label for="side2" class="side-label2"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="available-choices-list row"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="button" id="sideOkbtn" class="btn btn-red btn-lg btn-submit">확인</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!--  라디오버튼 클릭시 음료 이름, 음료 이미지를 ajax로 불러와야하며 불러온 이미지를 .pull-left의 img에 넣어줘야됨 .. -->
<!-- 음료 변경 폼 -->
<div class="modal fade in" id="drinkModal" aria-hidden="false" style="display: none;">
	<form action="" accept-charset="utf-8" novalidate="novalidate">
		<div class="modal-dialog columns-2">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-ucase">항목을 선택하세요</h2>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<i class="fas fa-times"></i> 
					</button>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="pull-left">
							<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/drink/vanilla_latte.png"
								alt="" class="img-block choice-image" id="image-choice2">
						</div>
						<div class="media-body">
							<div class="available-choices-list row">
								<c:forEach var="drinkList" items="${drinkList}" varStatus="status">
								<div class="choices-column col-xs-4 column-0">
									<c:if test="${status.count eq 1}">
										<div>
											<div class="radio " data-categoryid="">
												<div class="iradio2 checked">
													<input type="radio" name="select-choice" id="${drinkList.d_code}" class="form-radio"
														value="${drinkList.d_name}" data-cartname="${drinkList.d_name}"
														aria-invalid="false" style="position: absolute; opacity: 0;" checked>
												</div>
												<c:if test="${drinkList.d_code == 323 || drinkList.d_code == 324 || drinkList.d_code == 325 || drinkList.d_code == 326 || drinkList.d_code == 327}">
													<label for="choice-1507" class="radio-label">${drinkList.d_name} + 0원 </label>
												</c:if>
												<c:if test="${drinkList.d_code != 323 && drinkList.d_code != 324 && drinkList.d_code != 325 && drinkList.d_code != 326 && drinkList.d_code != 327}">
													<label for="choice-1507" class="radio-label">${drinkList.d_name} + 1000원 </label>
												</c:if>
											</div>
										</div>
									</c:if>
									<c:if test="${status.count ne 1}">
										<div>
											<div class="radio " data-categoryid="">
												<div class="iradio2">
													<input type="radio" name="select-choice" id="${drinkList.d_code}" class="form-radio"
														value="${drinkList.d_name}" data-cartname="${drinkList.d_name}"
														aria-invalid="false" 
														style="position: absolute;  opacity: 0;">
												</div>
												<c:if test="${drinkList.d_code == 323 || drinkList.d_code == 324 || drinkList.d_code == 325 || drinkList.d_code == 326 || drinkList.d_code == 327}">
													<label for="choice-1507" class="radio-label">${drinkList.d_name} + 0원</label>
												</c:if>
												<c:if test="${drinkList.d_code != 323 && drinkList.d_code != 324 && drinkList.d_code != 325 && drinkList.d_code != 326 && drinkList.d_code != 327}">
													<label for="choice-1507" class="radio-label">${drinkList.d_name} + 1000원</label>
												</c:if>
											</div>
										</div>
									</c:if>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="button" class="btn btn-red btn-lg btn-submit" id="drinkOkbtn">확인</button>
				</div>	
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
//변경 폼
$(function(){
	var side = "";
	var drink = "";
	var set_s_code = "";
	var set_d_code = "";
	var va = "";
	
	var b_code = $('#b_code').val();
	
	var s_code = $('#s_code').val();
	if(s_code != 704 && s_code != 705 && s_code != 706){
		side = $('#s_name').val();
	}
	
	var d_code = $('#d_code').val();
	if(d_code != 323 && d_code != 324 && d_code != 325 && d_code != 326 && d_code != 327){
		drink = $('#d_name').val();
	}
	
	var dessert_code = $('#dessert_code').val();
	var w_code = $('#w_code').val();
	var h_code = $('#h_code').val();
	
	console.log("b_code : " + b_code);
	console.log("s_code : " + s_code);
	console.log("d_code : " + d_code);
	console.log("dessert_code : " + dessert_code);
	console.log("w_code : " + w_code);
	console.log("h_code : " + h_code);
	
 	if(b_code == null && s_code == null && d_code == null && dessert_code == null && w_code == null
 			&& h_code == null) {
		alert("메뉴를 골라주세요");
		location.href="burger.do";
	} 
	
	$("#sideOkbtn").click(function() {
		if(b_code != null || w_code != null || h_code != null){
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					side = $(this).closest('.radio').find('label').text();
					set_s_code = $(this).val();
					console.log(side);
					console.log(set_s_code);
				} 
			});
			$("#drinkModal").slideDown(200);
		} else if(s_code != null || dessert_code != null) {
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					side = $(this).val();
					console.log(side);
					
					$('.rowCheck').find('.side-column').html(side);
				} 
			});
		} else if(d_code != null) {
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					drink = $(this).val();
					console.log(drink);
					
					$('.rowCheck').find('.drink-column').html(drink);
				} 
			});
		}
		$("#sideModal").attr("style", "display:none");
	});
	
	$("#drinkOkbtn").click(function() {
		$('.form-radio').each(function(){
			if($(this).is(":checked")) {
				drink = $(this).val();
				set_d_code = $(this).attr("id");
				console.log(drink);
				console.log(set_d_code);
			} 
		});
		$('.rowCheck').each(function(){
			if($(this).hasClass('selected')) {
				$(this).find('.side-column').html(side);
				$(this).find('.drink-column').html(drink);
			} 
		});
		$("#drinkModal").attr("style", "display:none");
	});
	
	$(".fas").click(function() {
		$(".modal").attr("style", "display:none");
	});
	
	$('#addBtn').click(function(){
		var va = "";
		var quantity = $('#result').val();
		var quantity2 = $('#result2').val();
		var quantity3 = $('#result3').val();
		
		$('.form-controla').each(function(){
			if($(this).is(":checked")) {
				va = $(this).val();
				if(va == "라지세트"){
					console.log(b_code);
					console.log(va);
					console.log(side);
					console.log(drink);
					console.log(quantity);
					if(b_code != null && va != "" && side != "" && drink != "" && set_s_code != "" && set_d_code != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?burger="+b_code+"&va="+va+"&side="+side+"&drink="+drink+"&quantity="+quantity+"&s_code="+set_s_code +"&d_code="+set_d_code+"";
					}
				} else if(va == "세트"){ 
					if(b_code != null && va != "" && side != "" && drink != "" && set_s_code != "" && set_d_code != "")  {
						if($('#result2').val() != 0)
							location.href="orderConfirm.do?burger="+b_code+"&va="+va+"&side="+side+"&drink="+drink+"&quantity="+quantity2+"&s_code="+set_s_code +"&d_code="+set_d_code+"";
					} else if(w_code != null && va != "" && side != "" && drink != "" && set_s_code != "" && set_d_code != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?w_code="+w_code+"&va="+va+"&side="+side+"&drink="+drink+"&quantity="+quantity+"&s_code="+set_s_code +"&d_code="+set_d_code+"";
					} else if(h_code != null && va != "" && side != "" && drink != "" && set_s_code != "" && set_d_code != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?h_code="+h_code+"&va="+va+"&side="+side+"&drink="+drink+"&quantity="+quantity+"&s_code="+set_s_code +"&d_code="+set_d_code+"";
					}
				} else if(va == "단품"){ 
					if(b_code != null && va != "") {
						if($('#result3').val() != 0)
							location.href="orderConfirm.do?burger="+b_code+"&va="+va+"&quantity="+quantity3+"";
					} else if(w_code != null && va != "") {
						if($('#result2').val() != 0)
							location.href="orderConfirm.do?w_code="+w_code+"&va="+va+"&quantity="+quantity2+"";
					}
				} else if(va == "사이드"){ 
					if(va != "" && s_code != null && side != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?&va="+va+"&s_code="+s_code+"&s_name="+side+"&quantity="+quantity+"";
					}
				} else if(va == "음료"){ 
					if(va != "" && d_code != null && drink != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?&va="+va+"&d_code="+d_code+"&d_name="+drink+"&quantity="+quantity+"";
					}
				} else if(va == "디저트"){ 
					if(va != "" && dessert_code != null && side != "") {
						if($('#result').val() != 0)
							location.href="orderConfirm.do?&va="+va+"&dessert_code="+dessert_code+"&s_name="+side+"&quantity="+quantity+"";
					}
				} else
					return;
			} 
		});
		
		if(va == "") {
			alert("메뉴를 선택하세요");
			return;
		} else if(va == "사이드" || va == "디저트") {
			if(s_code == 704 || s_code == 705 || s_code == 706) {
				if(side == "") {
					alert("사이드를 선택하세요");
					return;
				}
			}
			if($('#result').val() == 0){
				alert("수량을 선택하세요");
				return;
			}
		} else if(va == "음료") {
			if(drink == "") {
				alert("음료를 선택해주세요");
				return;
			}
		} else if(va == "단품") {
			if(side == "") {
				alert("사이드를 선택하세요");
				return;
			} 
			
			if($('#result').val() == 0){
				alert("수량을 선택하세요");
				return;
			}
		} else if(va != "단품") {
			if(side == "" || set_s_code == "") {
				alert("사이드를 선택하세요");
				return;
			} else if(drink == "" || set_d_code == "") {
				alert("음료를 선택하세요");
				return;
			} else if($('#result').val() == 0 && $('#result2').val() == 0 && $('#result3').val() == 0){
				alert("수량을 선택하세요");
				return;
			} else if(h_code != null) {
				if($('#result').val() == 0){
					alert("수량을 선택하세요");
					return;
				}
			}
		}
	});
	
	//체크박스 설정
	$('.form-controla').click(function() {
		if($(this).prop('checked')) {
			$('.form-controla').prop('checked', false);
			$('.form-controla').closest('tr').removeClass("selected");
			$('.form-controla').closest('tr').find('button').attr('disabled',true);
			$(this).prop('checked', true); 
			$(this).closest('tr').addClass("selected");
			$(this).closest('tr').find('button').attr('disabled',false);
		} else { 
			$(this).closest('tr').removeClass("selected");
			$(this).closest('tr').find('button').attr('disabled',true);
			return;
		}
	});

	//사이드변경 라디오버튼 설정
	$('.iradio1').click(function() {
		$(this).find('.form-radio1').prop('checked', true);
		if(s_code == 704) 
			$('#image-choice').attr("src","https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/french_fries.png");
		else if(s_code == 705)
			$('#image-choice').attr("src","https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/mc_nugget_4pieces.png");
		else if(s_code == 706)
			$('#image-choice').attr("src","https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/mc_sipcey_chicken_tender_4pieces.png");
		else {
			if($(this).find('.form-radio1').attr("id") == "side-label2"){
				$('#image-choice').attr("src","https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/golden_mozzarella_cheese_stick_4pieces.png");
			} else {
				$('#image-choice').attr("src","https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/snack%26side/french_fries.png");
			}
		}
			
		if($(this).find('.form-radio1').prop('checked')) {
			$('.form-radio1').prop('checked', false);
			$('.form-radio1').closest('.iradio1').removeClass("checked");
			$(this).find('.form-radio1').prop('checked', true); 
			$(this).addClass("checked");
		} else { 
			$(this).removeClass("checked");
		} 
	});
	
	 $('.iradio2').click(function() {
		$(this).find('.form-radio').prop('checked', true);
		if($(this).find('.form-radio').prop('checked')) {
			$('.form-radio').prop('checked', false);
			$('.form-radio').closest('.iradio2').removeClass("checked");
			$(this).find('.form-radio').prop('checked', true); 
			$(this).addClass("checked");
		} else { 
			$(this).removeClass("checked");
		} 
		
		var drinkList = JSON.parse('${drinkList}');
		for(var i = 0; i < drinkList.length; i++) {
			if(drinkList[i].d_code == $(this).find('.form-radio').attr("id")) {
				$('#image-choice2').attr("src",""+drinkList[i].d_img_path+"");
			}
		}
	 }); 
});

function sideOpen(index) {
	var val = "";
	$('.rowCheck').each(function(i){
		if($(this).find('.form-controla').prop('checked') && i == index){
			val = $(this).find('.form-controla').val();
			if(val == "라지세트"){ 
				$('label[for="side1"]').text("후렌치 후라이 - 라지");
				$('#side-label1').val(704);
				$('label[for="side2"]').text("골든 모짜렐라 치즈스틱 2조각");
				$('#side-label2').val(703);
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else if(val == "세트"){ 
				$('label[for="side1"]').text("후렌치 후라이 - 미디움");
				$('#side-label1').val(704);
				$('label[for="side2"]').text("골든 모짜렐라 치즈스틱 2조각");
				$('#side-label2').val(703);
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else if(val == "사이드"){ 
				$('label[for="side1"]').text($('#s_name').val() + " - 라지 + 1000원");
				$('#side-label1').val($('#s_name').val() + " - 라지");
				$('label[for="side2"]').text($('#s_name').val() + " - 미디움 + 700원");
				$('#side-label2').val($('#s_name').val() + " - 미디움");
			} else if(val == "음료"){ 
				$('label[for="side1"]').text($('#d_name').val() + " - 라지 + 1000원");
				$('#side-label1').val($('#d_name').val()+" - 라지");
				$('label[for="side2"]').text($('#d_name').val() + " - 미디움 + 700원");
				$('#side-label2').val($('#d_name').val()+" - 미디움");
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else
				return false;
		}  
	});	
	if(val == "") 
		alert("메뉴를 선택해주세요");
	 else
		$("#sideModal").slideDown(200);
}

function drinkOpen(index) {
	$('.rowCheck').each(function(){
		if($(this).find('a').hasClass('drinkCol'+index)){
			$('.rowCheck').find('.form-controla').prop('checked', false);
			$(this).find('.form-controla').prop('checked', true); 
			
			$('.rowCheck').removeClass("selected");
			
			$(this).addClass("selected");
			
			$("#drinkModal").slideDown(200);
		}
	});		 
}

function count(type, index) {
	  var resultElement = document.getElementById("result");
	  var number = $('#result').val();
	  var number2 = $('#result2').val();
	  var number3 = $('#result3').val();
	  //var number = resultElement.innerText;
	  //var number = document.getElementById("result");
	  
	  if(type === "plus"){
			if(index === 1){
				number = parseInt(number) + 1;
			}
		else if(index === 2){
			number2 = parseInt(number2) + 1;
		}
		else if(index === 3){
			if(number3 != null){
				number3 = parseInt(number3) + 1;
			}
		}
	  }else if(type === "minus") { 
			if(number > 0 || number2 > 0 || number3 > 0){
				if(index === 1){
					number = parseInt(number) - 1;
				}
				else if(index === 2){
					number2 = parseInt(number2) - 1;
				}
				else if(index === 3){
					if(number3 != null){
						number3 = parseInt(number3) - 1;
				}
			} else
				number = 0;
	 		}
	  }
	  if(number != null)
		 	 document.getElementById("result").value = number;
	  if(number2 != null)
		  document.getElementById("result2").value = number2;
	  if(number3 != null)
	 	 document.getElementById("result3").value = number3;
}
</script>