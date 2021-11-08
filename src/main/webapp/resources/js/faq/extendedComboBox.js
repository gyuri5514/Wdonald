/* **************************************************************
 * Illegal use of this software will violate the Copy Right Law
 * **************************************************************
 * Program Name    			:  extendedComboBox.js
 * Function description 	:  확장된 공통 콤보박스 생성.
 * Programmer Name   	:  정주섭
 * Creation Date       			:  2009.7. 9
 * ************************************************************** 
 *                    P R O G R A M H I S T O R Y 
 * ************************************************************** 
 * DATE	:     PRGAMMER	: REASON 
 */

var tempCbDateSet = null;
/**
 * 콤보박스를 요청한다.  (PUBLIC)
* @param sqlId sqlId
* @param reqParam 요청파라미터
* @param spanName span태그 이름
* @param comboName 콤보박스이름
* @param onChange change함수  
* @param width 콤보박스 넓이
* @param className 클래스명
* @param optionValue 옵션기본값 null 일경우 "" 세팅
* @param optionText 옵션기본이름 null 일경우 선택 세팅
*  
*  참조 : <script language="javascript" src="/js/extendedComboBox.js"></script>	
*  호출 예) reqCbAuto("M99S999E614", "20091208", "spComboName", "cbComboName","", "80", "''", "전체");
*
 */
function reqCbAuto(sqlId, reqParam, spanName, comboName, onChange, width, optionValue, optionText, cbClassName, spClassName)
{
     tempCbDateSet = "";
     var params = "event_id=DefaultAction.getListAjax";
     params += "&sql_id="+sqlId  ;
     if(reqParam != "")params += "&"+reqParam ;
    new ajax.xhr.ExtRequest('/FrontServlet', params, resCbAuto, 'POST', null, false);
    setCbAuto(tempCbDateSet,spanName, comboName,onChange, width, cbClassName, optionValue, optionText);
    params=null;
    tempCbDateSet=null;
}

/**
 * 콤보박스를 만든다.  (PUBLIC)
 * @param {Object} cbDateSet 이차원배열   값, TEXT / 없다면 null
 * @param {Object} 그외 파라미터 reqCbAuto 동일
 * 
   호출 예) makeCbAuto(null, "spComboName", "cbComboName","", "80", "''", "전체");  
   또는 
    var arr = new Array();
    arr[0] = new Array("1","가가가")
    arr[1] = new Array("2","나나나")
    makeCbAuto(arr, "spCb", "cbCb","changeList(this.value)", "50", "''", "아하");       
 */
function makeCbAuto(cbDateSet, spanName, comboName, onChange, width, optionValue, optionText, cbClassName, spClassName)
{
    setCbAuto(cbDateSet,spanName, comboName,onChange, width, cbClassName, optionValue, optionText)         
}

/**
 * 콤보박스 통신 (데이터셋을 가져온다. 
 */
/*private*/ function resCbAuto(jsonObj)
{
    var f = document.all;
    var twoArr = getJSONToTwoArr(jsonObj);
    
    if(twoArr != null && twoArr[0] != null)
    {
        tempCbDateSet = twoArr;
    }
}

/**
* 콤보박스를 해당 span에 세팅한다.  
* @param twoArr 데이터셋
* @param comboName 콤보박스이름
* @param spanName span태그 이름
* @param onChange change함수  
* @param width 콤보박스 넓이
* @param className 클래스명
* @optionValue 옵션기본값 null 일경우 "" 세팅
* @optionText 옵션기본이름 null 일경우 선택 세팅
*/
/*private*/  function setCbAuto(twoArr, spanName, comboName, onChange, width, className, optionValue, optionText)
{
    var combo = document.getElementById(comboName);
    var span = document.getElementById(spanName);
    var html = getComboHtml(twoArr,comboName,width, className, onChange, optionValue,optionText);
    //console.log("span.innerHTML");
    span.innerHTML = html;
    twoArr=null;
    combo=null;
    span=null;
    html=null;
    
}




/**
*콤보박스 HTML를 생성하여 옴.
* @param dataSet  데이터셋 0코드 1데이터
* @param name 콤보박스명
* @param width 콤보박스 너비
* @param className CSS클래스명
* @param onChange onChage함수
* @param optionValue 첫번째 옵션값 (default 일경우 "" 선택으로 세팅
* @param optionValue 첫번째 옵션Text
* 
*/
/*private*/ function getComboHtml(dataSet, name, width, className, onChange, optionValue, optionText)
{
    var firstItem ="";
    if(optionValue == "default")
    {
        optionValue = "";
        optionText = "선택";
    }
    
   if (optionValue != null) 
   {
       firstItem = "<option value = '" + optionValue + "' title='" + optionText + "'>" + optionText + "</option>";
   }

    var fnChange = (onChange != null && onChange != "") ? "onChange="+onChange : "" ;

    var str = "<select name='"+name+"' id='"+name+"' style='width:"+width+"' "+fnChange+">";
    str += firstItem;
    
   var dataSetCnt = dataSet != null ? dataSet.length : 0 ;
   for(var i=0 ; i < dataSetCnt ; i++)
   {
     str += "<option value = '"+ dataSet[i][0]+"' title='"+dataSet[i][1]+"'>" + dataSet[i][1] +" </option>";
   }
    str += "</select>";
    //console.log("getComboHtml str : " + str)
    dataSet=null;
    return str;
}    

//session에서 값을 가져와 그리기
function reqCbAuto2_session(jsonObj, spanName, comboName, onChange, width, optionValue, optionText, cbClassName, spClassName, selectData)
{
     tempCbDateSet = "";
     resCbAuto(jsonObj);    
    setCbAuto2(tempCbDateSet,spanName, comboName,onChange, width, cbClassName, optionValue, optionText, selectData);
    params=null;
    tempCbDateSet=null;
    sqlId=null;
    reqParam=null;
    spanName=null;
    comboName=null;
    onChange=null;
    width=null;
    optionValue=null;
    optionText=null;
    cbClassName=null;
    spClassName=null;
    selectData=null;
}

// 아래 부분은 값이 없을경우 selecbox를 찍지 않기위해 사용한다.
function reqCbAuto2(sqlId, reqParam, spanName, comboName, onChange, width, optionValue, optionText, cbClassName, spClassName, selectData)
{
     tempCbDateSet = "";
     var params = "event_id=DefaultAction.getListAjax";
     params += "&sql_id="+sqlId  ;
     if(reqParam != "")params += "&"+reqParam ;
    new ajax.xhr.ExtRequest('/FrontServlet', params, resCbAuto, 'POST', null, false);
    setCbAuto2(tempCbDateSet,spanName, comboName,onChange, width, cbClassName, optionValue, optionText, selectData);
    params=null;
    tempCbDateSet=null;
    sqlId=null;
    reqParam=null;
    spanName=null;
    comboName=null;
    onChange=null;
    width=null;
    optionValue=null;
    optionText=null;
    cbClassName=null;
    spClassName=null;
    selectData=null;
}

function setCbAuto2(twoArr, spanName, comboName, onChange, width, className, optionValue, optionText, selectData)
{
    var combo = document.getElementById(comboName);
    var span = document.getElementById(spanName);
    var html = getComboHtmlNodataEmpty(twoArr,comboName,width, className, onChange, optionValue,optionText, selectData);
    span.innerHTML = html;
    twoArr=null;
    combo=null;
    span=null;
    html=null;
    spanName=null;
    comboName=null;
    onChange=null;
    width=null;
    className=null;
    optionValue=null;
    optionText=null;
    selectData=null;
    
}

function getComboHtmlNodataEmpty(dataSet, name, width, className, onChange, optionValue, optionText, selectData)
{
	

    var firstItem ="";
    if(optionValue == "default")
    {
        optionValue = "";
        optionText = "선택";
    }
    
   if (optionValue != null) 
   {
       firstItem = "<option value = '" + optionValue + "' title='" + optionText + "'>" + optionText + "</option>";
   }

    var fnChange = (onChange != null && onChange != "") ? "onChange="+onChange : "" ;

    var str = "<select name='"+name+"' id='"+name+"' style='"+className+";width:"+width+"' "+fnChange+">";
    str += firstItem;
    
   var dataSetCnt = dataSet != null ? dataSet.length : 0 ;
   var selectFlag="";
   for(var i=0 ; i < dataSetCnt ; i++)
   {
	 if(selectData == dataSet[i][0]){
		 selectFlag="selected"; 
	 }else{
		 selectFlag="";
	 }
     str += "<option value = '"+ dataSet[i][0]+"' title='"+dataSet[i][1]+"' "+selectFlag+">" + dataSet[i][1] +" </option>";
   }
    str += "</select>";
    if(dataSet.length == 0){
    	str="";
    }
    dataSet=null;
    name=null;
    width=null;
    className=null;
    onChange=null;
    optionValue=null;
    optionText=null;
    selectData=null;
    return str;
}    

