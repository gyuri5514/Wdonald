var allList = null;
var best10List = null;
var best102List = null;
var doMore = "N";
var pageStep = 2;
var totalPageCount = 0;

function init(){
	//console.log("mobile >> " + mobile_yn);
	
	//mobile 구분
	if(mobile_yn == "Yes")
	{
		location.href="/MC/MOB/main.jsp";
		return;
	}else{
		$("#btnMore").attr("style","display:block");
		initTable(3);
		//reqCbAuto("faqMain.getCmcd", "", "spFaqTypeCd", "FAQ_TYPE_CD2","", "80", "", "전체"); //분야
		
		/*reqCbAuto("faqMain.getCmcd", "", "selectWrap", "category","", "80", "", "전체"); //분야*/
		//reqBest10();
		//reqBest102();
		/*reqAll();*/
	}
	
}

function changeColor(obj){
	//document.getElementById(obj).style.backgroundColor = "#ffbc0d";
	
	for(i = 1; i < document.getElementById("category").options.length+1; i++){	// 01 ~ 09
		// id = 05 는 없다.
		if(i != 6){
			document.getElementById("0"+i).style.backgroundColor = "#fff";
			document.getElementById("0"+i).style.border = "1px solid #d1d1d1";
		}
	}
	document.getElementById(obj).style.backgroundColor = "#ffbc0d";
	document.getElementById(obj).style.border = "3px solid #ffbc0d";
	
	// selectbox selected
	for (i = 0; i < document.getElementById("category").options.length; i++) {
	    if (document.getElementById("category").options[i].value == obj) {
	        document.getElementById("category").options[i].selected = "selected";
	        var span = document.getElementsByClassName("ui-selectmenu-text");
	        
	        if(obj == "01"){
	        	span[0].innerHTML = '구매';
	        }else if(obj == "02"){
	        	span[0].innerHTML = '매장이용';
	        }else if(obj == "03"){
	        	span[0].innerHTML = '맥딜리버리';
	        }else if(obj == "04"){
	        	span[0].innerHTML = '메뉴';
	        }else if(obj == "05"){
	        	span[0].innerHTML = '채용';
	        }else if(obj == "07"){
	        	span[0].innerHTML = '프랜차이즈';
	        }else if(obj == "08"){
	        	span[0].innerHTML = '기타';
	        }else if(obj == "09"){
	        	span[0].innerHTML = '맥도날드앱';
	        }
	    }
	}
}
	
function search(type,type2)
{	
	// 더보기 초기화 	
	doMore = "N";
	pageStep = 2;
	totalPageCount = 0;
	$("#btnMore").attr("style","display:block");
	
	var MenuSelect = "";
	
	if(type == "04"){
		MenuSelect = "메뉴";
	}else if(type == "01"){
		MenuSelect = "구매";
	}else if(type == "02"){
		MenuSelect = "매장이용";
	}else if(type == "03"){
		MenuSelect = "맥딜리버리";
	}else if(type == "05"){
		MenuSelect = "채용";
	}else if(type == "07"){
		MenuSelect = "프랜차이즈";
	}else if(type == "08"){
		MenuSelect = "기타";
	}else if(type == "09"){
		MenuSelect = "맥도날드앱";
	}
	
	
	$.ajax({
		
		type : "get",
		url : "faqSelect.do",
		data : {
		 	MenuSelect : MenuSelect
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			console.log(data.length);
			$('#ajaxTable').html("");
			var content ="";
			for(var i = 0; i < data.length; i++){
				content += "<tr id='LIST_TR_ID"+i+"'"
				content += "onmouseover='javascript:SELECT_ROW_IDX["+data[i].faq_seq+"] = "+i+" ;rOver(this.id,"+i+", LIST_DIV,"+(i+1)+");'"
				content += "onmouseout='javascript:rOut(this.id,"+(i+1)+");'"
				content += "onclick='javascript:changeClass(this.id, LIST_DIV,"+i+");"
				content += "tableClickEvent('LIST_ON_CLICK',"+(i+1)+");'"
				content += "ondblclick='tableClickEvent('LIST_ON_DBL_CLICK',"+i+");'"
				content += "style='cursor: pointer' class=''>"
				content += "<td width='7%' align='center'>"+(i+1)+"</td>"
				content += "<td style='text-align: center; padding-left: 0px;'>"+data[i].faq_name+"</td>"
				content += "<td style='text-align: left; padding-left: 5px;'>"+data[i].faq_title+"</td> </tr>"
				content += "<tr style='display: none' id='LIST_TR_ID"+(i+1)+"_DT'>"
				content += "<td style='text-align: left; padding-left: 10px; padding-right: 10px;'>"
				content += "<img src='https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/icon/A.gif'></td>"
				content += "<td colspan='3' style='text-align: left; padding-left: 10px; padding-right: 10px;'>"
				content += "<font color='#920000'>"+data[i].faq_content+"</font></td></tr>"
				
			}
			$('#ajaxTable').html(content);
		}
	})
	
	if(type2 == "C")
	{
		//console.log("type2 : C");
		$("#srchKeyword").val('');
		$("#FAQ_TYPE_CD2").val(type);		
	}
	$("#FAQ_TYPE_CD").val($("#FAQ_TYPE_CD2").val());
	
	if(type2 == "A")
	{
		$("#srchKeyword").val('');
		$("#FAQ_TYPE_CD").val('');	
	}
	
	//on off 버튼 경로. 2016.05.03
	var btnUrl = "/common/images/button/new/";
	for(var i = 1; i < 9; i++)
	{
		var ii = "0"+i;
		if(ii == type)
		{
			$("#btn"+ii).attr("src", btnUrl+"btn_"+ii+"_on.png");
		}
		else
		{
			$("#btn"+ii).attr("src", btnUrl+"btn_"+ii+"_off.png");
		}
	}
	REQ_PAGE[2] = 1;
	
	/*reqAll();*/
}
//버튼 클릭시 page 늘어감
function morePage(type,type2)
{	
	//console.log("type :" + type + " / type2 : " + type2);
	if(type2 == "C")
	{
		//console.log("type2 : C");
		$("#srchKeyword").val('');
		$("#FAQ_TYPE_CD2").val(type);		
	}
	$("#FAQ_TYPE_CD").val($("#FAQ_TYPE_CD2").val());
	
	if(type2 == "A")
	{
		$("#srchKeyword").val('');
		$("#FAQ_TYPE_CD").val('');	
	}
	
	//on off 버튼 경로. 2016.05.03
	var btnUrl = "/common/images/button/new/";
	for(var i = 1; i < 9; i++)
	{
		var ii = "0"+i;
		if(ii == type)
		{
			$("#btn"+ii).attr("src", btnUrl+"btn_"+ii+"_on.png");
		}
		else
		{
			$("#btn"+ii).attr("src", btnUrl+"btn_"+ii+"_off.png");
		}
	}
	REQ_PAGE[2] = 1;
	
	doMore = "Y";
	
	totalPageCount = pageStep + "0";	// 더보기 눌르면 10씩 증가
	//console.log("totalPageCount : " + totalPageCount);
	pageStep++;
	//console.log("pageStep : " + pageStep);
	
	reqAll();
}

/*//자주찾는FAQ 전체 조회
function reqAll(maxListCnt, reqPage){	
	var tbIdx =2;
	if(maxListCnt == null) maxListCnt = getColInfo(tbIdx, "maxListCnt");
	if(reqPage == null) reqPage = 1;
	var params = "event_id=DefaultAction.getListPageAjax";
	params += "&sql_id=faqMain.all";
	params += "&curPage="+reqPage;
	params += "&listCnt="+maxListCnt;
	params += "&"+getOrderByInfo(tbIdx);
	
	new ajax.xhr.ExtRequest('/FrontServlet',params, resAll, 'POST', null, false);
}*/

function resAll(jsonObj)
{
	allList=jsonObj;
		
	var tbNm = "LIST";
	var reqSortFnNm = "reqAll";
	var tbIdx = 2;
	var union = true;	
	setTableType(0);
	assistMakeTablePage2(jsonObj, tbNm, reqSortFnNm, tbIdx, union);
	
	// 마지막 페이지 인 경우 더보기 버튼 display none 처리 (2021.04.09)	
	if( jsonObj.listCnt == jsonObj.totCnt ){
		document.getElementById("btnMore").style.display = "none";
	}
	
	
}


//자주찾는FAQ BEST10 조회
function reqBest10(maxListCnt, reqPage){	
	
	var tbIdx =0;
	if(maxListCnt == null) maxListCnt = getColInfo(tbIdx, "maxListCnt");
	if(reqPage == null) reqPage = 1;
	var params = "event_id=DefaultAction.getListPageAjax";
	params += "&sql_id=faqMain.getBest10";
	params += "&curPage="+reqPage;
	params += "&listCnt="+maxListCnt;
	params += "&"+getOrderByInfo(tbIdx);
	new ajax.xhr.ExtRequest('/FrontServlet',params, resBest10, 'POST', null, false);
}

function resBest10(jsonObj) 
{
	best10List=jsonObj;
	var tbNm = "BEST10LIST";
	var reqSortFnNm = "reqBest10";
	var tbIdx = 0;
	var union = true;		
	
	 // newUtil 전역변수.-꼼수.
	G_USED_DEF_HEADER = false ;
	setTableType(2);
	assistMakeTablePage2(jsonObj, tbNm, reqSortFnNm, tbIdx, union);
}

//최근 많이 조회된 건 BEST 10
function reqBest102(maxListCnt, reqPage){	
	var tbIdx =1;
	if(maxListCnt == null) maxListCnt = getColInfo(tbIdx, "maxListCnt");
	if(reqPage == null) reqPage = 1;
	var params = "event_id=DefaultAction.getListPageAjax";
	params += "&sql_id=faqMain.getBest102";
	params += "&curPage="+reqPage;
	params += "&listCnt="+maxListCnt;
	params += "&"+getOrderByInfo(tbIdx);
	new ajax.xhr.ExtRequest('/FrontServlet',params, resBest102, 'POST', null, false);
}

function resBest102(jsonObj)
{
	best102List=jsonObj;
	var tbNm = "BEST10LIST2";
	var reqSortFnNm = "reqBest102";
	var tbIdx = 1;
	var union = true;		
	
	 // newUtil 전역변수.-꼼수.
	G_USED_DEF_HEADER = false ;
	setTableType(2);
	assistMakeTablePage2(jsonObj, tbNm, reqSortFnNm, tbIdx, union);
}

function getColInfo(tbIdx, type, rowIdx)
{
	var arrColNm = new Array();
    var arrStartOrderBy = new Array();
    var arrColSize = new Array();
    var arrMaxListCnt = new Array(); 
    var arguCnt = arguments.length;//함수에 전달받은 매개변수의 수 
    var value =  "";
    var a = type;     
    var i = rowIdx;	

    //console.log('aa');

    TB_TYPE[0] = '1' ;	
    arrStartOrderBy[0] = "BEST10_SORT_NO ASC";
    arrColSize[0] = "";
    arrMaxListCnt[0] = 5;              
    arrColNm[0] = ",내용";
     
    TB_TYPE[1] = '2' ;	
    arrStartOrderBy[1] = "BEST10_SORT_NO ASC";
    arrColSize[1] = "";
    arrMaxListCnt[1] = 5;
    arrColNm[1] = ",내용";
   
    arrStartOrderBy[2] = "FAQ_TYPE_CD ASC";
    arrColSize[2] = "7%,20%,80%";
    /**
     * 페이징 받기
     * **/
    console.log("doMore : " + doMore);
    console.log("pageStep : " + pageStep);
    console.log("totalPageCount : " + totalPageCount);
    
    if(doMore=="Y"){
    	arrMaxListCnt[2] = totalPageCount;
    }else{
    	arrMaxListCnt[2] = 10;        
    }
    
    //arrMaxListCnt[2] = 10;
    arrColNm[2] =  "NO,분류,제목";
    MAX_PAGE_SET[2] = 10;
  
    if (arguCnt == 3)
    {       	
    	var typeLen = a.FAQ_TYPE_NM[i].length;
    	var ttlLen = 24 - typeLen;
     	
    	var bbs_ttl = a.BBS_TITLE[i].length > ttlLen ? a.BBS_TITLE[i].substr(0,ttlLen) + "..." : a.BBS_TITLE[i] ;
		var cont = "<font color='red'> [" +a.FAQ_TYPE_NM[i] + "]</font> " +bbs_ttl;
   
		if(tbIdx==0){
    		var no = i+1;
    		var img = "<img src='/common/images/customer/no_0"+no+".gif'>";
    		var val = img + cont;
    		
    		value = ["<span title='"+a.BBS_TITLE[i]+"'>"+val+"</span>"];
    	}else if(tbIdx==1){
    		var no = i+6;
    		if(no == 10){var img2 = "<img src='/common/images/customer/no_"+no+".gif'>";}
    		else{var img2 = "<img src='/common/images/customer/no_0"+no+".gif'>";}
    		var val2 = img2 + cont;    		
    		value = ["<span title='"+a.BBS_TITLE[i]+"'>"+val2+"</span>"];
    	}
    	else if(tbIdx==2){
    		value = [a.FAQ_TYPE_NM[i],a.BBS_TITLE[i]];
    	}	
    }
    else   
    {
        value = getColDetailInfo(arguCnt, type, tbIdx, arrColNm, arrMaxListCnt, arrStartOrderBy, arrColSize);
    }
    
    return value;
}

function BEST10LIST_MAKE_ARR(i,viewCols, htmlString, jsonObj, divNm, tbIdx)
{
	var viewSet = getColInfo(tbIdx, jsonObj, i);
	
	for(j=0; j<(viewCols-1); j++)
	{
		if(j==(SELECTED_SORT_IDX[tbIdx]-1)) htmlString += '<td align="center" id="'+divNm+'_sort'+i+'Td'+j+'" style="background-color:'+SORT_TD_OVER_COLOR+'">'+viewSet[j]+'</td>';
        else 	htmlString +='<td align="center">'+viewSet[j]+'</td>';		
	}
	
	return htmlString;
}

function BEST10LIST_ON_CLICK(idx)
{
	var x = window.event.clientX;
	var y = window.event.clientY;

	openBigCont(idx,'1',x,y);
	 	
	$("#BBS_ID").val(best10List.BBS_ID[i]);
	 
	var params = "event_id=DefaultAction.updateAjax" ;
	params += "&sql_id=faqMain.updateRead_cnt";
	new ajax.xhr.ExtRequest('/FrontServlet', params, resReadCntPlus, 'POST', '', false);
	
}
function resReadCntPlus(jsonObj){
}

function BEST10LIST2_MAKE_ARR(i,viewCols, htmlString, jsonObj, divNm, tbIdx)
{
	var viewSet = getColInfo(tbIdx, jsonObj, i);
	
	for(j=0; j<(viewCols-1); j++)
	{
		if(j==(SELECTED_SORT_IDX[tbIdx]-1)) htmlString += '<td align="left" id="'+divNm+'_sort'+i+'Td'+j+'" style="background-color:'+SORT_TD_OVER_COLOR+'">'+viewSet[j]+'</td>';
        else 	htmlString +='<td align="left">'+viewSet[j]+'</td>';		
	}
	
	return htmlString;
}

function BEST10LIST2_ON_CLICK(idx)
{
	var x = window.event.clientX;
	var y = window.event.clientY;
	
	openBigCont(idx,'2',x,y);
	
	$("#BBS_ID").val(best102List.BBS_ID[i]);
	  
	 	var params = "event_id=DefaultAction.updateAjax" ;
		params += "&sql_id=faqMain.updateRead_cnt";
		new ajax.xhr.ExtRequest('/FrontServlet', params, resReadCntPlus, 'POST', '', false);
}


function LIST_MAKE_ARR(i,viewCols, htmlString, jsonObj, divNm, tbIdx)
{
	var viewSet = getColInfo(tbIdx, jsonObj, i);
	
	for(j=0; j<(viewCols-1); j++)
	{
		var alignNm = 'center;padding-left:5px';
		if(j == 0){alignNm = 'center;padding-left:0px';}
		if(j == 1){alignNm = 'left;padding-left:5px';}
		
		if(j==(SELECTED_SORT_IDX[tbIdx]-1))
    	{  		
    		htmlString += '<td id="'+divNm+'_sort'+i+'Td'+j+'" style="background-color:'+SORT_TD_OVER_COLOR+';text-align:'+alignNm+';">'+viewSet[j]+'</td>';
    	}    	
        else{ 	
        	htmlString += '<td style="text-align:'+alignNm+';">'+viewSet[j]+'</td>';
        }
	}
	
	return htmlString;
}

function LIST_ON_CLICK(idx)
{
	 var i = idx-1;
	 if(document.getElementById("LIST_TR_ID"+idx+"_DT").style.display==""){
		  document.getElementById("LIST_TR_ID"+idx+"_DT").style.display="none";
		 }else{
		  document.getElementById("LIST_TR_ID"+idx+"_DT").style.display=""; 
		 }
	
	 $("#BBS_ID").val(allList.BBS_ID[i]);
	 
	var params = "event_id=DefaultAction.updateAjax" ;
	params += "&sql_id=faqMain.updateRead_cnt";
	new ajax.xhr.ExtRequest('/FrontServlet', params, resReadCntPlus, 'POST', '', false);
}


 /// *** 테이블을 그린다. (중복으로 쓰이는 중간설정부분을 자동설정해서 테이블을 그림  

function assistMakeTablePage2(jsonObj, tbNm, reqSortFnNm, tbIdx, union, appendTrId)
{
  	var colSizeStr = getColInfo(tbIdx, "colSize"); 
 	var colNmStr = getColInfo(tbIdx);
	var viewColCnt = getColInfo(tbIdx, "viewColCnt");			
	var maxListCnt = getColInfo(tbIdx, "maxListCnt"); ;
	var reqPageFnNm = reqSortFnNm ;
	makeTable_div(jsonObj, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt ,reqSortFnNm, jsonObj.totCnt, maxListCnt, reqPageFnNm, appendTrId,"BBS_DETAIL");   
   		
	//-- ※ 사용 된 로컬변수 초기화 영역 시작 --//
    if(MEMORY_INIT){
		jsonObj = null ;
		tbNm = null ;
		reqSortFnNm = null ;
		tbIdx = null ;
		union = null ;
		colSizeStr = null ;
		colNmStr = null ;
		viewColCnt = null ;
		maxListCnt = null ;
		reqPageFnNm = null ;
    }
	//-- # 사용 된 로컬변수 초기화 영역 종료 --//	
   		
}

//자주찾는 베스트 10 클릭시 크게 보기
function openBigCont(i,type,x,y)
{
	var spTitle = "내용보기"; 
	
	var strDialogId = "divBigCont" ;
	
	var strTitle = [] ;
	
	//strTitle.push('<div class="pop_alim">');
	strTitle.push('<div>');
	//strTitle.push('<span id="taBigCont" style="width:310px; height:100px; background:#f5f5dc; text-align:left"></span>');
	strTitle.push('<span id="taBigCont" style="width:310px; height:100px; background:#FFFFFF; text-align:left"></span>');
	strTitle.push('</div>');		 	
	
	$('body').append('<div id="'+strDialogId+'" style="display:none; overflow-y:hidden;" >'+strTitle.join("")+'</div>');
	
	if(type=='1'){	$("#taBigCont").html( best10List.BBS_DETAIL[i-1].replace (/\n/g, "<br>") );}
	else if(type=='2'){	$("#taBigCont").html( best102List.BBS_DETAIL[i-1].replace (/\n/g, "<br>") );}
   
	
	$('#'+strDialogId).dialog( 
			{ title: spTitle}
			,{ width:  350}
			,{ height: 200}
			,{ minWidth:  350}
			,{ minHeight: 100}
			,{ zIndex: 4000}
			,{ modal: false}
			,{ position : [x, y]}
			,{ resizable: false}
			
			//,{ beforeClose: function(event, ui){ $('#'+strDialogId).remove();}} // 닫기 이벤트(ESC포함).
		);
	
}
