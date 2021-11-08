/************************ 문자열 함수 ************************/

/**
 * 해당문자열을 해당길이까지만큼만 가져온다.
 * @param {Number} len  보여주고자 하는 자리갯수
 * @return {String}  해당길이를 리턴한다.
 * 
 * ex)  alert("1234".cut(2) );        결과 12
 */
String.prototype.cut = function(len) 
{
 var str = this;
 var l = 0;
 for (var i=0; i<str.length; i++) {
  l += (str.charCodeAt(i) > 128) ? 2 : 1;
  if (l > len) return str.substring(0,i);
 }
 return str;
}


/**
 * 문자열 앞과 뒤의 공백을 지운다. 
 * @return {String} 공백을 제거한 문자열 
 * 
  * ex)  alert("가가"+("  1234  ".trim()  + "나나"  )  );      결과 가가1234나나
 */
String.prototype.trim = function()
{
 return this.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * String 총 바이트수를 구한다.
 * @return {Number} 바이트수 (한글 2byte 영문 1byte)
 * 
 * ex) alert(  "가나다1234".getBytes()  );     결과 10
 */
String.prototype.getBytes = function() 
{
    var str = this;
    var l = 0;
    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 127) ? 2 : 1;
    return l;
}
    
/**
 * 문자열을 특정문자를 사용자 정의문자로 치환한다.
 * @param {String} str1  원본 문자
 * @param {String} str2  바꾸려는 문자 
 * @classDescription String.trim()에 의존적이다.
 * 
 * ex) alert(  "foxfox".replaceAll("f","b")  );     결과 boxbox
 */
String.prototype.replaceAll = function(str1, str2)     
{
    var temp_str = "";
    if (this.trim() != "" && str1 != str2) {
        temp_str = this.trim();
        while (temp_str.indexOf(str1) > -1){
            temp_str = temp_str.replace(str1, str2);
        }
    }
    return temp_str;
}
    

/**
 * 문자열에서 특정문자를 제거한 새로운 문자열을 만든다.
 * @param {String} str 원본 문자열
 * @param {String} ch 제거해야할 문자
 * @return {String}원본문자열에서 제거된 문자열
 *  ex) alert(  delChar('12XX4','X')  );  결과값 124
 *  
 */
function delChar(str, ch)
{
	 var len = str.length;
	 var ret = "";
	 for (i=0; i<len; ++i)
	 {
	  if (str.substring(i,i+1) != ch)
	   ret = ret + str.substring(i,i+1);
	 }
 
 return ret;
}


/**
 * 문자열에서 왼쪽의 공백을 제거한다.
 * @param {String} str 공백이 있는 원본문자열
 * @return {String} 왼쪽공백이 제거된 문자열
 *  ex) alert(  lTrim('    123')  );  결과값 123
 */
function lTrim(str)
{
  var i;
  i = 0;
  while (str.substring(i,i+1) == ' ' || str.substring(i,i+1) == '　')  i = i + 1;
  return str.substring(i);
}


/**
 *  문자열에서 오른쪽의 공백을 제거한다.
 * @param {String} str 오른쪽 공백이 있는 문자열
 * @return {String} 오른쪽 공백이 제거된 문자열 
 *  ex) alert(  rTrim('123   ')  );  결과값 123
 */
function rTrim(str)
{
  var i = str.length - 1;
  while (i >= 0 && (str.substring(i,i+1) == ' ' || str.substring(i,i+1) == '　')) i = i - 1;
  return str.substring(0,i+1);
}


/**
 * 문자열에서 양쪽의 공백을 제거한다.
 * @param {String} str  공백이 있는 문자
 * @return {String} 공백이 제거된 문자열
 * @classDescription lTrim, rTrim 함수에 의존적이다.
 *     ex) alert(  trim('    123     ')  );  결과값 123
 */
function trim(str){
    if( str == "" || str.length ==0 ) 
    {
      return str; 
    } 
    else
    {
      return(lTrim(rTrim(str)));
    }   
}


/**
 * 문자열을 정해진 길이만큼 왼쪽을 특정 문자로 채운다.
 * @param {String} str
 * @param {String} ch
 * @param {Number} len
 * @return {String} trim 함수에 의존적이다.
 * 
 *  ex)  alert(  lPad('123','$',4)  );  결과값 $123
 */
function lPad(str, ch, len)
{
    alert("원본문자열 : " +str + " , 넣을문자"+ ch + " , 총길이: " + len + " ");
 var strlen = trim(str).length;
 var ret = "";
 var alen = len - strlen;
 var astr = ""; 
 
 //부족한 숫자만큼  len 크기로 ch 문자로 채우기
 for (i=0; i<alen; ++i)
 {
  astr = astr + ch;
 }
 
 ret = astr + trim(str); //앞에서 채우기
 return ret;
}


/**
 * 문자열을 정해진 길이만큼 오른쪽을 특정 문자로 채운다. 
 * @param {String} str 원본문자열
 * @param {String} ch 
 * @param {Number} len  총길이
 * @return {String} 채워진 문자열
 * @classDescription trim 함수에 의존적이다.
 * 
 * ex)  alert(  rPad('123','$',4)  );  결과값 123$
 */
function rPad(str, ch, len)
{
 var strlen = trim(str).length;
 var ret = "";
 var alen = len - strlen;
 var astr = ""; 
 
 //부족한 숫자만큼  len 크기로 ch 문자로 채우기
 for (i=0; i<alen; ++i)
 {
  astr = astr + ch;
 }
 
 ret = trim(str) + astr; //뒤에서 채우기
 return ret;
}


/**
 * 숫자를 세자리마다 컴마를 찍은 형식으로 바꾸어 준다.
 * @param {String|Number}  콤마가없는 숫자
 * @return {String}  콤마가 있는 문자열
 * @classDescription trim, isEmpty 함수에 의존적이다.
 * 
 * ex)  alert(  addComma('1234567')  );  결과값 1,234,567
 */
    function addComma(cur)
    {
		if(cur == null || cur == "") return cur;

		var setMinus = "";
        if (cur.charAt(0) == "-") 
		{
            setMinus = "-";
        }

        cur=cur.replace(/[^.0-9]/g ,"");
        cur=cur.replace(/[.]+/g ,".");


    leftString = cur;
    rightString = ".";
    dotIndex = 0;
      
    for(i = 0; i < cur.length; i++){
    	// 1) '.'이 처음에 입력 되었을때 앞에 0을 더해 "0."을 리턴
		// 2) "0."이외의 입력 일 때 "0"만 리턴
    	if(cur.charAt(i) == "." || (cur.length > 1 && cur.charAt(0) == "0" && cur.charAt(1) != "."))
		{
    		dotIndex = i;
    		if(dotIndex == 0)
			{
                if   (cur.charAt(0) == ".")   leftString="0.";
                else                          leftString="";
    			return leftString;
    		}
    		break;
    	}
    }
    
     if(dotIndex != 0)	//dot가 있을 경우..
    {
    	leftString = cur.substr(0, dotIndex);
    	rightString = cur.substr(dotIndex+1);
    	rightString = rightString.replace(/\./g,"");
    }
    else //없으면..
    {
    	leftString = cur;
    }

    len=leftString.length-3;
    while(len>0) 
    {
        leftString=leftString.substr(0,len)+","+leftString.substr(len);
        len-=3;
    }           
    
    if(rightString != ".")
        return setMinus + (leftString + "." + rightString); 
    else
        return setMinus + leftString;

   }
    
  
/**
 * 콤마가 있는 문자열(숫자)의 콤마를 제거한다.
 * @param {String}  Cost 콤마가있는 문자열(숫자)
 * @return {String}  콤마가 없는 문자열
 * 
 * ex)  alert(  delComma('1,234,567')  );  결과값 1234567
 */   
   function delComma (Cost) 
  {
    var retValue = "";

 // Cost변수에서 콤마 문자가 있을경우 콤마문자를 제거함
    for (i = 0; i < Cost.length; i++) {

     if (Cost.charAt (Cost.length - i -1) != ",") {
      retValue = Cost.charAt (Cost.length - i -1) + retValue;
     }
    }

    return retValue;
 }    

/**
 * 입력값의 앞에 정해진 자리수만큼 0을 채운다.  
 * @param {String} 원본문자열
 * @param {Number} 0의 총갯수
 * @return {String} 0이붙여진 문자열     
 * 
 *  ex) alert(  zeroFill("123",5)   )   결과 00123
 */    
function zeroFill(sVal, iSize) 
{
    while(sVal.length < iSize)  
    {
		sVal = "0" + sVal;
    }
	return sVal;
}

/**
* 숫자만 가져온다.
* @param {String} 원본문자열
* @return {String} 숫자만 가져옴 
* 
* ex) alert(  getNumOnly("가12나")  );        결과 12
*/
function getNumOnly(str)
{
    if(str==null || str=="") return str;
    str = str+"";
    var strCnt = str.length;
    var value="";
    for(var i=0; i< strCnt; i++)
    {
        var ch = str.charAt(i);
        if(ch>='0' && ch<='9')
        {
            value += ch;
        }
    }
    return value;
}
/**
* 숫자만 가져온다. 
* getNumOnly와 같고, getNumOnly와 getOnlyNum과 착각하는 수가 생겨 방지하기위해 
* 명명만 수정
* @param {String} 원본문자열
* @return {String} 숫자만 가져옴 
* 
* ex) alert(  getOnlyNum("가12나")  );        결과 12
*/
function getOnlyNum(str)
{
    return getNumOnly(str);
}

/**
* 주민번호 앞자리 또는 뒷자리만 가져온다.
* @param {String} 주민번호 13자리
* @param {Number} 가져오려는 타입 1 주민번호 앞자리, 2 뒷자리, 3 주민번호 뒷자리를 *로 채움
* @return {String} 타입에 해당하는 주민번호
* ex) alert(  getJuminNo("780102-1367832", 1)  );   또는 7801021367832        결과  780102
* ex) alert(  getJuminNo("780102-1367832", 2)  );   또는 7801021367832        결과  1367832
* ex) alert(  getJuminNo("780102-1367832", 3)  );   또는 7801021367832        결과  780102 - ******* 
*/
function getJuminNo(juminNo, type)
{
    if(juminNo==null)return "";

    juminNo = juminNo.replace("-","");
	type = type + "";
    try
    {
        if(juminNo!="")
        {
			if(type == "1")
			{
				juminNo = juminNo.substring(0,6);
			}
			else if(type == "2")
			{
				if(juminNo.length < 13) return juminNo;
				juminNo =juminNo.substring(6,13);				
			}
			else if(type == "3")
			{
				juminNo = juminNo.substring(0,6) +" "+ "- ********";
			}
        }
    }
    catch (e)
    {
        juminNo = ""
    }
    return juminNo;
}


/**
* 주민번호 앞자리를 가져온다.
* @param {String} 주민번호 13자리
* @return {String} 주민번호 앞 6자리 
* @deprecated
* ex) alert(  getJumin1("780102-1367832")  );    또는 7801021367832    결과  780102
*/
function getJumin1(juminNo)
{
    if(juminNo==null)return "";
    juminNo = juminNo.replace("-","");
    var jumin1 = "";
    try
    {
        if(juminNo!="")
        {
            jumin1 = juminNo.substring(0,6);
        }
    }
    catch (e)
    {
        jumin1 = ""
    }
    return jumin1;
}

/**
* 주민번호 뒷자리를 가져온다.
* @param {String} 주민번호 13자리
* @return {String} 주민번호 뒤 7자리
* @deprecated 
*  ex) alert(  getJumin2("780102-1367832")  );   또는 7801021367832    결과  1367832
*/

function getJumin2(juminNo)
{
    if(juminNo==null)return "";
    else if(juminNo.length < 13) return "";
        
    juminNo = juminNo.replace("-","");    
    var jumin2 = "";
    try
    {
        if(juminNo!="")
        {
            jumin2 = juminNo.substring(6,13);
        }
    }
    catch (e)
    {
        jumin2 = ""
    }
    return jumin2;
}
    
/**
 * 숫자만 있는 전화번호에 -을 채워 반환하는 함수
 * @param telno 전화번호
 * @return 구분자 있는 전화번호
 * @classDescription getNumOnly()함수에 약하게 의존함..
 * 
 * ex) alert(  getTelnoHipen("0117832848")  );    결과 011-783-2848
 */
	function getTelnoHipen(telno) 
    {
		var TelNo = "";
		var DDD = "";
		telno = getNumOnly(telno);
		var telLen = telno.length;
		
		// 성립안됨
		if (telLen < 9 || telLen > 11) {
			return telno;
		}
		
		var headStr = telno.substring(0,3);
		var    headInt = 0;
		try {
			headInt = parseInt(headStr,10);
		} catch(e) 
		{
			return telno;
		}
		
		try
		{
           if (headStr == "070" || headStr == "080" ) 
           {
                if(telLen == 10){
                    DDD = telno.substring(0,3);
                    TelNo =  telno.substring(3,6) + "-" + telno.substring(6,10);
                }else{
                    DDD = telno.substring(0,3);
                    TelNo = telno.substring(3,7) + "-" + telno.substring(7,11);
                }
    			newTel = (DDD + "-" + TelNo);
                return newTel;
            }
            

			if( headInt >= 10 && headInt < 20 ){
			    //핸드폰
			    if (headStr == "013" ) {
					if(telLen == 11){
					    DDD = telno.substring(0,4);
					    TelNo =  telno.substring(4,7) + "-" + telno.substring(7,11);
					} else {
					    DDD = telno.substring(0,4);
					    TelNo = telno.substring(4,8) + "-" + telno.substring(8,12);
					}
				}else{
					if(telLen == 10){
					    DDD = telno.substring(0,3);
					    TelNo =  telno.substring(3,6) + "-" + telno.substring(6,10);
					}else{
					    DDD = telno.substring(0,3);
					    TelNo = telno.substring(3,7) + "-" + telno.substring(7,11);
					}
			    }
			}else if(headInt >= 20 && headInt < 30 ){
			    //서울
			    if(telLen == 9){
			    	DDD = telno.substring(0,2);
					TelNo = telno.substring(2,5) + "-" + telno.substring(5,9);
				}else{
					DDD = telno.substring(0,2);
					TelNo = telno.substring(2,6) + "-" + telno.substring(6,10);
			    }
			}else if(headInt == 30){
			    //서울
			    if(telLen == 12){
					DDD = telno.substring(0,4);
					TelNo = telno.substring(4,8) + "-" + telno.substring(8,12);
				    }else {
					DDD = telno.substring(0,4);
					TelNo = telno.substring(4,7) + "-" + telno.substring(7,11);
			    }
			}else if(headInt > 30 && headInt < 50 ){
			    //지방
			    if(telLen == 10){
					DDD = telno.substring(0,3);
					TelNo = telno.substring(3,6) + "-" + telno.substring(6,10);
			    }else{
			    	DDD = telno.substring(0,3);
			    	TelNo = telno.substring(3,7) + "-" + telno.substring(7,11);
			    }
			}else if(headInt == 50){
			    //서울
			    if(telLen == 12){
					DDD = telno.substring(0,4);
					TelNo = telno.substring(4,8) + "-" + telno.substring(8,12);
			    }else {
					DDD = telno.substring(0,4);
					TelNo = telno.substring(4,7) + "-" + telno.substring(7,11);
			    }
			}else if(headInt > 50 && headInt < 70 ){
			    //지방
			    if(telLen == 10){
					DDD = telno.substring(0,3);
					TelNo = telno.substring(3,6) + "-" + telno.substring(6,10);
			    }else{
					DDD = telno.substring(0,3);
					TelNo = telno.substring(3,7) + "-" + telno.substring(7,11);
			    }
			}else if(headInt == 70 ){
				// VOIP
				DDD = telno.substring(0,3);
				TelNo = telno.substring(3,7) + "-" + telno.substring(7,11);
			}else{
			    //외국
			    System.out.prvarln("외국 " + telno);
			    TelNo = telno;
			}
		}catch(e)
		{
			DDD = "";
			TelNo = "";
		}
		
		var newTel = "";
		if(DDD =="" && TelNo == "")
		{
			newTel = telno;
		}
		else
		{
			newTel = (DDD + "-" + TelNo);
		}
		return  newTel;
	}


/**
 * 자동으로 전화번호에 하이픈을 넣어준다.
 * 
 * @param {Input Control} telObj   input컨트롤을 자체  <input type="text .... >
 * @return  자동으로 하이픈 세팅하여 줌.
 * @classDescription  String.getBytes(), removeDash() 에 의존적이다.
 *
 * ex)
 *  <input type="text" onkeyup="autoTelnoHipen(this)" maxlength="14"/>
 */
function autoTelnoHipen(telObj)
{
 var oForm = telObj.form ;
 var sMsg = telObj.value ;
 var onlynum = "" ; var i = 0 ;
 if( isNumHipen(sMsg) == false) return telObj.value = telObj.value .substring(0,telObj.value.length-1) ;
 onlynum = removeHipen(sMsg);
 if(event.keyCode != 8 ) {
  if (onlynum.substring(0,2) == "02") 
  {
   if (onlynum.getBytes() <= 1) telObj.value = onlynum ;
   if (onlynum.getBytes() == 2) telObj.value = onlynum + "-" ;
   if (onlynum.getBytes() == 3)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,3);
   if (onlynum.getBytes() == 4)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,4);
   if (onlynum.getBytes() == 5)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" ;
   if (onlynum.getBytes() == 6)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,6) ;
   if (onlynum.getBytes() == 7)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,7) ;
   if (onlynum.getBytes() == 8)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,8) ;
   if (onlynum.getBytes() == 9)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,9) ;
   if (onlynum.getBytes() == 10)  telObj.value  = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ;
  }
  else 
  {
   if (onlynum.getBytes() <= 2) telObj.value = onlynum ;
   if (onlynum.getBytes() == 3)  telObj.value  = onlynum + "-";
   if (onlynum.getBytes() == 4)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,4);
   if (onlynum.getBytes() == 5)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ;
   if (onlynum.getBytes() == 6)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" ;
   if (onlynum.getBytes() == 7)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,7) ;
   if (onlynum.getBytes() == 8)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,8) ; 
   if (onlynum.getBytes() == 9)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,9) ;
   if (onlynum.getBytes() == 10)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ;   if (onlynum.getBytes() == 11)  telObj.value  = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ;
  }
 }
}

/**
 * 하이픈을 제거한다. 
 * @param {String} 하이픈을 제거할 문자
 * @return  {String} 하이픈이 제거된 문자.
 *
  * ex) alert(  removeHipen("011-783-2848")  );    결과 0117832848
 */
function removeHipen(sNo) 
{
 var reNo = ""
 for(var i=0; i<sNo.length; i++) {
  if ( sNo.charAt(i) != "-" ) {
   reNo += sNo.charAt(i)
  }
 }
 return reNo
}

/**
 * 자동으로 세자리마다 콤마를 넣는다.
 * @param {Input Control} obj   input컨트롤을 자체  <input type="text .... >
 * @return  자동으로 세자리마다 , 세팅하여 줌.
 * @classDescription  addComma(), getNumOnly() 에 의존적이다.
 *
 * ex)
 *  <input type="text" onkeyup="autoComma(this)" />
 */
function autoComma(obj)
{
	obj.value = addComma(obj.value);
}

/**
 *  주민번호에서 AUTO로 '-'인 붙는다..
 * @param {Input Control} 주민번호 input컨트롤을 자체  <input type="text .... >
 * @return  자동으로 주민번호 6자리후에 -을 붙힌다.
 * 
 *  ex)  <input type="text" onkeyup="autoJuminHipen(this)" /> 결과값 111111-2222222
 */

function autoJuminHipen(juminObj)
{
 var oForm = juminObj.form;
 var sMsg = juminObj.value;
 var onlyNum = "";
 var i = 0;
 if( isNumHipen(sMsg) == false) return juminObj.value = juminObj.value .substring(0,juminObj.value.length-1) ;
 onlyNum = removeHipen(sMsg);
 
 if(onlyNum.length >13)
 {
  onlyNum = onlyNum.substring(0,13);
 }

 if(event.keyCode != 8) { 
  if(onlyNum.getBytes() >= 6) juminObj.value = onlyNum.substring(0,6) + "-" + onlyNum.substring(6, onlyNum.length);
  if(onlyNum.getBytes() == 13) juminObj.value = onlyNum.substring(0,6) + "-" +onlyNum.substring(6, 13);
 }
}



/**
 * 들어온수 가 10보다 작다면 0을 붙혀서 리턴힌다.     
 * @param {String} 숫자인 원본문자열
 * 
 * ex) addZero('9')   결과 '09'
 */
function addZero(num)
{
    var str="";
	try
	{
		var num = parseInt(num,10);
		if(num<10)
		{
			str = "0"+num;
		}
		else
		{
			str = num+"";            
		}
	}catch(e){str=""}
    return str;
}
    

/************************ 체크 함수 ************************/

/**
 *  문자열이 빈문자열 혹은 공백만 있는 문자열인지 검사한다.
 * @param {String} str 원본문자열
 * @return {boolean} '' 이라면 true , 문자가 있으면 false 
 * @classDescription trim함수 의존적임.
 * 
 * ex)  alert(  isEmpty("")  );    결과 true
 */

function isEmpty(str)
{
 if (trim(str) == '') return true;
 return false;
}

/**
 * 필수적으로 입력되어야 하는 입력란이 비어있지거나 공백 밖에 있지 않은지 검사하고, 
 * 비어있을 경우 alert창을 띄어준다.
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isEmpty(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isEmptyAlert('시작일',this);" >
 */
function isEmptyAlert(fieldCalledName, field, type)
{
    if(isEmpty(field.value))
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 필수적으로 입력되어야 하는 값이므로 비워두면 안 됩니다" : fieldCalledName;
        showMsgAndFocus(msg, field);
         return true;
    }
    return false;
}

/**
 * 숫자를 체크하는 하는 함수
 * @param {String} input 원본문자열
 * @return boolean true 숫자있음 false 숫자없음
 * @classDescription containsCharsOnly() 의존적임
 * 
 * ex) alert( isName("23e") );   결과 false
 */
function isNum(input) 
{
    var chars = "0123456789";
    return containsCharsOnly(input,chars);
}

/**
 * 숫자를 체크하는 하고 메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isNum(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isNumAlert('시작일',this);" >
 */
function isNumAlert(fieldCalledName, field, type)
{
    if(isNum(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 숫자만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
}

function isNumAlert2(fieldCalledName, field, type)
{
    if(isNum(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 숫자만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus2(msg, field);
         return false;
    }
    return true;
}


/**
 * 문자를 체크하는 함수. 한글과 알파벳만 가능
 * @param {String} input 원본문자열
 * @return boolean true 특수문자 및 숫자없음 false 특수문자및 숫자 있음
 * @classDescription containsChars() 의존적임
 * 
 *  ex) alert( isName("가가?") );   결과 false     
 */
 function isName(input)
 {
      var chars = '0123456789~!#$%^&*()_-+=|{}[]<>,./?@';
      return containsChars(input,chars);
 }


/**
 * 문자를 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isName(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isNameAlert('이름',this);" >
 */
function isNameAlert(fieldCalledName, field, type)
{
    if(isName(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 특수문자 숫자를 제외한 문자만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
}

/**
 * 전화번호인지 체크를 함.
 * @param {String} input 전화번호
 * @return true 전화번호  false 전화번호가 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isPhoneNum("가가") );   결과 false     
 */
function isPhoneNum(input) 
{ 
    var chars = "0123456789( ).-,<>{}[]_~";
    return containsCharsOnly(input,chars);
}

/**
 * 전화번호를 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isPhoneNum(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isPhoneNumAlert('전화번호',this);" >
 */
function isPhoneNumAlert(fieldCalledName, field, type)
{
    if(isPhoneNum(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 숫자 하이픈(-)만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
}

/**
 * 알파벳인지 체크를 함.
 * @param {String} input 원본문자열
 * @return true 알파벳  false 알파벳이 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isAlphabet("가가") );   결과 false     
 */
function isAlphabet(input) 
{ 
 var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return containsCharsOnly(input,chars);
}

/**
 * 알파벳을 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isAlphabet(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isAlphabetAlert('영문이름',this);" >
 */
function isAlphabetAlert(fieldCalledName, field, type)
{
    if(isAlphabet(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 영문만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
}

/**
 * 영문숫자인지 체크를 함.
 * @param {String} input 원본문자열
 * @return true 영문,숫자  false 영문숫자 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isAlphabetNum("가가") );   결과 false     
 */
function isAlphabetNum(input) 
{ 
     var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return containsCharsOnly(input,chars);
}
    
/**
 * 알파벳,숫자를 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isAlphabetNum(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isAlphabetNumAlert('영문숫자',this);" >
 */
function isAlphabetNumAlert(fieldCalledName, field, type)
{
    if(isAlphabetNum(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 영문,숫자만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
}

/**
 * 입력값이 숫자,하이픈(-)로 되어있는지 체크
 * @param {Object} input 원본 문자열
 * @return true 숫자,하이픈임  false 숫자,하이픈 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isNumHipen("가가") );   결과 false     
 */
 function isNumHipen(input) {
     var chars = "-0123456789";
     return containsCharsOnly(input,chars);
 }
 
/**
 * 입력값이 숫자,하이픈(-)로 되어있는지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isAlphabet(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isNumHipenAlert('숫자하이픈',this);" >
 */
function isNumHipenAlert(fieldCalledName, field, type)
{
    if(isNumHipen(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 영문,하이픈만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 
 
/**
 * 입력값이 숫자,콤마(,)로 되어있는지 체크
 * @param {Object} input 원본 문자열
 * @return true 숫자,콤마  false 숫자,콤마 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isNumComma("가가") );   결과 false     
 */
 function isNumComma(input) 
 {
     var chars = ",0123456789";
     return containsCharsOnly(input,chars);;
 }
 
  /**
 * 입력값이 숫자,콤마(,)로 되어있는지 체크 되어있는지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isNumCommaAlert(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isNumComma('숫자콤마',this);" >
 */
function isNumCommaAlert(fieldCalledName, field, type)
{
    if(isNumComma(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 숫자 콤마만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 
 
 /**
  * 입력값이 숫자,소수점(.)로 되어있는지 체크
 * @param {Object} input 원본 문자열
 * @return true 숫자,하이픈,콤마  false 숫자,하이픈,콤마 아님
 * @classDescription containsCharsOnly() 의존함
 * 
 * ex) alert( isNumPoint("가가") );   결과 false     
 */
 function isNumPoint(input) 
 {
     var chars = "-.0123456789";
     return containsCharsOnly(input,chars);
 }
 
 /**
 * 입력값이 숫자,도트(.),마이너스로 되어있는지 체크 되어있는지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isNumCommaAlert(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isNumPoint('숫자콤마하이픈',this);" >
 */
function isNumPointAlert(fieldCalledName, field, type)
{
    if(isNumPoint(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 숫자, 점, 마이너스만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 
 
 /**
  * 한글인지 체크
  * @param {String} input 
  * @return boolean true 한글임 false 한글이 아님
  * 
  *  ex) alert( isHangul("11") );   결과 false     
  */
function isHangul(input)
{
  var sBit = '';

  for(i=0;i<input.length;i++)
  {
    sBit = input.charAt(i);
    if(escape( sBit ).length <= 4)
    {
      return false;
    }
  }
  return true;
}



 /**
 * 한글인지 체크 되어있는지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isHangul(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isHangulAlert('한글',this);" >
 */
function isHangulAlert(fieldCalledName, field, type)
{
    if(isHangul(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 한글만 입력이 가능합니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 

/**
 * 적합한 주민번호인지 체크한다.
 * @param {String} ssn  내국인 주민번호
 * @return true 올바른 주민번호 false 올바른 주민번호가 아님
 * 
 *  ex) alert( isJuminNo("8123412-134218") );   결과 false     
 */
function isJuminNo(ssn)
{
    ssn = getNumOnly(ssn);
	var digit=0
    for (var i=0 ; i<ssn.length ; i++){
        var str_dig=ssn.substring(i,i+1);
        if (str_dig<'0' || str_dig>'9'){ 
            digit=digit+1 
        }
    }
    if(digit>0)
    {
        return false;
    }
    var year   = parseInt(ssn.substring(0,2));
    var month  = parseInt(ssn.substring(3,4));
    var day    = parseInt(ssn.substring(5,6));
    var gender = parseInt(ssn.substring(7,7));
    var local  = parseInt(ssn.substring(8,11));
    var key    = parseInt(ssn.substring(12));
        
    if( (month<0) || (month>12) )
    {
        return false;
    }
        
    if( (month==1) || (month==3) || (month==5) || (month==7) || (month==8) || (month==10) || (month==12) )
    {
        if( (day<0) || (day>31) )
        {
            return false;
        }
    }

    if( (month==4) || (month==6) || (month==9) || (month==10) )
    {
        if( (day<0) || (day>30) )
        {
            return false;
        }
    }
        
    if(month==2)
    {
        if( (year==0) && ( (gender==1) || (gender==2) ) )
        {
            if( (day<0) || (day>28) )
            {
                return false;
            }
        }
        else if( (year==0) && ( (gender==3) || (gender==4) ) )
        {
            if( (day<0) || (day>29) )
            {
                return false;
            }
        }
        else if(year%4==0)
        {
            if( (day<0) || (day>29) )
            {
                return false;
            }               
        }
        else
        {
            if( (day<0) || (day>28) )
            {
                return false;
            }
        }
    }

    if( (gender<0) || (gender>4) )
    {
        return false;
    }

    cBit = 0;
    sCode="234567892345";

    for(i=0;i<12;i++)
    {
        cBit = cBit+parseInt(ssn.substring(i,i+1))*parseInt(sCode.substring(i,i+1));
    }

    cBit=11-(cBit%11);
    cBit=cBit%10;

    if(key!=cBit)
    {
		return false;
    }
    else
    {
        return true;
    }
} 

 /**
 * 올바른 주민번호인지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isJuminNo(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isJuminNoAlert('주민번호',this);" >
 */
function isJuminNoAlert(fieldCalledName, field, type)
{
    if(isJuminNo(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 올바른 주민번호가 아닙니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 

/**
 * 적합한 이메일주소인지 체크한다.
 * @param {String} strText  이메일주소
 * @return true 올바른 이메일주소 false 올바른 이메일주소가 아님
 * 
 * ex) alert( isEmail("8123412") );   결과 false    
 */
 function isEmail(strText)
{
    if(strText == "") return true;
    
    
     if (strText.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+.[a-zA-Z.]+$/))
     {
      return true;
     }
     else
     {
      return false;
     }
}

 /**
 * 올바른 이메일 주소인지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isJuminNo(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isEmail('이메일주소',this);" >
 */
function isEmailAlert(fieldCalledName, field, type)
{
    if(isEmail(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"은(는) 올바른 주소가 아닙니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 

/**
 * 전화번호 형식을 체크하는 함수
 * @param {String} 전화번호 문자열
 * @return boolean  true  전화번호형식임 false 전화번호형식이 아님
 * @classDescription getNumOnly(), getTelnoHipen() 의존적임.
 * 
 *  ex) alert(isTelNo("032-12-38")        결과 false
 */
function isTelNo(objValue)
{  
    if(objValue == '') return true;
    
    objValue = getNumOnly(objValue);
    objValue = getTelnoHipen(objValue);
    var text = objValue.split('-');  
    var arrNo = new Array('02'    //서울 02
          ,'031'   //경기 031
          ,'032'   //인천 032  
          ,'033'  //강원 033
          ,'041'   //충남 041 
          ,'042'  //대전 042 
          ,'043'  //충북 043 
          ,'051'  //부산 051
          ,'052'  //울산 052 
          ,'053'  //대구 053 
          ,'054'  //경북 054 
          ,'055'   //경남 055  
          ,'061'  //전남 061 
          ,'062'  //광주 062  
          ,'063'  //전북 063  
          ,'064'  //제주 064 
          ,'010'  //핸펀
          ,'011'
          ,'016'
          ,'017'
          ,'018'
          ,'019'
          ,'1588'
          ,'070'
          );
          
    var newLen = objValue.length; 
    var flag = false;
     if(newLen  < 11 ||
       newLen  > 13 ||
       text.length != 3 || 
       text[1].length < 3 ||
       text[2].length != 4)   
     {
      //alert('전화번호의 형식이 맞지 않습니다. 다시 입력하세요.');
      return false;
     }     
     for(var i=0; i<arrNo.length; i++ )  {
      if(text[0] == arrNo[i]) {
       flag = true;
       break;
      }
     }
     if(!flag){
      //alert('전화번호의 형식이 맞지 않습니다. 다시 입력하세요.');
      return false;
     }
     return true;
}


 /**
 * 올바른 전화번호인지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isTelNo(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isTelNoAlert('전화번호',this);" >
 */
function isTelNoAlert(fieldCalledName, field, type)
{
    if(isTelNo(field.value) == false)
    {
	 	var msg = type == null ? fieldCalledName+"가 올바른 형식이  아닙니다." : fieldCalledName;
        showMsgAndFocus(msg, field);
         return false;
    }
    return true;
} 

/**
 * 값이 최종적으로 적합한 범위내의 숫자가 들어왔는지 검사한다.
 * @param {String} value   문자열값
 * @param {Number} min    최소범위
 * @param {Number} max   최대범위
 * @return boolean true 범위내에 있음 false 범위를 벗어남
 * 
 * ex) alert(isTelNo("200",0,100)        결과 false
 */
function isRange(value, min, max)
{
	 if(isNum(value) == false) 
	 {
		 return false;
	 }
	 
	 var fieldNumber=parseInt(value, 10);
	 if ( !(fieldNumber>=min && fieldNumber<=max) )
	 {
		 return false;
	 }
		return true;
}

 /**
 * 값이 최종적으로 적합한 범위내의 숫자가 들어왔는지 체크하고  메세지를 출력하는 함수
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} min    최소범위
 * @param {Number} max   최대범위
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isTelNo(), showMsgAndFocus() 의존함
 * 
 * ex) <input type='text'  onBlur="javascript:isRangeAlert('범위',this,0,100);" >
 */
function isRangeAlert(fieldCalledName,field,min,max,type)
{

	// 1. 숫자인지 체크
	 if(isNumAlert(fieldCalledName,field) == false) 
	 {
		 return false;
	 }

	 //2. 범위 체크
    if(isRange(field.value) == false)
   {
	var msg = type == null ? fieldCalledName+"의 값이" + parseInt(field.value,10)+ "로 [" + min + " ~ " + max + "] 사이의 범위를 벗어나 있습니다." : fieldCalledName;
	showMsgAndFocus(msg, field);
	 return false;
	}
    return true;
}



/**
 * 메세지를 보여주고 포커스를 준다.
 * @private
 * @param {String} msg  메세지
 * @param {Input Control} field  INPUT상자  
 */
function showMsgAndFocus(msg, field)
{
	 alert(msg);
	 field.focus();
     field.select();    
}
function showMsgAndFocus2(msg, field)
{
	 alert(msg);
	 field.value="";
	 field.focus();
     field.select();    
}

/**
 * 문자열에 문자가 있는지 체크함.
 * @private
 * @param {Object} input
 * @param {Object} chars
 * @return true 문자가 있음 false 없음.
 */
function containsCharsOnly(input,chars) 
{
    if (typeof(input) == "string") 
    {
        for (var inx = 0; inx < input.length; inx++) 
        {
            if (chars.indexOf(input.charAt(inx)) == -1) 
                return false;
        }            
    }
    else
    {
        for (var inx = 0; inx < input.value.length; inx++) 
        {
            if (chars.indexOf(input.value.charAt(inx)) == -1) 
                return false;
        }
    }
    return true;
}

/**
 *  문자열에 문자가 없는지 체크함.
 * @private 
 * @param {Object} input
 * @param {Object} chars
 * @return true 해당문자 없음 false 있음.
 */
 function containsChars(input,chars) 
 {
    if (typeof(input) == "string") 
    {
        for (var inx = 0; inx < input.length; inx++) 
        {
            if (chars.indexOf(input.charAt(inx)) != -1) 
                return false;
        }
    }
    else 
    {
        for (var inx = 0; inx < input.value.length; inx++) 
        {
            if (chars.indexOf(input.value.charAt(inx)) != -1) 
                return false;
        }
    }
     return true;
 }

/**
 * 문자열이 해당열을 넘었는지 체크한다.
 * @param {String} str   원본문자열
 * @param {Number} maxLength    최대길이
 * @return true 안넘었음(안전) false 넘었음
 * @classDescription String.getBytes() 의존함
 * 
 *  ex) isLength("기가가가", "4")      결과  false
 */
function isLength(str, maxLength)
{
	if ( str.getBytes() > maxLength)
	{
		return false;
	}
	return true;
}

/**
 * 문자열이 해당열을 넘었는지 체크하고 메세지를 출력하는 함수 이다.
 * @param {String} fieldCalledName 에러문구 또는 컨트롤명
 * @param {Input Contol} field  input컨트롤을 자체  <input type="text .... >      
 * @param {Number} maxLength 최대길이 
 * @param {Number} type 생략하면 컨트롤명+에러문구가 나오며, 1을 입력하면 컨트롤명이 출력됨
 * @return boolean true 성공 false 실패  실패시 에러문구가 출력
 * @classDescription isLength(), showMsgAndFocus() 의존함
 * 
 *  ex) <input type='text'  onBlur="javascript:isLengthAlert('범위',this,30);" >
 */
function isLengthAlert(fieldCalledName, field, maxLength, type) 
{
	if ( isLength(field.value,maxLength) == false)
	{
		var msg = type == null ? "입력가능한 "+fieldCalledName+" 최대길이는 영문/숫자일 때 "+maxLength+"자, 한글일 때 "+Math.floor(maxLength/2)+"자입니다." : fieldCalledName;
        showMsgAndFocus(msg, field);		
		return false;
	}
	return true;
}

/**
 * 최종적으로 입력된 시작일과 종료일 두날짜가 적합한지 검사한다.
 * @param {String} fromYmd 시작일자
 * @param {String} toYmd 종료일자
 * @return boolean true 적합한 날짜임 false 적합한 날짜 아님
 * 
 * ex) alert( isYmdFromTo('20091223', '20091222') )   결과 false
 */
function isYmdFromTo(fromYmd, toYmd)
{
	if(fromYmd > toYmd)
	 {
		 return false; 
	 }
	 return true;
}

/**
 * 최종적으로 입력된 시작일과 종료일 두날짜가 적합한지 검사하고 메세지창을 출력한다.
 * @param {Input Control} fieldFromYmd 시작일자 input field
 * @param {Input Contorl} fieldToYmd 종료일자 input field
 * @return  boolean true 적합한 날짜임 false 적합한 날짜 아님
 * @classDescription isYmdFromTo(), showMsgAndFocus() 의존함
 * 
 * ex)  
   <input type='text'  name="startDate" > ~ <input type='text'  name="endDate" >
    <input type="button" value="날짜확인" onClick="isYmdFromToAlert(startDate, endDate)">
 */
function isYmdFromToAlert(fieldFromYmd, fieldToYmd) 
{
	if ( isYmdFromTo(fieldFromYmd.value, fieldToYmd.value) == false)
	{
		var msg = "시작일자가 종료일자보다 큽니다" ;
		showMsgAndFocus(msg, fieldFromYmd);
		return false;
	}
	return true;
}


/************************ 날짜 함수 ************************/


/**
* 날짜 데이터에 구분자를 넣어 리턴함.
* 
* @param date {String}     날짜 YYYYMMDD (MMDD가 없을 경우 '입력년0101' DD가 없을 경우에는 '입력년월01" 로 채워짐)
* @param type {Number}   리턴받고자 하는 유형 아래참조  
* @param delimeter 구분자  String형
* @return String     구분자있는 날짜
  @classDescription getDateText() 함수 의존적임
   
* TYPE 1 : YYYY.MM.DD
* TYPE 2 : YY.MM.DD
* TYPE 3 : MM.DD
* TYPE 4 : YYYY.MM
* TYPE 5 : YYYY
*
*  ex)     getDateType("20081223");                  결과 2008.12.23
*            getDateType("20081223",1,"-")            결과 2008-12-23
*            getDateType("20081223",4,"")             결과 200812 
*/
function getDateType(date, type, delimeter)
{
    if(date == null) return "";
    if(arguments.length==1)
    {
        type = 1;
        delimeter = ".";
    }
    else if(arguments.length==2)
    {
        delimeter = ".";
    }
    
    if(date.length == 12) date += "01";
    else if(date.length == 10) date += "0101";
    else if(date.length == 8) date += "010101";
    else if(date.length == 6) date += "01010101";
    else if(date.length == 4) date += "0101010101";

  switch(type) 
  {
    case 1:
        return getDateText(1,date.substring(0, 8), delimeter);
    case 2:
        return getDateText(2,date.substring( 0, 8), delimeter);
    case 3:
        return getDateText(3,date.substring( 0, 8), delimeter);
    case 4:
        return getDateText(4,date.substring( 0, 8), delimeter);
    case 5:
        return getDateText(5,date.substring( 0, 8), delimeter);    
  }
}

/**
 * 특정형태의 날자 타입(구분주지정)으로 돌려준다.
 * @private
 * @param type                타입       
 * @param szdate             날짜
 * @param delimeter          구분자
 * @return type 맞는 형식으로 돌려줌
 */
function getDateText(type, szdate,delimeter)
{
    var reDate = "";
    
    if(szdate != null && szdate.length != 8) return ""; 
    if(szdate != null && szdate.length == 8)
    {         
        var year = szdate.substring(0, 4);
        var month = szdate.substring(4, 6);
        var day = szdate.substring(6, 8);
    
        switch(type) 
        {
            case 1:
                return  year + delimeter + month + delimeter + day;
            case 2:
                return  year.substring(2, 4) + delimeter + month + delimeter + day;
            case 3:    
                return month + delimeter + day;
            case 4:
                return  year + delimeter + month;
            case 5:
                return year;
       }
    }   
    return "";
}

/**
 * 시간에 구분자를 넣어 반환한다.
 * 혹은 시간 분 초를 리턴한다.
 * @param time 시간
 * @param {Number}  type 0 : 2자리(HH)  , 1 : 4자리까지 반환 HHmm,  2  : 6자리까지 반환   HHmmss
 *              {String}   type  "HH" 시간만 리턴,  "mm" 분만리턴, "ss" 초만 리턴
 * @param delimeter  정의 해주지 않으면 : 로 설정
 * @return 구분자 있는 시간
 * 
 * ex)   getTimeType('122330',1);             결과 12:30
 *        getTimeType('122330', 2);            결과 12:30:23
 *        getTimeType ('122330',1,'');         결과 1230
 *        getTimeType('122330','mm');        결과 23
 */
function getTimeType(time, type, delimeter)
{
    if(time==null || time=="") return time;
    
    if(arguments.length==1)
    {
        type = 1;
        delimeter = ":";
    }
    else if(arguments.length==2)
    {
        delimeter = ":";
    }
    
    if(time.length == 4) time += "00";
    else if(time.length == 2) time += "0000";

    var hour = time.substring(0, 2);
    var minute = time.substring(2, 4);
    var second = time.substring(4, 6);
    
    var value =  "";
    
    if(type == 'HH' || type == 'hh')
    {
        value = hour;        
    }
    else if(type == 'mm' || type == 'MM')
    {
        value = minute;      
    }
    else if(type == 'ss' || type == 'SS')
    {
         value = second;             
    }
    else if(type == 0)
    {
        value = hour;
    }
    else if(type == 1)
    {
        value = hour + delimeter + minute;
    }
    else
    {
        value = hour + delimeter + minute + delimeter + second;
    }
     return  value;
}


/**
 * 년월의 마지막 날짜를 가져온다.
 * @param {String} inputYmd 8자리 년월일 또는 6자리 년월 
 * @param {Number} 생략하면 8자리 값으로 리턴 , type 1 : 마지막일자만 리턴
 * @return {String} 입력년월+마지막 일자 혹은 마지막일자
 * 
 * ex)  alert( getLastDay('200802') )        결과 20080229
 */
function getLastDay(inputYmd, type)
{
   if(inputYmd ==null || inputYmd == "") return inputYmd;
  
  inputYm = inputYmd.substring(0,6);  

   var daysArray = new Array(12);    // 배열을 생성한다.

  for (i=1; i<8; i++)
  {
    daysArray[i] = 30 + (i%2);
  }
  for (i=8; i<13; i++)
  {
    daysArray[i] = 31 - (i%2);
  }		
  var sYear = inputYm.substring(0, 4) * 1;
  var sMonth	= inputYm.substring(4, 6) * 1;
	
  if (((sYear % 4 == 0) && (sYear % 100 != 0)) || (sYear % 400 == 0))
  {
		daysArray[2] = 29;
  }
  else
  {
		daysArray[2] = 28;
  }
  if (type == 1) 
  {
      return daysArray[sMonth].toString();
  }
  else 
  {
      return inputYm + daysArray[sMonth].toString();
  }
}


/**
 * 년월의 시작 날짜를 가져온다.
 * @param {String} inputYmd 8자리 년월일 또는 6자리 년월 
 * @return {String} 입력년월+시작 일자
 * 
 * ex)  alert( getFirstDay('200802') )        결과 20080201
 */
function getFirstDay(inputYmd)
{
   if(inputYmd ==null || inputYmd == "") return inputYmd;
  
	var  inputYm = inputYmd.substring(0,6);  
	var value = inputYm+"01";
	return value;
}


/**
 * 입력받은 날짜로부터 몇일 후의 날짜를 반환한다.
 * @param {String} inputYmd 원본년월일
 * @param {Number} iDay  더한 일수 
 * @return {String} 입력받은 날짜로부터 몇일후 날짜  yyyyMMdd 
 * 
 * ex)  alert( calcDate('20080201','50') )      결과 20080322
 */
function calcDate(inputYmd,iDay)
{
  var daysArray = new Array(); //월별 공간을 생성
	
  for(i=1; i<13; i++)	
  {
    daysArray[i] = 30 + (i%2);
  }
		
  var sYear  	= inputYmd.substring(0, 4) * 1;
  var sMonth 	= inputYmd.substring(4, 6) * 1;
  var sDay   	= inputYmd.substring(6, 8) * 1;
	
  daysArray[2] = getLastDay(sYear + "02",1);
	
  var iMoveRemain = iDay * 1 + sDay;
  var iCurMonth   = sMonth;
  var iCurYear    = sYear;
	
  while (iMoveRemain > daysArray[iCurMonth])
  {
    iMoveRemain = iMoveRemain - daysArray[iCurMonth];

    iCurMonth = iCurMonth + 1;
    if (iCurMonth > 12)
    {
      iCurMonth = 1;
      iCurYear = iCurYear + 1;			
      daysArray[2] = getLastDay(iCurYear + "02",1);
    }
  } //end of while
	
  iCurMonth = addZero(iCurMonth.toString());
  iMoveRemain = addZero(iMoveRemain.toString());
	
  return iCurYear + iCurMonth + iMoveRemain;
}

/************************ 아이프레임 함수 ************************/

/**
 * 아이프레임크기에 맞춰 폭과 높이를 맞춰 준다. 
 * @param {Iframe Object} ifrm 아이프레임 개체
 * @param {String} parentIdStr 아이프레임을 감싸고 있는 상위 프레임 
 * @return void
 * 
* 사용예.
*<table border="0" cellpadding="0" cellspacing="0"> 
*<tr> 
*<td id="container"><iframe src="사용자정의.html" name="myframe" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="no" onload="ifmResize(myframe,'container')"></iframe></td> 
*</tr> 
*</table> 
 */
function ifmResize(ifrm, parentIdStr) 
{ 
	var parentId = document.getElementById(parentIdStr);
   parentId.height = ifrm.document.body.scrollHeight; 
   parentId.width = ifrm.document.body.scrollWidth; 
}  


/************************ 쿠키관련 함수 ************************
* 클라이언트사이드의 특정내용을 보존하고 값을 체크 하는데 사용
*  
* 사용방법 :  하루동안 창열지 않기 
*  STEP 1.  페이지 로딩 시 쿠키가 있는 지 검사후, 없으면 창을 띄움
       a.html 
       <script language="javascript"> 
         if ( getCookie( "notice" ) != "done" )
        {
        noticeWindow  =  window.open('abc.html','Notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=363,height=733,left=30,top=120');
        noticeWindow.opener = self;
        }
      < /script >
    STEP 2. 사용자가 하루동안 창열지 않기 체크박스 선택후 닫기 버튼 을 눌렀을 때      
                쿠키에 값을 체크
        b.html
       <input type="checkbox" name="cbNotice" ><a href= "javascript:history.onclick=closeCookieWin('cbNotice','notice','done',1)">하루동안 창띄우지 않기</a> 
    STEP 3.  다시 페이지를 로딩해서 팝업 페이지가 열리는지 확인.        
***************************************************************/

/**
 * 쿠키설정시에 사용된다.
 * @param {String} name      설정하고자 하는 이름
 * @param {String} value      설정하고자 하는 값
 * @param {Number} expiredays   만료기간
 * @return void
 */
function setCookie( name, value, expiredays )
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

/**
 * 일정기간동안 창 열지않기에서 사용
 * 보통 하루동안 팝업 창 띄우지 않기에 사용
 * @param {Checkbox Control} cbName   체크박스
 * @param {String} name      설정하고자 하는 이름
 * @param {String} value      설정하고자 하는 값
 * @param {Number} expiredays   만료기간
 * @return void
 * 
 * ex)
   팝업창 
   <input type="checkbox" name="cbNotice" ><a href= "javascript:history.onclick=closeCookieWin('cbNotice','notice','done',1)">하루동안 창띄우지 않기</a>
 */
function closeCookieWin(cbName, name, value, expiredays)
{
	if ( document.all[cbName].checked )
			setCookie( name, value , expiredays);
		self.close();
}

/**
 * 해당쿠키 값을 가져온다. 
 * @param {String} name 설정한 쿠키이름
 * @return String 쿠키값
 */
function getCookie( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
	var y = (x+nameOfCookie.length);
	if ( document.cookie.substring( x, y ) == nameOfCookie ) {
	if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
	endOfCookie = document.cookie.length;
	return unescape( document.cookie.substring( y, endOfCookie ) );
	}
	x = document.cookie.indexOf( " ", x ) + 1;
	if ( x == 0 )
	break;
	}
	return "";
}

/************************ 컨트롤 함수 ************************/

/**
 * 체크박스를 모두선택 또는 취소 한다.
 * @param {Checkbox Control} cbAllChk  초출한 체크박스
 * @param {Checkbox Control} cbChk     체크해야 할 체크박스
 * @return void
 * 
 * ex)  
  <input type="checkbox" name= "cbAll" onClick="cbAllChk(cbAll, cbMat)"> 모두선택<br>
  <input type="checkbox" name="cbMat">
  <input type="checkbox" name="cbMat"> 
  
  활용) js function
        function userDefine()
        {
            var cbMat = document.getElementsByName('cbMat');
            var cbMatCnt =  cbMat != null ? cbMat.length : 0 ; 
            for(var i=0; i< cbMatCnt; i++)
            {
                if(cbMat[i].checked == true)
                {
                    값을 가져와야 할 구문
                }
            }
        }
 */
function cbAllChk(cbAllChk, cbChk)
{
  var chkCnt = cbChk !=null? cbChk.length : 0;
  if(chkCnt == undefined) chkCnt = 1;
  var bAllChk = cbAllChk.checked;

  for(var i=0;i<chkCnt;i++)
  {
     var chkboxObj = chkCnt==1?  cbChk : cbChk[i];
     chkboxObj.checked = bAllChk==true? true : false;
  }
}


/**
 * 라디오버튼그룹의 선택된 값을 가져온다
 * @param {String} rbName 라이오버튼명
 * @return void
 * 
ex)
 <input type="radio" name="rbMat" value="1">
<input type="radio" name="rbMat" value="2">
<input type="button" value="선택한값" onClick="alert( getSelectedRbValue('rbMat') )" >
 */
function getSelectedRbValue(rbName)
{
	var rbMat = document.getElementsByName(rbName);
	var rbMatCnt =  rbMat != null ? rbMat.length : 0 ; 
	for(var i=0; i< rbMatCnt; i++)
	{
		if(rbMat[i].checked == true)
		{
			return rbMat[i].value;
		}
	}	
	return "";
}

/**
 * 콤보박스의 선택된 텍스트를 가져온다.
 * @param {String} cbName 콤보박스명
 * @return {String} 선택된 텍스트
 * 
 ex)
 <select name="cb">
	<option value="1">안녕</option>
	<option value="'2">난</option>
	<option value="3">미니라고해~</option>
</select>
<input type="button" value="선택한텍스트" onClick="alert( getSelectedCbText('cb') )" > 
 */
function getSelectedCbText(cbName)
 {
	var cbObj = document.all[cbName];
	var index = cbObj.selectedIndex;
	var value = "";
	if(index > -1)
	{
		value = cbObj.options[index].text;
	}
	return value;
 }

/**
 * textarea 의 바이트 를 체크 함. input field  0 /  최대  byte 표시함.
 * @param {Textarea control} ta   입력할 TEXTAREA 개체 
 * @param {TextFiled control} tagetField  0 / 최대 바이트수를 체크할 TEXTFIELD 개체
 * @param {Number} maxByte
 * @return void
 * 
 * ex) 
<textarea name="message" id="message" onkeydown="autoByteChk(this,tfText,80)" onchange="autoByteChk(this,tfText,80)" onkeyup="autoByteChk(this,tfText,80)"  ></textarea>
<input type="text" name="tfText" readonly value="0/80 Byte" style="background-color:transparent;border-top: 0px ;border-right: 0px;border-bottom: 0px;   border-left: 0px ;" >
 */
function autoByteChk(ta, tagetField, maxByte)
{ 
    var curText; 
    var strLen; 
    var byteIs; 
    var lastByte; 
    var thisChar; 
    var escChar; 
    var curTotalMsg; 
    var okMsg; 

    curText = new String(ta.value); 
    strLen = curText.length; 
    byteIs = 0; 

    for(i=0; i<strLen; i++) { 
        thisChar = curText.charAt(i); 
        escChar = escape(thisChar); 

                // ´,¨, ¸ : 2byte 임에도 브라우져에서 1byte로 계산 
                if (thisChar == "´" || thisChar == "¨" || thisChar == "¸" || thisChar == "§" ){ 
                        byteIs++; 
                } 

        if (escChar.length > 4) { 
            byteIs += 2;  //특수문자 한글인 경우. 
        }else if(thisChar != '\r') {  //개행을 제외한 이외의 경우 
            byteIs += 1; 
        } 
         
                if(byteIs > maxByte)
				{ 
                          alert( maxByte + 'Byte를 초과하실 수 없습니다.'); 
                          thisText = curText.substring(0, i); 
                          ta.value = thisText; 
                          byteIs = lastByte; 
                          break; 
                } 

                lastByte = byteIs; 
    } 

    curTotalMsg = Math.ceil(maxByte / 80); 
    curEndByte = curTotalMsg * 80; 

    tagetField.value = byteIs + "/"+maxByte+" Byte"; 
}

/**
 * textarea의 높이를 사용자 입력에 따라 높이가 자동으로 증가, 감소한다.
 * @param {Textarea Control} ta 사용자가 입력할 textarea
 * @param {Number} height  textarea 높이  (textarea 높이와 똑같이 맞춘다. )
 ex)
 <textarea name="ta" style="width:99%;height:150;overflow-y:hidden" maxlength="2000" onKeyup="autoTaHeight(this,150)"></textarea>
 */
function autoTaHeight(ta, height)
{
	var scrollHeight=ta.scrollHeight; 
	if(scrollHeight >= height)ta.style.pixelHeight=scrollHeight+4
}

/**
 * INPUT HIDDEN 폼 태그 생성 or 값 매핑.
 * @param p_objForm
 * @param p_strId
 * @param p_strValue
 */
function AddHiddenElement(p_objForm, p_strId, p_strValue)
{	
	if(document.getElementById(p_strId) != null){
		document.getElementById(p_strId).value = p_strValue;
	}else
	{
		var inpHidden = "";
		try{
	    	inpHidden = document.createElement('<input type="hidden" id="'+p_strId+'" name="'+p_strId+'">');
		}catch(e){
			inpHidden = document.createElement("input");
			inpHidden.type = "hidden";
			inpHidden.name = p_strId;
			inpHidden.id = p_strId;
		}
	    inpHidden.value = p_strValue;
	    eval("document." + p_objForm).appendChild(inpHidden);
	}
}

/**
 * INPUT HIDDEN 폼 태그 생성 or 값 매핑. : name으로 무조건 생성=>체크박스 배치 용도.
 * @param p_objForm
 * @param p_strId
 * @param p_strValue
 */
function AddCheckedHiddenElement(p_objForm, p_strId, p_strValue)
{	
	var inpHidden = "";
	try{
		inpHidden = document.createElement('<input type="hidden" name="'+p_strId+'">');
	}catch(e){
		inpHidden = document.createElement("input");
		inpHidden.type = "hidden";
		inpHidden.name = p_strId;
	}
	inpHidden.value = p_strValue;
	eval("document." + p_objForm).appendChild(inpHidden);
}

/**
 * 테이블 컬럼 보기/감추기.
 */
function hideColumn(tableNm, nColIndex, bNoData) {
  // 인터넷 익스플로러 4면 document.all.myTable로,
  // 인터넷 익스플로러 5 이상 또는 넷스케이프 6 이상에서는
  // document.getElementById('myTable')로 테이블 객체를 얻어 옴
  var objTable = document.all ? eval("document.all."+tableNm) :
              document.getElementById(tableNm);
  if(bNoData){
	  $(objTable.rows[0].cells[nColIndex]).hide();
  }else{
	  //for(var r = 0; r < objTable.rows.length; r++)
		  //objTable.rows[r].cells[nColIndex].style.display = 'none';
		  //$(objTable.rows[r].cells[nColIndex]).fadeOut("fast");
		  //$(objTable.rows[r].cells[nColIndex]).hide();
	  $('#'+tableNm+' th:nth-child('+(nColIndex+1)+')').hide();
	  $('#'+tableNm+' td:nth-child('+(nColIndex+1)+')').hide();
  }
}

// Null 이 아닌경우 true
function isNotNull(str)
{
	 if(str != null && str != '' && str != 'undefined')
		 return true ;
	 
	 return false ;
}

// Null 이면 true
function isNull(str)
{
	 if(str == null || str == '' || str == 'undefined')
		 return true ;
	 
	 return false ;
}

// Null 이면 str2로 대체.
function getNotNull(str, str2)
{
	 var rtnStr = '' ;
	 
	 if(isNull(str))
	 {
		 if(isNotNull(str2))
		 {
			 rtnStr = str2 ;	 
		 }
	 }else{
		 rtnStr = str ;
	 }
	 
	 return rtnStr ;
}

// 사용은 문자열을 출력할 곳에 cutStr("길이가 긴 원래의 문자열",5) 와 
// 같이 써주시면 바이트 단위로 자르고 한글과 같이 2byte가 되는 글자는 1byte줄여서 출력합니다. 
function cutStr(str,limit){
	 var tmpStr = str;
	 var byte_count = 0;
	 var len = str.length;
	 var dot = "";
	 
	 for(i=0; i<len; i++){
		 byte_count += chr_byte(str.charAt(i));
		 if(byte_count == limit-1){
			 if(chr_byte(str.charAt(i+1)) == 2){
				 tmpStr = str.substring(0,i+1);
				 dot = "..";
			 }else {
		 		if(i+2 != len) dot = "..";
		 		tmpStr = str.substring(0,i+2);
		 	 }
		 	 break;
		 }else if(byte_count == limit){
			 if(i+1 != len) dot = "..";
			 tmpStr = str.substring(0,i+1);
			 break;
	 	 }
	 }
//	 document.writeln(tmpStr+dot);
	 return tmpStr+dot;
}

function chr_byte(chr){
	 if(escape(chr).length > 4)
	 	return 2;
	 else
	 	return 1;
}		 

function getTimeStamp() {
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  d = null ;
	  
	  return s;
}

function getToday(delimeter) {
	var d = new Date();
	
	var s =
		leadingZeros(d.getFullYear(), 4) + getNotNull(delimeter) +
		leadingZeros(d.getMonth() + 1, 2) + getNotNull(delimeter) +
		leadingZeros(d.getDate(), 2) ;
	
	d = null ;
	
	return s;
}

// 이전/이후 날짜를 거시기하게 불러옴. 
// 기준일자(YYYYMMDD), 더하기빼기일수, 구분자
// ex) getDateBeforeAfter(getToday(), -7, "-") ;
function getDateBeforeAfter(fromDate, gap, delimeter) {
	
	var today = "" ;
	if(isNull(fromDate)) today = new Date(); 
	else today = new Date(fromDate.substr(0,4),(fromDate.substr(4,2)-1),fromDate.substr(6,2)); 
	
	var daysago = gap*-1; 
	var d = new Date(today-(3600000*24*daysago)); 

	var s =
		leadingZeros(d.getFullYear(), 4) + getNotNull(delimeter) +
		leadingZeros(d.getMonth() + 1, 2) + getNotNull(delimeter) +
		leadingZeros(d.getDate(), 2) ;
	
	d = null ;
	
	return s;
}


//이전/이후 날짜를 거시기하게 불러옴. 
//기준일자(YYYYMMDD), 더하기빼기 개월 수, 구분자
//ex) getDateBeforeAfter(getToday(), -7, "-") ;
function getMonthBeforeAfter(fromDate, gap, delimeter) {
	
	var today = "" ;
	if(isNull(fromDate)) today = new Date(); 
	else today = new Date(fromDate.substr(0,4),(fromDate.substr(4,2)-1),fromDate.substr(6,2)); 
	
	var s =
		leadingZeros(today.getFullYear(), 4) + getNotNull(delimeter) +
		leadingZeros(today.getMonth() + 1 + gap, 2) + getNotNull(delimeter) +
		leadingZeros(today.getDate(), 2) ;
	
	d = null ;
	
	return s;
}



function leadingZeros(n, digits) {
   var zero = '';
   n = n.toString();

   if (n.length < digits) {
     for (i = 0; i < digits - n.length; i++)
       zero += '0';
   }
   return zero + n;
}	 

// 체크박스 선택 값 반환.(SQL IN Condition)
function getChkBoxSql(checkBoxClassName, quotation)
{
	var rtnStr = "" ;
	$("."+checkBoxClassName+":checked").each(function() {
		var val = getNotNull(quotation) 
		        + $(this).val() 
		        + getNotNull(quotation) ;
		if(rtnStr == "") rtnStr = val ;
		else rtnStr += "," + val;
		val = null ;
	}) ;
	return getNotNull(rtnStr,"''") ;
}

// jQueryUI 달력을 생성한다.
// 달력 텍스트필드와 버튼아이디 설정 후 사용하세요.
function createDatePicker(pDateFieldId, pDateButtonId, pDefDate)
{
	$("#"+pDateFieldId).datepicker({
		changeYear: true ,
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShot: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		altField: '#'+pDateFieldId , 
		altFormat: 'yy-mm-dd'
	});		
	$("#"+pDateFieldId).addClass("datepicker");  
	$("#"+pDateFieldId).attr("readonly","readonly") ;
	$("#"+pDateButtonId).click(function(){
		$("#"+pDateFieldId).datepicker("show");
	}) ;
	
	if(isNull($("#"+pDateFieldId).val())){
		if(isNull(pDefDate))
			$("#"+pDateFieldId).val(getToday("-")) ;
		else
			$("#"+pDateFieldId).val(pDefDate) ;
	}
			
}



/**
 * 윈도우 팝업 - POST.
 * @param p_strPageUrl
 * @param p_strPopupKey 
 * @param p_nWidth
 * @param p_nHeight
 * @param p_strScroll "yes", "no"
 * @param p_strFormName
 * @return
 */
var gArrWindowPost = [] ;
function openWindowPost(p_strPageUrl, p_strPopupKey, p_nWidth, p_nHeight, p_strScroll, p_strFormName)
{
    var scW=screen.width ;
    var scH=screen.height ;
    var t = parseInt((scH-p_nHeight)/2) ;
    var l = parseInt((scW-p_nWidth)/2) ;
 
    try {
    	if(isNull(gArrWindowPost[p_strPopupKey]) || gArrWindowPost[p_strPopupKey].closed)
    	{
    		gArrWindowPost[p_strPopupKey] = window.open('', p_strPopupKey, 				
    				"toolbar=no,location=no,status=no,menubar=no,scrollbars="+p_strScroll
    				+",resizable=yes,width="+p_nWidth+"px,height="+p_nHeight+"px,top="+t+"px,left="+l+"px");
    	}
    	else
    	{
    		gArrWindowPost[p_strPopupKey].focus() ;
    	}
	} catch (e) {
		//alert(e.description) ;
	}
		   
	var frm = document[p_strFormName];
    frm.target = p_strPopupKey;
    frm.method = "post";
    frm.action = p_strPageUrl;
    frm.submit();
}
/*
// openWindowPost : 예제.
function openXXX(rowIndex)
{	
	AddHiddenElement('mainForm','M_USER_ID', dataSet1.USER_ID[rowIndex] );
	AddHiddenElement('mainForm','M_USER_NM', dataSet1.USER_NM[rowIndex] );
	
	openWindowPost('/VOC/어쩌고....', 'popXXX', 800, 600, 'auto', 'mainForm') ;
}
*/

/**
 * 윈도우 팝업.
 * @param p_strPageUrl
 * @param p_strPopupKey 
 * @param p_nWidth
 * @param p_nHeight
 * @param p_strScroll "yes", "no"
 * @return
 */
var gArrWindow = [] ;
function openWindow(p_strPageUrl, p_strPopupKey, p_nWidth, p_nHeight, p_strScroll)
{
	var popupTempleteUrl = "/common/popupTemplete.jsp?inc="+encodeURIComponent(p_strPageUrl);
	
    var scW=screen.width ;
    var scH=screen.height ;
    var t = parseInt((scH-p_nHeight)/2) ;
    var l = parseInt((scW-p_nWidth)/2) ;
 
    try {
    	if(isNull(gArrWindow[p_strPopupKey]) || gArrWindow[p_strPopupKey].closed)
    	{
			gArrWindow[p_strPopupKey] = window.open(popupTempleteUrl, p_strPopupKey, 				
    				"toolbar=no,location=no,status=no,menubar=no,scrollbars="+p_strScroll
    				+",resizable=yes,width="+p_nWidth+"px,height="+p_nHeight+"px,top="+t+"px,left="+l+"px");
    	}
    	else
    	{
    		gArrWindow[p_strPopupKey].focus() ;
    	}
	} catch (e) {
		//alert(e.description) ;
	}
}

/**
 * 모달 윈도우 팝업.
 * @param p_strPageUrl
 * @param p_jsonArgs 
 * @param p_nWidth
 * @param p_nHeight
 * @param p_strScroll "yes", "no"
 * @return
 */
function openModalWindow(p_strPageUrl, p_jsonArgs, p_nWidth, p_nHeight, p_strScroll) 
{
  var scW=screen.width;
  var scH=screen.height;
  var w = p_nWidth;
  var h = p_nHeight;
  
  //IE6 팝업창 크기 보정 (창 크기는 IE7을 기본으로 함)
  var navName = navigator.appName; 
  if (navName == "Microsoft Internet Explorer") {
    var brVer = navigator.userAgent;
    var brVerId = brVer.indexOf('MSIE');
    brNum = brVer.substr(brVerId,8);
    brNum2 = brNum.substr(5,3);

    //IE7버전 미만일 때 높이를 더함
    if(brNum2 < 7.0) 
    {
      w += 6;
      h += 32;
    }
  }
  
  var pos = "dialogWidth:"+w+"px;";
  pos += "dialogHeight:"+h+"px;";
  pos += "dialogTop:" + parseInt((scH-h)/2) + "px;";
  pos += "dialogLeft:" + parseInt((scW-w)/2) + "px;";
  pos += "center:yes;";
  pos += "help:no;";
  pos += "status:no;";
  pos += "scroll:"+p_strScroll;
  var retValue = window.showModalDialog(p_strPageUrl, p_jsonArgs, pos);
  
  return retValue;
}



/**
 *  서버시간 구해오기
 */
function srvTime(){
	/* ActiveXObject 스크립트 에러로 인해 크롬버전 호환 문제로 해당부분 주석 처리 (2021.08.22)*/
	/*
	var xmlHttp;
	xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
	xmlHttp.open('HEAD',window.location.href.toString(),false);
	xmlHttp.setRequestHeader("Content-Type", "text/html");
	xmlHttp.send('');
	return xmlHttp.getResponseHeader("Date");
	*/
	return null;
}


function getDateStamp(d) {
	  
	  var s =

	    leadingZeros(d.getFullYear(), 4) + '-' +

	    leadingZeros(d.getMonth()+1, 2) + '-' +

	    leadingZeros(d.getDate(), 2);

	  return s;

}