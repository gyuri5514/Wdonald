<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>McDonald's</title>
<script type="text/javascript" src="resources/js/faq/jquery-1.7.min.js"></script>
<link type="text/css" rel="stylesheet" media="all" href="resources/css/faq/app_popup.css" />
<link type="text/css" rel="stylesheet" media="all" href="resources/css/faq/app_popup_common.css" />
<link rel="stylesheet" href="resources/css/faq/app_common.css" />

<script type="text/javascript" src="resources/js/faq/customer_commonTable.js"></script>
<script type="text/javascript" src="resources/js/faq/ajax.js"></script>
<script type="text/javascript" src="resources/js/faq/newUtil.js"></script>

<script>
var MEMORY_INIT = true ;

function init(){
	initTable(1);
	$('#searchWord').focus();
}

 function search()
 {	
	if($('#searchWord').val() == "")
	{
		alert("검색어를 입력 해 주세요.");
		$('#searchWord').focus();
		return
	}
	reqStoreList();
	//document.getElementById("clickStore").style.display = "";
	
	var qa_store = document.getElementById('searchWord').value;
	
	$.ajax({
		url:"qnaStoreSearchP.do",
		data:{
			qa_store : qa_store
		},
		dataType: "json",  
		type: "post",
		success:function(data){
			//alert(data);
			alert("ajax 성공");
		},
		error:function(){
			alert("failed");
		}
	});
	
	
 }
 
 var storeList;
 function getColInfo(tbIdx, type, rowIdx){
		//STEP 1. 변수설정
		var arrColNm = new Array();
		var arrStartOrderBy = new Array();
		var arrColSize = new Array();
		var arrMaxListCnt = new Array(); 
		var arguCnt = arguments.length;
		var value =  "";
		var a = type;        //인자값이 3개들어오면 type은 json object    
		var i = rowIdx;
		
		//STEP 2. 테이블정보 설정 (const값임)
		arrStartOrderBy[0] = "STORE_NM asc";
		arrColSize[0] = "";
		arrMaxListCnt[0] = 10;        
		arrColNm[0] = ",매장명, 주소";            
	    //MAX_PAGE_SET[0] = 5;
	    
		//STEP 3. 원하는 컬럼정보를 가져다 줌.    
		if (arguCnt == 3){ 					
			value = [a.STORE_NM[i], a.STORE_ADDRESS[i]];
		}else{
			value = getColDetailInfo(arguCnt, type, tbIdx, arrColNm, arrMaxListCnt, arrStartOrderBy, arrColSize );
		}
		return value;
	}
 
 function reqStoreList(maxListCnt, reqPage){	
		var tbIdx = 0;
		if(maxListCnt == null) maxListCnt = getColInfo(tbIdx, "maxListCnt"); 
		if(reqPage == null) reqPage = 1 ;

		var params = "event_id=DefaultAction.getListPageAjax" ;
		params += "&sql_id=storeSearch.getCustomerSearchStoreList";
		params += "&curPage="+reqPage ;  
		params += "&listCnt="+maxListCnt ;
		params += "&"+getOrderByInfo(tbIdx) ;
		new ajax.xhr.ExtRequest('/FrontServlet', params, resStoreList, 'POST', null, false);
	}

	function resStoreList(jsonObj){		
		storeList=jsonObj; 
		var tbNm = "LIST";
		var reqSortFnNm = "reqStoreList";
		var tbIdx = 0;
		var union = true;		
		
		assistMakeTablePage(jsonObj, tbNm, reqSortFnNm, tbIdx, union);
		
		var dataNullChk = jsonObj.totCnt==null ? true : false ;
		hideColumn("LIST_TB", 0, dataNullChk) ;
		
	}
	
	function LIST_MAKE_ARR(i, viewCols, htmlString, jsonObj, divNm, tbIdx){
		   var viewSet = getColInfo(tbIdx, jsonObj, i);
		   console.log("htmlString : " + htmlString);
		   for(j=0 ;j < (viewCols-1) ; j++){
		    	if(j==(SELECTED_SORT_IDX[tbIdx]-1)) htmlString += '<td align="left" id="'+divNm+'_sort'+i+'Td'+j+'" style="background-color:'+SORT_TD_OVER_COLOR+'">'+viewSet[j]+'</td>';
		        else
		        {
		        		htmlString += '<td align="center">'+viewSet[j]+'</td>';
		        }
		    }
		   console.log("================================");
		   console.log(htmlString);
		   return htmlString ;
	}
	
	//리스트 클릭했을때
	function LIST_ON_CLICK(idx){	
		opener.document.getElementById("STORE_SEQ").value=storeList.STORE_SEQ[idx];
		opener.document.getElementById("STORE_NM").value=storeList.STORE_NM[idx];
		opener.document.getElementById("STORE_ADDRESS").value=storeList.STORE_ADDRESS[idx];
			
		window.self.close();
	}
	
</script>

</head>
<body  class="bg_login" onload="init();" scroll="auto" style="overflow-x:hidden">
<form name="mainForm" onsubmit="return false;">
<input type="hidden"  name="appendSql" id="appendSql"  value="1=1">

<div class="popwrap">
    <div class="popup-content">
          <div class="head">
              <img src="resources/wcdonald.png" alt="맥도날드" />
              <h1>매장검색</h1>
          </div>
          <p>찾으시는 매장명이나 주소를 입력 후 해당 매장을 선택해 주세요.<br>
              매장 문의가 아닐 경우는 '<span>매장미지정</span>'을 검색해 주세요.</p>
          <div class="search-shop">
              <input class="int" type="text" name="searchWord" id="searchWord" onkeydown="javascript:if (event.keyCode == 13) {search(); }">
              <button class="btn bg-mcdgold" type="button" onClick="search();">매장검색</button>
          </div>
          <div id="LIST_DIV" class="table03"></div>
    </div>
</div>

</form>
</body>
</html>