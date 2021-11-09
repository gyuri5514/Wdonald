<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "mypage.jsp"%>
<style>
table{	
	border-radius: 3px;
   	box-shadow: inset 0 0 8px #bcbcbc;
   	width: auto;
}
.table-panel td, .table-panel th {
    padding: 15px 24px;
    border: 1;
    border-bottom: 1px solid #bcbcbc;
    text-align: left;
}
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    /* text-align: -internal-center; */
    text-align: center;
}
.table-addressbook .address-number {
    font-family: "Din Black",sans-serif;
    font-size: 1.5rem;

    
}
.table-default td, .table-default th {
    /* vertical-align: top; */
     
}
.table-addressbook tfoot .actions, .table-mycards .controls, .table-mycards tfoot .actions {
    text-align: right;
    
  
}
#address-number{
	font-family:"Din Black",sans-serif;
	font-size:24px;
	font-size:1.5rem;
	width:5%
}
.address-details,.table-addressbook .special-instructions{
	width:40%
}

</style>

<div class="col-md-9">
<h3 class="title-divider mt_0"><span>주소</span> <small>Address</small></h3>

<div class="page-content">
			<table class="table-default table-panel table-addressbook">
				<thead>
					<tr>
						<th scope="colgroup" colspan="2"><h3>주소</h3></th>
						<th scope="col"><h3>배달 시 유의사항</h3></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tfoot>
					<td colspan="4" class="actions">
						<a class="btn btn-red btn-lg" href="addressupdate.do">새로운 주소 추가</a>		
						<a class="btn btn-red btn-lg" href="main.do">메인화면으로 이동</a>
					</td>
				</tfoot>
				<c:forEach items="${addressVO}" var="addressBook" varStatus="status"> 
				<tbody>
					<tr>
						<td class="address-number">${status.count}</td>
						<td class="address-details">
							<!-- <div>${addressBook.address1}</div> gogogo -->
							<div>${addressBook.address1}</div>
							 <div>${addressBook.address2}</div>
						</td>
						<td class="special-instructions">${addressBook.order_comment}</td>
						<td class="controls">
						 <a class="text-gray-light" title="주소 삭제하기" onclick="del(${addressBook.address_seq})"><i class="far fa-trash-alt"></i>
						<!-- <input id="key" value="0" type="text"/> --> </a>
						 </td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
		</div>
	
</div>
</div>
</div>


<%@ include file = "footer.jsp"%>
<script>
function del(seq){
	var chk = confirm('정말 삭제하시겠습니까? ');
	if(chk){
		//alert( 'ddd : '+ $('#key').val());
		location.href = 'delete.do?address_seq=' + seq;
		
	}else{
		alert('주소 수정은 삭제 후 다시 작성 부탁드립니다.');
	}
}
</script>