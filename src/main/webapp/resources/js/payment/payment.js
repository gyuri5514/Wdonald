/*
 *   payment.js 
 */
$(document).ready(function() {
   $('#cashbill').click(function() {
      if ($('input:checkbox[id="cashbill"]').is(":checked") == true) {
         $("#cashbillphone").removeAttr("disabled")
         $("#cashbillphone").css("background-color","white")
      } else {
         $("#cashbillphone").attr("disabled", "disabled")
         $("#cashbillphone").css("background-color","#e2e2e2")
      }
   })
   
   $('#cash').click(function() {
         var content = "&nbsp;<label>금액을 선택해주세요."+
            "</label>&nbsp;&nbsp;&nbsp;<select name='exactCash'>"+
                "<option value='won1'>1만원권</option>"+
                  "<option value='won5'>5만원권</option>"+
            "<option value='exact'>금액에 맞게</option></select>";
      if ($('input:radio[id="cash"]').is(":checked") == true) {
            $('#selectedCash').html(content);
      }
      
   })
   
   $('#card_meeting').click(function() {
            $('#selectedCash').html("");
   })
   
   $('#credit').click(function() {
            $('#selectedCash').html("");
   })

})

