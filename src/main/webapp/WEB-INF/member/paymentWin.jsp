<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="resources/css/payment/payment.css">
<script src="resources/js/payment/payment.js"></script>
<div class="h1-area">
   <h3>
      <font>주문 확인</font>
   </h3>
   <br>
   <hr>
</div>
<div class="panel panel-lg panel-default">
   <div class="panel-heading">

      <h3>지불 유형을 선택하십시오</h3>
   </div>
   <form>
      <div class="panel-body">
         <fieldset class="fieldset payment-types">
            <div class="form-group row">
               <div class="radio">
                  &nbsp;&nbsp;<input type="radio" id="credit" name="payment_type"
                     value="1"> <label for="creditpayment">&nbsp;신용카드
                     / 간편결제 / 기타 </label> <br>
                  <hr>
                  <br> 현장 결제<br>
                  <br> &nbsp;&nbsp;<input type="radio" id="cash"
                     name="payment_type" value="2"> <label for="cash">&nbsp;현금</label><br>
                  <div id="selectedCash"></div>
                  <br>
                  <hr>
                  <br> &nbsp;&nbsp;<input type="radio" id="card_meeting"
                     name="payment_type" value="4"> <label for="card_meeting">&nbsp;카드
                     (현장에서 카드 단말기로 결제)</label> <br>
                  <hr>
                  <br> &nbsp;&nbsp;<input type="checkbox" value="1"
                     id="cashbill" name="cashbill"><label for="cashbill">&nbsp;&nbsp;현금
                     영수증 요청</label> <br> &nbsp; * 핸드폰 번호 &nbsp;&nbsp;&nbsp; +82
                  &nbsp;&nbsp; <input type="text" disabled="disabled"
                     placeholder=" 숫자만 입력" style="background-color: #e2e2e2"
                     name="cashbillphone" id="cashbillphone"> <br>
                  <br>&nbsp; * 결제를 완료하기 위해 외부 웹 사이트로 안전하게 이동합니다.
               </div>
               <br>

            </div>
         </fieldset>
      </div>
   </form>
</div>
<%@include file="footer.jsp"%>