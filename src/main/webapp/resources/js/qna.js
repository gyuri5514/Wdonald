/**
 * 
 */
function page(type)
{
	if(type == 1)
	{
		document.getElementById("div1").style.display = "block";
		document.getElementById("div2").style.display = "none";
	}
	else if(type==2)
	{
		document.getElementById("div1").style.display = "none";
		document.getElementById("div2").style.display = "block";
	}
	else if(type==3)
	{
		document.getElementById("POP_OK").style.display = "none";
		location.href="/MC/HOM/faqMain.jsp";
	}
}

//체크
/*function insertCheck() 
{	
	if ( !document.getElementById('agree-y').checked )
	{
		alert("개인정보의 수집, 이용에 관한 사항에 동의하여야 합니다.");
		return false;
	}

	if ( !document.getElementById('agree-y2').checked )
	{
		alert("개인정보의 제3자 제공에 동의하여야 합니다.");
		return false;
	}
	
	if(($("#STORE_NM").val()).trim() == "")
	{
		alert("매장을 선택해 주세요.");
		$('#STORE_NM').focus();
		return false;
	}
	
	if(($("#CUST_NM").val()).trim() == "")
	{
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
		
	if (($("#EMAIL").val()).trim() == "")
	{
		alert("이메일을 입력해 주십시요.");
		$('#EMAIL').focus();
		return false;
	}

	if (!isValidEmail($("#EMAIL").val()))
	{
		alert("이메일 형식 오류입니다.");
		$('#EMAIL').focus();
		return false;
	}
		
	if(($("#CUST_PASSWORD").val()).trim() == "")
	{
		alert("비밀번호를 입력해 주세요.");
		$('#CUST_PASSWORD').focus();
		return false;
	}
	
	if(($("#ACPT_TITLE").val()).trim() == "")
	{
		alert("제목을 입력해 주세요.");
		$('#ACPT_TITLE').focus();
		return false;
	}
	if(($("#ACPT_DESC").val()).trim() == "")
	{
		alert("내용을 입력해 주세요.");
		$('#ACPT_DESC').focus();
		return false;
	}
	if($("#FILE_1").val() != "")
	{
		if(!extCheck()) return false;
	}	
	
	return true;
}*/

function insert()
{	
	if(!insertCheck()) return;
	
	$("#IS_PERSON_AGREE_YN").val($(':radio[name="agree-y"]:checked').val());
	$("#IS_THIRD_AGREE_YN").val($(':radio[name="agree-y2"]:checked').val());
//	$("#IS_SENSITIVE_AGREE_YN").val($(':radio[name="radio3"]:checked').val()); //민감정보 동의 - 16.11.21 추가
	
	/*var m = $("#MOBILE1").val() +"-"+ $("#MOBILE2").val() +"-"+ $("#MOBILE3").val();
	$("#MOBILE").val(m);*/
	
	if(!confirm("등록 하시겠습니까?")){return;}
	
    $('#btnInsert').css('display', 'none');
	if(document.getElementById("FILE_1").value != ""){
		reqFileUpload();
	}else{
		reqInsert();
	}
}

function reqInsert()
{	
	var params = "event_id=inquiryAction.insertInquiry" ;
	params += "&sql_id=inquiry.getCust,inquiry.insertCust,inquiry.insertCust2,inquiry.insertAcpt,inquiry.insertProcHst";
	new ajax.xhr.ExtRequest('/FrontServlet', params, resProc, 'POST', null, false);
	
}

function resProc(jsonObj){
    try {
        if (jsonObj.userDef == 1) {
            document.getElementById("POP_OK").style.display = "block";
            $('#btnInsert').css('display', 'none');
        } else {

            alert("다시 시도해주세요");
            $('#btnInsert').css('display', '');
        }
    }catch (e) {
        $('#btnInsert').css('display', '');
    }finally {
        $('#ACPT_ID').val('');
    }
}

function getAcptId()
{
	var params = "event_id=inquiryAction.getAcptId" ;
	new ajax.xhr.ExtRequest('/FrontServlet', params, resAcptId, 'POST', null, false);
}

function resAcptId(jsonObj){
	acpt_id = jsonObj.userDef;
	$("#ACPT_ID").val(jsonObj.userDef);
}

//파일업로드
var acpt_id="";
var filePath = "/data/fileUpload/";
function reqFileUpload(){

	getAcptId();
//alert("acpt_id:::"+acpt_id);
	var f = document.mainForm;

	var user_id = "web";
	var subFolder = "data/fileUpload";
	var href = "CallBack";
	f.target = "hdfrm";
	f.method = "post";
	f.encoding = "multipart/form-data";
	f.action = "/FrontServlet?event_id=inquiryAction.fileUpload&sql_id=inquiry.insertAttach&subFolder="+subFolder+"&target_url=/common/upload/FileUploadMsg.jsp&tbSeq="+acpt_id+"&userid="+user_id+"&href="+href;
	f.submit();
}

function resFileUpload(){
	document.mainForm.encoding = "application/x-www-form-urlencoded"; 
	reqInsert();	
}

function storePop()
{
	//window.open("/MC/HOM/storeSearch.jsp","","width=412,height=380, menubar=no, status=no, toolbar=no");
	window.open("/MC/HOM/storeSearch.jsp","","width=660,height=500, menubar=no, status=no, toolbar=no");
}


//////////////////////////////////////////////////////////////////////답변보기///////////////////////////

function search()
{	
	reqList();
}

function reqList(maxListCnt, reqPage){	
	var params = "event_id=DefaultAction.getListAjax";
	params += "&sql_id=answer.getList";
	new ajax.xhr.ExtRequest('/FrontServlet',params, resList, 'POST', null, false);
}
var answerList;
function resList(jsonObj)
{
	answerList=jsonObj;

	if(jsonObj.totCnt > 0)
	{
		/* 첫째줄  tr
		var htmlString = '' ;
		htmlString = '<table class="table_input" align="center" style="width:636px; border-top:2px solid #920000; margin-bottom:10px;">'  ;
		htmlString+=	'<tr>'  ;
		htmlString+=	'<th style="width:50px;">접수번호</th>' ;
		htmlString+=	'<th style="width:68px;">접수일</th>' ;
		htmlString+=	'<th style="width:280px;">제목</th>' ;
		htmlString+=	'<th style="width:100px;">방문매장</th>' ;
		htmlString+=	'<th style="width:70px;">진행상태</th>' ;
		htmlString+=	'<th style="width:68px;">답변일</th>' ;
		htmlString+=	'</tr>'  ;
		
		// 데이터 로우.
		for(i=0 ; i < jsonObj.totCnt ; i++)
		{
			htmlString+=	'<tr>' ;
			htmlString+=	'<td>'+jsonObj.ACPT_ID[i]+'</td>' ;		
			htmlString+=	'<td>'+jsonObj.RECV_DATETIME[i]+'</td>' ;
			htmlString+=	'<td>'+jsonObj.ACPT_TITLE[i]+'</td>' ;
			htmlString+=	'<td>'+jsonObj.STORE_NM[i]+'</td>' ;
			htmlString+=	'<td>'+jsonObj.ACPT_STATUS_NM[i]+'</td>' ;
			htmlString+=	'<td>'+jsonObj.ANSW_DATETIME[i]+'</td>' ;
			htmlString+=	'</tr>' ;
			
			htmlString+=	'<tr>' ;
			htmlString+=	'<td class="fb">질문내용</td>' ;
			htmlString+=	'<td colspan="5" class="subject">'+jsonObj.ACPT_WEB_DESC[i]+'</td>' ;
			htmlString+=	'</tr>' ;
			
			if(jsonObj.IS_PUBLISH_YN[i] == "Y"){
				htmlString+=	'<tr>' ;
				htmlString+=	'<td  class="fb"><span class="f_on">답변내용</span></td>' ;
				htmlString+=	'<td colspan="5" class="subject"><span class="f_on">'+jsonObj.ANSW_DESC[i]+'</span></td>' ;
				htmlString+=	'</tr>' ;
			}
		}
		htmlString+=	'</table>' ;
		
		document.getElementById('LIST_DIV').innerHTML = htmlString ;
		*/
		
		/* 답변보기 화면 퍼블리싱 변경 (2021.03.14) */
		
		var htmlString = '' ;
		htmlString = '<table class="reply-view">'  ;
		htmlString+= '<colgroup>';
		htmlString+= '<col style="width: 144px">';
		htmlString+= '<col style="width: auto">';
		htmlString+= '<col style="width: 144px">';
		htmlString+= '<col style="width: 144px">';
		htmlString+= '<col style="width: 144px">';
		htmlString+= '</colgroup>';
		htmlString+= '<thead><tr>';
		htmlString+= '<th scope="col">접수번호</th>';
		htmlString+= '<th scope="col">제목</th>';
		htmlString+= '<th scope="col">방문매장</th>';
		htmlString+= '<th scope="col">접수일</th>';
		htmlString+= '<th scope="col">상태</th>';
		htmlString+= '</tr></thead>';
		htmlString+= '<tbody>';
		
		// 데이터 로우.
		for(i=0 ; i < jsonObj.totCnt ; i++)
		{
			htmlString+=	'<tr>';
			htmlString+=	'<th scope="row">'+jsonObj.ACPT_ID[i]+'</th>';	
			htmlString+=	'<td>'+jsonObj.ACPT_TITLE[i]+'</td>';
			htmlString+=	'<td>'+jsonObj.STORE_NM[i]+'</td>';
			htmlString+=	'<td>'+jsonObj.RECV_DATETIME[i]+'</td>';
			htmlString+=	'<td>'+jsonObj.ACPT_STATUS_NM[i]+'</td>';
			htmlString+=	'</tr>';
			htmlString+=	'<tr>'
			htmlString+=	'<th scope="row">내용</th>';
			htmlString+=	'<td colspan="4">'+jsonObj.ACPT_WEB_DESC[i]+'</td>' ;
			htmlString+=	'</tr>';
						
			if(jsonObj.IS_PUBLISH_YN[i] == "Y"){
				htmlString+=	'<tr>' ;
				htmlString+=	'<th scope="row" class="color-mcdRed">답변</th>';
				htmlString+=	'<td colspan="4" class="color-mcdRed">'+jsonObj.ANSW_DESC[i]+'</td>' ;
				htmlString+=	'</tr>' ;
			}
		}
		htmlString+=	' </tbody></table>' ;
			
		document.getElementById('LIST_REPLY_DIV').innerHTML = htmlString ;
	}
	else
	{
		alert("조회결과가 없습니다.");
		$('#EMAIL2').focus();
		document.getElementById('LIST_REPLY_DIV').innerHTML = "";
		return;
	}
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
    
    arrStartOrderBy[0] = "ACPT_ID desc";
    arrColSize[0] = "";
    arrMaxListCnt[0] = 10;     
	
    arrColNm[0] =  ",접수번호,질문내용,접수일,제목,방문매장,진행상태,답변일";             
     
    if (arguCnt == 3)
    {
    	value = [a.ACPT_ID[i],a.ANSW_DESC[i],a.RECV_DATETIME[i], a.ACPT_TITLE[i],a.STORE_NM[i], a.ACPT_STATUS_CD[i],a.ANSW_DATETIME[i]];
    }
    else   
    {
        value = getColDetailInfo(arguCnt, type, tbIdx, arrColNm, arrMaxListCnt, arrStartOrderBy, arrColSize);
    }
    
    return value;
}

function LIST_MAKE_ARR(i,viewCols, htmlString, jsonObj, divNm, tbIdx)
{
	var viewSet = getColInfo(tbIdx, jsonObj, i);
	
	for(j=0; j<(viewCols-1); j++)
	{
		if(j==(SELECTED_SORT_IDX[tbIdx]-1)) htmlString += '<td align="center" id="'+divNm+'_sort'+i+'Td'+j+'" style="background-color:'+SORT_TD_OVER_COLOR+'">'+viewSet[j]+'</td>';
        else 	htmlString +='<td align="center">'+viewSet[j]+'</td>';		
	}
	return htmlString;
}


function LIST_ON_CLICK(idx)
{
	 if(document.getElementById("LIST_TR_ID"+idx+"_DT").style.display==""){
		  document.getElementById("LIST_TR_ID"+idx+"_DT").style.display="none";
		 }else{
		  document.getElementById("LIST_TR_ID"+idx+"_DT").style.display=""; 
		 }
}

/**
 * 테이블을 그린다. (중복으로 쓰이는 중간설정부분을 자동설정해서 테이블을 그림  
 */
function assistMakeTablePage2(jsonObj, tbNm, reqSortFnNm, tbIdx, union, appendTrId)
{
  	var colSizeStr = getColInfo(tbIdx, "colSize"); 
 	var colNmStr = getColInfo(tbIdx);
	var viewColCnt = getColInfo(tbIdx, "viewColCnt");			
	var maxListCnt = getColInfo(tbIdx, "maxListCnt"); ;
	var reqPageFnNm = reqSortFnNm ;
	makeTable_div(jsonObj, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt ,reqSortFnNm, jsonObj.totCnt, maxListCnt, reqPageFnNm, appendTrId,"ANSW_DESC");   
   		
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

function extCheck(){
	var extList = new Array("jpg","jpeg","jpe","jfif","gif","tif","tiff","png","zip");
	var len = $("#FILE_1").val().length;
	var len2 = $("#FILE_1").val().lastIndexOf(".")+1;
	var temp="";
	temp = ($("#FILE_1").val().substring(len2,len)).toLowerCase();
	/////////////////
	//var maxSize = 3145728;
	////////////////
	if($.inArray(temp, extList) < 0)
		{
			alert("해당 첨부파일은 올릴 수 없습니다.");
			return false;
		}else{
			return true;
			/*
			   var fielSize = Math.round( $("#FILE_1").val().fileSize);
			   
		        if(fileSize > maxSize)
		         {
		             alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다.    ");
		             return false;
		         }else
		         {
		        	 return true;
		         }*/			
		}
}



