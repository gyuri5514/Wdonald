/* **************************************************************************
 * Illegal use of this software will violate the Copy Right Law
 * **************************************************************************
 * Program Name    			:  commonTable.js
 * Function description 	:  ���� ���̺� - �����ͼ���, ����¡, ��Ŭ��/����Ŭ�� �̺�Ʈ
 * 																�ѿ���/�Ѿƿ�/��Ŭ�� ���󺯰�, ǳ������ ���
 * Programmer Name   	:  �̽���
 * Creation Date       			:  2008.11.21
 * ************************************************************************** 
 *                    P R O G R A M  H I S T O R Y 
 * ************************************************************************** 
 * DATE	:     PRGAMMER	: REASON 
 */
 
var re_mousedown = false; //���콺�� ���� ����
var re_td = ""; //������ ������ re_td
var re_td_width; //������ re_td�� width,
var re_drag_before_x = 0; //���콺 �巹���� ������ġ
function TCstartColResize(obj)
{
       re_mousedown = true;
       re_td = obj;
	   re_td_width = re_td.width;
       re_drag_before_x = event.clientX;
}

function TCColResize()
{
       if (re_mousedown){
              var distX = event.x - re_drag_before_x; //�̵��� ����
              re_td.width = parseInt(re_td_width) + parseInt(distX);

		   var div_id = re_td.parentNode.parentNode.parentNode.parentNode.id;
    		var now_underTable = null;
			if(div_id.indexOf("HEAD")>-1)
			{
				div_id = div_id.replace("_HEAD","");
				//���������� ID�� ã�Ұ�
				var obj = document.getElementById(div_id);
				//���̺���̵� ã��
					now_underTable = obj.childNodes.item(0).childNodes.item(0).childNodes.item(0).childNodes[selectedIndex];
				    now_underTable.width =  parseInt(re_td_width) + parseInt(distX);

			}

       }
}
function TCstopColResize(){
       re_mousedown = false;
       re_td = '';
	   selectedIndex = "";
}
function cell_left(obj){//���콺�� ���� �������� ����
       if(event.offsetX < 5 && obj.cellIndex!=0)
              return true;
       else 
              return false;
}
function cell_right(obj){//���콺�� ���� ���������� ����
       if(event.offsetX > obj.width-4)
              return true;
       else 
              return false;
}
//�����������
var selectedIndex = null;
document.onmousedown = function(){
try{
       var now_mousedown = window.event.srcElement;
	   selectedIndex = now_mousedown.cellIndex-1;
	   if(now_mousedown.className.toUpperCase()=="COLRESIZE")
	  {
              if( cell_left(now_mousedown) )
		     {
                     now_mousedown = now_mousedown.parentNode.childNodes[now_mousedown.cellIndex-1];
              }
			  else if( !cell_right(now_mousedown) )
			  {
                     return true;//�����ʵ� ���ʵ� �ƴϸ� ������ ���� ����
              }

            TCstartColResize(now_mousedown);


       }
}catch(e){ return true; }
}
//��������
document.onmousemove = function(){
try{
       var now_mousemove = window.event.srcElement;
       if(now_mousemove.className.toUpperCase()=="COLRESIZE" || re_td!=""){
              //���� �����ڸ��� ���콺 Ŀ�� ����
              if( cell_left(now_mousemove) || cell_right(now_mousemove) ){
                     now_mousemove.style.cursor = "col-resize";
              }else{
                     now_mousemove.style.cursor = "pointer";
              }


              TCColResize(now_mousemove);
       }else{
              now_mousemove.style.cursor = "";
}
}catch(e){ return true; }
}
//������������
document.onmouseup = function(){
try{
   var now_mouseup = window.event.srcElement;
   //if(now_mouseup.className=="colResize"){
          TCstopColResize(now_mouseup);
   //}
}catch(e){ return true; }
}
//�������� ���� �ؽ�Ʈ ���� ����
document.onselectstart = function(){
try{
if(re_td != ""){
return false;
}
}catch(e){ return true; }
}

 // ������ ������ TR ID.
var OLD_CLICK_ID 				= [] ;
var NEW_SORT_TD_CLICK_ID 		= [] ;
var OLD_SORT_TD_CLICK_ID		= [] ;

// ASC/DESC String
var ASCDESC						= [] ;
 
 // ������ �ѿ����� TR ID.
var OLD_OVER_ID 				= [] ;
var OLD_SORT_TD_ID 				= [] ;

// ���õ� �ο� �ε��� 
var SELECTED_ROW_IDX 			= [] ;
// ���õ� ��Ʈ �÷� �ε��� 
var SELECTED_SORT_IDX 			= [] ;
// ��ǥ���� ���õ� ��Ʈ �÷� �ε��� 
var SELECTED_SORT_IDX_STR 	= [] ;

// ��Ʈ �÷�.
var SORT_TD_OVER_COLOR 		= '#F5F5FA' ;
var SORT_TD_CLICK_COLOR		= '#C8DAEB' ;
var SORT_HEAD_TEXT_COLOR    = '#FBE75E' ;

// ǳ������ ����.
var TOOLTIP_BORDER_WIDTH    = 3 ;
var TOOLTIP_BG_COLOR 		= '#FFFAD7' ;
var TOOLTIP_BORDER_COLOR 	= 'orange' ;

// ��û �� ������.
var REQ_PAGE 				= [] ;
// ���� ������.
var CUR_PAGE 				= [] ;

// ���̺� WIDTH.
var TB_WIDTH				= [] ;

// ���������� ������ MAX ������ ��.
var MAX_PAGE_SET			= [] ; // ����¡����.
// ���� ������ ��.
var CUR_PAGE_SET			= [] ; // ����¡����.

 /*========================================================= *
 * Request Function Name : 	makeTable						*
 * Description   : 	���̺� ����.							*
 *========================================================= */
// 1. twoArr 			    : ������ 2���迭.
// 2. tbNm 			    : ���̺� ���̵�.(���ξ� ID).
// 3. tbIdx 			    : �� ȭ���� ���̺� �ε��� ��ȣ - 0������ ����.
// 4. union 			    : ����� �ο츦 ��ĥ������ �и��� ������ ����. true/false
// 5. colNmStr 		    : ��� �÷���(��ǥ������). 
// 6. colSizeStr		    : �÷� ������ (��ǥ������). �ڵ��ο��� null .
// 7. viewColCnt 	    : ��ȣ�÷��� ������ ������ �÷��� ����.
// 8. reqSortFnNm    : ���� ��� �� ��������ȣ Ŭ���� ����ȸ �Լ���. - ��Ʈ �̻��� null / �Ϲ������� �ڽ��� Reqest �Լ�.
// 9. totCnt 			    : ����¡ : ��ü ������ ����. - ������ ������ ��� ����.
//10. maxListCnt 	    : ����¡ : ����¡�Ͽ� ������ �ο��� Max Row. - ������ ������ ��� ����.
//11. reqPageFnNm : ���̹�ȣ Ŭ���� ����ȸ �Լ���. - �Ϲ������� �ڽ��� Reqest �Լ�. - ������ ������ ��� ����.

// ������ : ���� ù��° �÷��� �������� ��尡 �Ǵ� ���̺�. ( �ƿ��ٿ�� ���ʵ����� ���̺��� �ش�. ���� ���÷� �������. )
function makeTable3(twoArr, tbNm)
{
	// ���̺��+_DIV �̸����� JSP�� DIV���� �ʼ�. 
	var divNm = tbNm+"_DIV" ;
	
	var htmlString = '' ;
	
	htmlString += '\n <table class="table01" cellspacing="1" > ' ;
	
	if(twoArr.length > 0){
		for(var i=0 ; i < twoArr.length ; i++){
			htmlString += '\n <tr> ' ;
			
			for(var j=0 ; j < twoArr[i].length ; j++ ){
				if(j==0){
					htmlString += '\n <th align="center">'+twoArr[i][j]+'</th> ' ;
				}else{
					// ��ȭ�ɱ� ��ư.
					var callBtnTag = '' ;
					// ��ȭ��ȣ or �޴�����ȣ �ʵ��.
					if(i==1 || i==2){
						
						// ��ȭ��ȣ�� CTI�ǳ� �ϴ� ��ȭ��ȣ �ʵ尪 ����.
						if(i==1){
							setValue('ObDialNo', twoArr[i][j]) ;
						}
						
						// ��ȣ�� �ִ°͸� CTI�ǳ� �ϴ� ��ȭ��ȣ �ʵ尪 ����.
						if((twoArr[i][j].replaceAll('-','')).replaceAll(' ','') != ''){
							callBtnTag = '&nbsp;<img src="/images/agent/icon_telephone.gif" onClick="javascript:setValue('+"'hdnTelNo',"+"'"+ twoArr[i][j] +"'"+');custInfoDial(getValue('+"'hdnTelNo'"+'))" onFocus="this.blur();">'  ;
						}
					}
					htmlString += '\n <td>'+twoArr[i][j]+callBtnTag+'</td> ' ;
				}
			}
			htmlString += '\n </tr> ' ;
		}
	}else{
			htmlString += '\n <tr> '
							+   '\n <td align="center"><font color=gray>��������Ʈ�� �����ϼ���.</font></td> ' 
							+   '\n </tr> ' ;
	}
	htmlString += '\n </table> ' ;

	// �׸���.
	setHTML(divNm, htmlString) ;
	
	
	//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
   /* if(MEMORY_INIT){
    	htmlString = null ;
    }*/
	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	
}


// ������ : 2�� ��� �÷��� ���� ���� �� ��� HTML�� �߰��Ѵ�. - ���������� �����̷µ�.
var ADD_HEAD_COLS_HTML = null;
var ADD_HEAD_TD_CLASS = null;
function makeTable2(twoArr, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm, addHeadHtml)
{
	ADD_HEAD_COLS_HTML = addHeadHtml ;	
	ADD_HEAD_TD_CLASS = ' class=ti ' ;
	makeTable(twoArr, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm) ;
}
// ������ : ������İ��� ��ȸī��Ʈ ���̺�� ������Ʈ�� ���� TR ID �ο��� ���ؼ�.
var COUNSEL_CNT_TR_ID = null;
function makeTableCounsel(twoArr, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm, totCnt, maxListCnt, reqPageFnNm)
{
	COUNSEL_CNT_TR_ID = "CONS_TR_ID" ;	
	makeTable(twoArr, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm, totCnt, maxListCnt, reqPageFnNm) ;
}

// ������ : ����Ʈ.
function makeTable(jsonObj, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm, totCnt, maxListCnt, reqPageFnNm, appendTrId)
{
	// �� ���̺��� ��ġ�� DIV �̸�. - JSP�� ���� �ؾ� ��.
	var divNm = tbNm+"_DIV" ;
	
	// �� ����� �ο� ���̺��� ���� ������ ���. ����� DIV �̸�. - JSP�� DIV ���� �ʼ�.
	if(!union) var headDivNm = tbNm+"_HEAD_DIV";			
	
	// �� ����¡ ���� : ����¡ ���̺��� ��ġ�� DIV �̸� - JSP�� DIV ���� �ʼ�.
	var pageDivNm = tbNm+"_PAGE_DIV";			

	// �� ���̺� �ο�  onClick �̺�Ʈ �Լ����� �ʼ�. - �Լ� ���� �ʼ�.
	var onClickFnNm = tbNm+"_ON_CLICK" ;

	// �� ���̺� �ο�  onDblClick �̺�Ʈ �Լ����� �ʼ�. - �Լ� ���� �ʼ�.
	var onDblClickFnNm = tbNm+"_ON_DBL_CLICK" ;

	// �� ���̺� �ο��� üũ�ڽ� ���ý� �̺�Ʈ. TB_TYPE �� 1�̸�(üũ�ڽ�) �Լ����� �ʼ�.
	var onCheckBoxFnNm = tbNm+"_CHECKED" ;

	// �� �ش� �Լ����� �ʼ�.[ ex) function  ���̺��_MAKE_ARR(i, viewCols, htmlString, jsonObj, divNm, tbIdx) ]
	var makeArrFnNm = tbNm+"_MAKE_ARR" ;
	
	// �� �׸��� �� ���� �۾��Լ� 
	var afterFnNm = tbNm+"_AFTER" ;


	// ������ �ο� TR ID
	var trNm =  tbNm+"_TR_ID" ;
	
	// ��� �÷� SPAN ID --> ���� �ﰢ�� ���� �κ�(���TD ���� SPAN).
	var thSpanNm = tbNm+"_TH_SPAN_ID" ;
	
	// ������ ������ TR ID.
	OLD_CLICK_ID[tbIdx] = 'new' ;
	OLD_OVER_ID[tbIdx] = 'new' ;
	OLD_SORT_TD_CLICK_ID[tbIdx] = 'new' ;
	
    // �÷� �̸� �迭 ����.
 	var colNmArr = colNmStr.split(",") ;
    // �÷� ������ �迭 ����.
    if(colSizeStr != null){
	 	var colSizeArr = colSizeStr.split(",") ;
    }
 	
	if(colNmArr.length < viewColCnt){
		alert("commonTable.js ==> ������ �÷� ����("+(viewColCnt)+")�� �÷��̸� ����("+colNmArr.length+")�� �ʰ��Ͽ����ϴ�.");
		return ;
	}
	
	var sortIdxArr = [] ;
    // ��ǥ ������ ���� �ε��� ����.
 	if(reqSortFnNm != null){
 		if(SELECTED_SORT_IDX_STR != null){
 			sortIdxArr = (SELECTED_SORT_IDX_STR.split(" ").join("")).split(",") ;
		} else {
			// ���� �ε��� �迭 �ڵ� ������. - ��ǥ���� �ε����� ����� ���� �ʱ� �����̴�.
			for(var i=0 ; i < colNmArr.length ; i++){
				sortIdxArr[i] = i+1 ; 
			}
		}
 	}
 	// ������ �÷� ��.
 	var viewCols = viewColCnt ;
 	// ������ ��.
 	var dataCnt = parseInt(jsonObj.listCnt,10);
		
 	// orderMark
 	var orderMark = "" ;
 	var curStyle = "" ;
 	var eventStr = "" ;

	// ���̺� ���۹�ȣ.
	if(maxListCnt == null){
	    var startNum = 1 ;
	}else{
	    var startNum = (maxListCnt*REQ_PAGE[tbIdx]+1)-maxListCnt ;
	}
	
	// ���̺�.
	var htmlString = '' ;
	
	// ���.
	var headString = '' ;

	
	if(isNull(appendTrId)){
		// ����� �ο츦 ��ģ ���.
		if(union){
		
			htmlString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1">'  ;
			htmlString+=	'<tr>'  ;
			
			// �߰� ����� ���� ��� �߰��Ѵ�.
			if(ADD_HEAD_COLS_HTML != null){
				htmlString += ADD_HEAD_COLS_HTML ;
			}
			ADD_HEAD_COLS_HTML = null ; // �ٷ� �ʱ�ȭ.
			
			for(i=0 ; i < viewCols ; i++){
				// ���� �÷�.
				if(reqSortFnNm != null){
					for(j=0 ; j < sortIdxArr.length ; j++){
						if(eval(sortIdxArr[j]) == i){
							if(SELECTED_SORT_IDX[tbIdx] == i){
								orderMark = getOrderMark(tbIdx) ;
							}else{
						        orderMark = "��"; 
							}
					        curStyle = "cursor:pointer" ;
			 				eventStr = 'javascript:SELECTED_SORT_IDX['+tbIdx+'] = '+i+' ; '+reqSortFnNm+'('+maxListCnt+', '+REQ_PAGE[tbIdx]+');' ;
					        break ;
						}else{
							orderMark = ""; 
			 				eventStr = "" ;
					        curStyle = "" ;
						}
					}
				}

				// �Ϲ� ��� �÷�.
				if(ADD_HEAD_TD_CLASS == null){					
					// ��� �÷���.
				    htmlString += '<th class="colresize"  style="'+curStyle+'" width='+colSizeArr[i]+'>'+'<span onClick="'+eventStr+'">'+colNmArr[i]
							 		  //+ '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></span></th>' ;
				    					+ '</span></th>' ;
				// 2������ Ŭ���� ����.
				}else{
					// ��� �÷���.
				    htmlString += '<td '+ADD_HEAD_TD_CLASS+' onClick="'+eventStr+'" style="'+curStyle+'">'+colNmArr[i]
							 		  //+ '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></td>' ;
				    					+ '</td>' ;
				}
		    }
			ADD_HEAD_TD_CLASS = null ; // �ٷ� �ʱ�ȭ.		 		  
			
		    htmlString += '</tr>' ;
		    
		// ����� ���̺��� �и��� ���.    
		}else{
			headString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1" >';

			// �÷������ �ο����� ���.
			/*
			if(colSizeStr!=null){
				for(i=0 ; i < colSizeArr.length ; i++){
					headString += '<col width='+colSizeArr[i]+'>';
				}
			}
			*/
			headString+=	'<tr>'  ;
			
			// �߰� ����� ���� ��� �߰��Ѵ�.
			if(ADD_HEAD_COLS_HTML != null) htmlString += ADD_HEAD_COLS_HTML ;
			
			for(i=0 ; i < viewCols ; i++){
				// ���� �÷�.
				if(reqSortFnNm != null){
					for(j=0 ; j < sortIdxArr.length ; j++){
						if(eval(sortIdxArr[j]) == i){
							if(SELECTED_SORT_IDX[tbIdx] == i){
								orderMark = getOrderMark(tbIdx) ;
							}else{
						        orderMark = "��"; 
							}
					        curStyle = "cursor:pointer" ;
			 				eventStr = 'javascript:SELECTED_SORT_IDX['+tbIdx+'] = '+i+' ; '+reqSortFnNm+'('+maxListCnt+', '+REQ_PAGE[tbIdx]+');' ;
					        break ;
						}else{
							orderMark = ""; 
			 				eventStr = "" ;
						}
					}
				}
				// �Ϲ� ��� �÷�.
				if(ADD_HEAD_TD_CLASS == null){
					// ��� �÷���.
				    headString += '<th  class="colresize"  style="'+curStyle+'" width='+colSizeArr[i]+'>'+'<span onClick="'+eventStr+'">'+colNmArr[i]
							 		  + '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></span></th>' ;
				// 2������ Ŭ���� ����.
				}else{
					// ��� �÷���.
				    headString += '<td '+ADD_HEAD_TD_CLASS+' onClick="'+eventStr+'" style="'+curStyle+'">'+colNmArr[i]
							 		  + '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></td>' ;
				}
		    }
		    headString += '</tr></table>' ; 
		    
		  	try{
			    // ��� ���̺� ����.
			    setHTML(headDivNm,headString) ;
		  	}catch(ex){
		  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + headDivNm);
		  		return ;
		  	}
		    
		    // �ο����̺� ����.
		    htmlString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1" >';
		    
		}		
	}

	if(dataCnt > 0){

		
		// ������ �ο�.
		for(i=0 ; i < dataCnt ; i++)
		{
			if(isNotNull(appendTrId))
			{
				var appendTrNm = trNm+(i+1) +"_"+ Number(appendTrId) ;
				var styleNm = "style='background-color:whitesmoke;cursor:pointer;'" ;	
				
				// �̹� ��ȸ �� ��� '����'ó�� �Ѵ�.
				if(isNotNull($("#"+appendTrNm).html())){
					$("#"+appendTrNm).remove() ;
					continue ;
				}
				
				htmlString += '<tr id="'+appendTrNm+'" '+styleNm + ' onmouseover="javascript:SELECTED_ROW_IDX['+tbIdx+'] = '+i+' ;rOver(this.id, '+i+', '+divNm+','+tbIdx+');" onmouseout="javascript:rOut(this.id,'+tbIdx+');"'
							+  ' onClick="javascript:changeClass(this.id, '+divNm+','+tbIdx+');tableClickEvent(\''+onClickFnNm+'\','+i+');" onDblClick="tableClickEvent(\''+onDblClickFnNm+'\','+i+');" style="cursor:pointer" >' ;
			
			}else{
				htmlString += '<tr id="'+trNm+(i+1)+'" onmouseover="javascript:SELECTED_ROW_IDX['+tbIdx+'] = '+i+' ;rOver(this.id, '+i+', '+divNm+','+tbIdx+');" onmouseout="javascript:rOut(this.id,'+tbIdx+');"'
							+  ' onClick="javascript:changeClass(this.id, '+divNm+','+tbIdx+');tableClickEvent(\''+onClickFnNm+'\','+i+');" onDblClick="tableClickEvent(\''+onDblClickFnNm+'\','+i+');" style="cursor:pointer" >' ;
			   
			}		
    	       	    
            // ù��° �÷� Ÿ���� ��ȣ���̸�.(����Ʈ)                
            if(TB_TYPE == 0){
	    	    htmlString += '<td width='+colSizeArr[0]+' align="center">'+(startNum+i)+'</td>';
            // ù��° �÷� Ÿ���� üũ�ڽ����̸�.
            }else if(TB_TYPE == 1){
            	
		    	if(isNull(appendTrId))
		    	{
		    		htmlString += '<td width='+colSizeArr[0]+' align="center"><input type="checkbox" name="'+tbNm+'_CB" value="checkbox" onClick="javascript:'+onCheckBoxFnNm+'(this);" onFocus="this.blur();" style="border:0"/></td>';
		    	}
		    	else
	    		{
		    		htmlString += '<td width='+colSizeArr[0]+' align="center">&nbsp;</td>';
	    		}
            }        
			try{
				
			// �迭 ����.-�����ȭ�鿡 �ش��Լ� �����ؾ���.(makeArr �Ʒ� ���� ���� ).
		    	htmlString = eval(makeArrFnNm+'(i, viewCols, htmlString, jsonObj, divNm, tbIdx, colSizeArr, appendTrId)');
		    	
			}catch(ex){
				if(i==0){
					alert("�Ʒ� �Լ��� �������� �ʰų� ������ �ֽ��ϴ�.\n\n ==> "+ makeArrFnNm+"(i, viewCols, htmlString, jsonObj, divNm, tbIdx)") //아래 함수가 존재하지 않거나 오류가 있습니다
					return ;
				}
			}
	        htmlString += '</tr>' ;	  
        }
        
  	}else{
  		
		if(isNotNull(appendTrId))
		{
			var appendTrNm = trNm+(0) +"_"+ Number(appendTrId) ;
			
			// �̹� ��ȸ �� ��� '����'ó�� �Ѵ�.
			if(isNotNull($("#"+appendTrNm).html())){
				$("#"+appendTrNm).remove() ;
			}else{
				htmlString +=  '<tr id="'+appendTrNm+'"><td colspan='+viewCols+' align="center"><font color=gray>��ȸ�� ����� �����ϴ�.</font></td></tr>' ;
			}			
		}else{
			htmlString +=  '<tr><td colspan='+viewCols+' align="center"><font color=gray>��ȸ�� ����� �����ϴ�.</font></td></tr>' ;
		}
  	}
		  	
  	
  	try{
  		if(isNull(appendTrId)){
  			
  			htmlString += '</table>' ;
  			
  			// ���̺� ����.
  			setHTML(divNm, htmlString) ;    
  			
  		}else{

  			// �߰��Ѵ�.
  			$("#"+trNm + (Number(appendTrId)+1)).append(htmlString) ;
			//$(htmlString).hide().appendTo($("#"+trNm + (Number(appendTrId)+1))).slideDown("slow") ; 
  			
  		}
        tableClickEvent(afterFnNm);
  	}catch(ex){
  		alert(ex.description);
  		return ;
  	}
  	
	if(isNull(appendTrId))
	{
	
		// ����¡ ���̺�.
		var pageString = '' ;
		
		if(dataCnt > 0){
		    if(totCnt != null && maxListCnt != null && reqPageFnNm != null){
		        pageString += '	<table border="0" width="100%" height="21" align="center" style="background-color:white">'
		        				+		'<col width="45px"><col width="40px"><col width="%"><col width="40px">'
		        				+		  '<tr><td height="5"></td></tr><tr align="center">'
		        				+			'<td>' ;
		        				
				// ���� �������� �ٽ� ��û ����.
		        if( CUR_PAGE_SET[tbIdx] > 1){				
				    pageString +=	  	  '<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqFirstPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+1+'); " onFocus=this.blur();>'
			        				+			    '<img src="/common/images/common/bod_btn_prev2.gif" width="16" height="15" style="margin-right:5px" align="absmiddle" alt="ó��">'
			        				+			  '</a>';
				}else{
				    pageString +=	  	  '<a href="#" onFocus=this.blur();>'
			        				+			    '<img src="/common/images/common/bod_btn_prev2.gif" width="16" height="15" style="margin-right:5px" align="absmiddle" alt="ó��">'
			        				+			  '</a>';
				}
				// ù��° �������� ���� ���� ������.
		        if( CUR_PAGE_SET[tbIdx] > 1){				
			        pageString += 		  '<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqPrevPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+((CUR_PAGE_SET[tbIdx]-2)*MAX_PAGE_SET[tbIdx]+1)+'); "  onFocus=this.blur();>'
			        				+				'<img src="/common/images/common/bod_btn_prev.gif" width="16" height="15" align="absmiddle" style="margin-right:5px" alt="����">'
			        				+			  '</a>&nbsp;';
			    }else{
			        pageString += 		  '<a href="#" onFocus=this.blur();>'
			        				+				'<img src="/common/images/common/bod_btn_prev.gif" width="16" height="15" align="absmiddle" style="margin-right:5px" alt="����">'
			        				+			  '</a>&nbsp;';
			    }
		
				// �� ������ ��.
				var pageCnt = fnFixNum((totCnt/maxListCnt), 3) ;
				if(totCnt%maxListCnt == 0) --pageCnt ;
	
				// ������ �� ����.
				var pageSetCnt = fnFixNum((pageCnt/MAX_PAGE_SET[tbIdx]), 3) ;
	
				if(pageCnt%MAX_PAGE_SET == 0) --pageSetCnt ;
				
				//alert(pageSetCnt)
				
				// �̵��� ������ �� ���۹�ȣ.
				var goPageSetNo = (CUR_PAGE_SET[tbIdx]-1)*MAX_PAGE_SET[tbIdx]+1 ;
				//REQ_PAGE[tbIdx] = goPageSetNo ;
	
				// ������ ����
				CUR_PAGE[tbIdx] = pageCnt;

				for(i=0 ; i<CUR_PAGE[tbIdx]; i++){
				
					// �� ȭ�鿡 ������ ������ ������ �����ְ� �������� �����.
			        if(i >= (goPageSetNo-1) && i < (goPageSetNo-1)+MAX_PAGE_SET[tbIdx]){
			        
						// �� �������� ��û �������� ������. �ٽ� ��û ����.
						if( REQ_PAGE[tbIdx] != (i+1)){
					        pageString +=	'<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');REQ_PAGE['+tbIdx+']='+(i+1)+';'+reqPageFnNm+'('+maxListCnt+', '+(i+1)+'); " onFocus=this.blur();>';
						}else{
					        pageString +=	'<a href="#" onFocus=this.blur();>';
						}				
				        // ���� ������ ����.
				        if(REQ_PAGE[tbIdx] == (i+1)){
					        pageString +=		'<font color="#0876D0"><span id= pageSpan'+(i+1)+'>['+(i+1)+']</span></font></a>';
				        }else{
					        pageString +=		'<span id= pageSpan'+(i+1)+'>['+(i+1)+']</span></a>';
				        }
				        
			        }else{
			        }
				}	        				
				
				// ������ �������� ���� ���� ������.																																											
				if( CUR_PAGE_SET[tbIdx] < pageSetCnt ){
					pageString +=	'&nbsp;<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqNextPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+(CUR_PAGE_SET[tbIdx]*MAX_PAGE_SET[tbIdx]+1)+'); " onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next.gif" width="16" height="15" align="absmiddle" style="margin-left:5px" alt="����">'
			        				+		'</a>&nbsp;';			        
				}else{
			        pageString +=	'<a href="#" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next.gif" width="16" height="15" align="absmiddle" style="margin-left:5px" alt="����">'
			        				+		'</a>&nbsp;';
				}
				// ������ �������� �ٽ� ��û����.
				if( CUR_PAGE_SET[tbIdx] < pageSetCnt){
					pageString +=	'<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqLastPage('+tbIdx+','+pageSetCnt+');'+reqPageFnNm+'('+maxListCnt+', '+((pageSetCnt-1)*MAX_PAGE_SET[tbIdx]+1)+');" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next2.gif" width="16" height="15" align="absmiddle" alt="������">'
			        				+		'</a><font color="gray">&nbsp;&nbsp;[ ��ü : '+totCnt+' �� ]&nbsp;</font></td></tr></table>';
				}else{
					pageString +=	'<a href="#" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next2.gif" width="16" height="15" align="absmiddle" alt="������">'
			        				+		'</a><font color="gray">&nbsp;&nbsp;[ ��ü : '+totCnt+' �� ]&nbsp;</font></td></tr></table>';
				}
			  	try{
			        // ������ ���̺� ����.				
				  	//setHTML(pageDivNm, pageString) ;    
			  	}catch(ex){
			  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + pageDivNm);
			  		return ;
			  	}
			  	
		    }
		}else{
		    if(totCnt != null && maxListCnt != null && reqPageFnNm != null){	
		        pageString = '	<table width="100%" align="center" style="background-color:white">'
		        				+		  '<tr>'
		        				+			'<td>&nbsp;'
		        				+			'</td>'
		        				+		  '</tr>'
		        				+		'</table>';
		    
			  	try{
			        // ������ ���̺� ����.
			  		//setHTML(pageDivNm, pageString) ;    
			  	}catch(ex){
			  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + pageDivNm);
			  		return ;
			  	}
		  	}
		}
	}
    
	//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
   /* if(MEMORY_INIT){
		htmlString = null ;
		headString = null ;
		pageString = null ;
    }*/
	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	
	
  	//alert(htmlString+"\n\n"+pageString) ;
}
//����ο� ��뿩��.
var G_USED_DEF_HEADER = true ;
//������ : ����Ʈ.
function makeTable_div(jsonObj, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt, reqSortFnNm, totCnt, maxListCnt, reqPageFnNm, appendTrId, dtName)
{
	// �� ���̺��� ��ġ�� DIV �̸�. - JSP�� ���� �ؾ� ��.
	var divNm = tbNm+"_DIV" ;
	
	// �� ����� �ο� ���̺��� ���� ������ ���. ����� DIV �̸�. - JSP�� DIV ���� �ʼ�.
	if(!union) var headDivNm = tbNm+"_HEAD_DIV";			

	// �� ����¡ ���� : ����¡ ���̺��� ��ġ�� DIV �̸� - JSP�� DIV ���� �ʼ�.
	var pageDivNm = tbNm+"_PAGE_DIV";			

	// �� ���̺� �ο�  onClick �̺�Ʈ �Լ����� �ʼ�. - �Լ� ���� �ʼ�.
	var onClickFnNm = tbNm+"_ON_CLICK" ;

	// �� ���̺� �ο�  onDblClick �̺�Ʈ �Լ����� �ʼ�. - �Լ� ���� �ʼ�.
	var onDblClickFnNm = tbNm+"_ON_DBL_CLICK" ;

	// �� ���̺� �ο��� üũ�ڽ� ���ý� �̺�Ʈ. TB_TYPE �� 1�̸�(üũ�ڽ�) �Լ����� �ʼ�.
	var onCheckBoxFnNm = tbNm+"_CHECKED" ;

	// �� �ش� �Լ����� �ʼ�.[ ex) function  ���̺��_MAKE_ARR(i, viewCols, htmlString, jsonObj, divNm, tbIdx) ]
	var makeArrFnNm = tbNm+"_MAKE_ARR" ;
	
	// �� �׸��� �� ���� �۾��Լ� 
	var afterFnNm = tbNm+"_AFTER" ;


	// ������ �ο� TR ID
	var trNm =  tbNm+"_TR_ID" ;
	
	// ��� �÷� SPAN ID --> ���� �ﰢ�� ���� �κ�(���TD ���� SPAN).
	var thSpanNm = tbNm+"_TH_SPAN_ID" ;
	
	// ������ ������ TR ID.
	OLD_CLICK_ID[tbIdx] = 'new' ;
	OLD_OVER_ID[tbIdx] = 'new' ;
	OLD_SORT_TD_CLICK_ID[tbIdx] = 'new' ;
	
    // �÷� �̸� �迭 ����.
 	var colNmArr = colNmStr.split(",") ;
    // �÷� ������ �迭 ����.
    if(colSizeStr != null){
	 	var colSizeArr = colSizeStr.split(",") ;
    }
 	
	if(colNmArr.length < viewColCnt){
		alert("commonTable.js ==> ������ �÷� ����("+(viewColCnt)+")�� �÷��̸� ����("+colNmArr.length+")�� �ʰ��Ͽ����ϴ�.");
		return ;
	}
	
	var sortIdxArr = [] ;
    // ��ǥ ������ ���� �ε��� ����.
 	if(reqSortFnNm != null){
 		if(SELECTED_SORT_IDX_STR != null){
 			sortIdxArr = (SELECTED_SORT_IDX_STR.split(" ").join("")).split(",") ;
		} else {
			// ���� �ε��� �迭 �ڵ� ������. - ��ǥ���� �ε����� ����� ���� �ʱ� �����̴�.
			for(var i=0 ; i < colNmArr.length ; i++){
				sortIdxArr[i] = i+1 ; 
			}
		}
 	}
 	// ������ �÷� ��.
 	var viewCols = viewColCnt ;
 	// ������ ��.
 	var dataCnt = parseInt(jsonObj.listCnt,10);
		
 	// orderMark
 	var orderMark = "" ;
 	var curStyle = "" ;
 	var eventStr = "" ;

	// ���̺� ���۹�ȣ.
	if(maxListCnt == null){
	    var startNum = 1 ;
	}else{
	    var startNum = (maxListCnt*REQ_PAGE[tbIdx]+1)-maxListCnt ;
	}
	
	// ���̺�.
	var htmlString = '' ;
	
	// ���.
	var headString = '' ;

	
	if(isNull(appendTrId)){
		// ����� �ο츦 ��ģ ���.
		if(union){
		
			htmlString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1">'  ;
			htmlString+=	'<tr>'  ;
			
			// �߰� ����� ���� ��� �߰��Ѵ�.
			if(ADD_HEAD_COLS_HTML != null){
				htmlString += ADD_HEAD_COLS_HTML ;
			}
			ADD_HEAD_COLS_HTML = null ; // �ٷ� �ʱ�ȭ.
			
			if(G_USED_DEF_HEADER)
		    {
			for(i=0 ; i < viewCols ; i++){
				// ���� �÷�.
				if(reqSortFnNm != null){
					for(j=0 ; j < sortIdxArr.length ; j++){
						if(eval(sortIdxArr[j]) == i){
							if(SELECTED_SORT_IDX[tbIdx] == i){
								orderMark = getOrderMark(tbIdx) ;
							}else{
						        orderMark = "��"; 
							}
					        curStyle = "cursor:pointer" ;
			 				eventStr = 'javascript:SELECTED_SORT_IDX['+tbIdx+'] = '+i+' ; '+reqSortFnNm+'('+maxListCnt+', '+REQ_PAGE[tbIdx]+');' ;
					        break ;
						}else{
							orderMark = ""; 
			 				eventStr = "" ;
					        curStyle = "" ;
						}
					}
				}

				// �Ϲ� ��� �÷�.
				if(ADD_HEAD_TD_CLASS == null){
					// ��� �÷���.
				    htmlString += '<th class="colresize"  style="'+curStyle+'" width='+colSizeArr[i]+'>'+'<span onClick="'+eventStr+'">'+colNmArr[i]
							 		  //+ '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></span></th>' ;
				    					+ '</span></th>' ;
				// 2������ Ŭ���� ����.
				}else{
					// ��� �÷���.
				    htmlString += '<td '+ADD_HEAD_TD_CLASS+' onClick="'+eventStr+'" style="'+curStyle+'">'+colNmArr[i]
							 		  + '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></td>' ;
				}
		    }
			ADD_HEAD_TD_CLASS = null ; // �ٷ� �ʱ�ȭ.		 		  
			
		    htmlString += '</tr>' ;
		   
		    }
			// ��� ���̺� ��� ���� �ʱ�ȭ.
		    G_USED_DEF_HEADER = true ;
		    
		// ����� ���̺��� �и��� ���.    
		}else{
			headString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1" >';

			// �÷������ �ο����� ���.
			/*
			if(colSizeStr!=null){
				for(i=0 ; i < colSizeArr.length ; i++){
					headString += '<col width='+colSizeArr[i]+'>';
				}
			}
			*/
			headString+=	'<tr>'  ;
			
			// �߰� ����� ���� ��� �߰��Ѵ�.
			if(ADD_HEAD_COLS_HTML != null) htmlString += ADD_HEAD_COLS_HTML ;
			
			for(i=0 ; i < viewCols ; i++){
				// ���� �÷�.
				if(reqSortFnNm != null){
					for(j=0 ; j < sortIdxArr.length ; j++){
						if(eval(sortIdxArr[j]) == i){
							if(SELECTED_SORT_IDX[tbIdx] == i){
								orderMark = getOrderMark(tbIdx) ;
							}else{
						        orderMark = "��"; 
							}
					        curStyle = "cursor:pointer" ;
			 				eventStr = 'javascript:SELECTED_SORT_IDX['+tbIdx+'] = '+i+' ; '+reqSortFnNm+'('+maxListCnt+', '+REQ_PAGE[tbIdx]+');' ;
					        break ;
						}else{
							orderMark = ""; 
			 				eventStr = "" ;
						}
					}
				}
				// �Ϲ� ��� �÷�.
				if(ADD_HEAD_TD_CLASS == null){
					// ��� �÷���.
				    headString += '<th  class="colresize"  style="'+curStyle+'" width='+colSizeArr[i]+'>'+'<span onClick="'+eventStr+'">'+colNmArr[i]
							 		  + '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></span></th>' ;
				// 2������ Ŭ���� ����.
				}else{
					// ��� �÷���.
				    headString += '<td '+ADD_HEAD_TD_CLASS+' onClick="'+eventStr+'" style="'+curStyle+'">'+colNmArr[i]
							 		  + '<span id='+thSpanNm+(i+1)+'>'+orderMark+'</span></td>' ;
				}
		    }
		    headString += '</tr></table>' ; 
		    
		  	try{
			    // ��� ���̺� ����.
			    setHTML(headDivNm,headString) ;
		  	}catch(ex){
		  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + headDivNm);
		  		return ;
		  	}
		    
		    // �ο����̺� ����.
		    htmlString = '<table id="'+tbNm+'_TB" width="'+TB_WIDTH[tbIdx]+'" class="table01" cellspacing="1" >';
		    
		}		
	}

	if(dataCnt > 0){

		
		// ������ �ο�.
		for(i=0 ; i < dataCnt ; i++)
		{
			if(isNotNull(appendTrId))
			{
				var appendTrNm = trNm+(i+1) +"_"+ Number(appendTrId) ;
				var styleNm = "style='background-color:whitesmoke;cursor:pointer;'" ;	
				
				// �̹� ��ȸ �� ��� '����'ó�� �Ѵ�.
				if(isNotNull($("#"+appendTrNm).html())){
					$("#"+appendTrNm).remove() ;
					continue ;
				}
				
				htmlString += '<tr id="'+appendTrNm+'" '+styleNm + ' onmouseover="javascript:SELECTED_ROW_IDX['+tbIdx+'] = '+i+' ;rOver(this.id, '+i+', '+divNm+','+tbIdx+');" onmouseout="javascript:rOut(this.id,'+tbIdx+');"'
							+  ' onClick="javascript:changeClass(this.id, '+divNm+','+tbIdx+');tableClickEvent(\''+onClickFnNm+'\','+i+');" onDblClick="tableClickEvent(\''+onDblClickFnNm+'\','+i+');" style="cursor:pointer" >' ;
			
			}else{
				htmlString += '<tr id="'+trNm+(i+1)+'" onmouseover="javascript:SELECTED_ROW_IDX['+tbIdx+'] = '+i+' ;rOver(this.id, '+i+', '+divNm+','+tbIdx+');" onmouseout="javascript:rOut(this.id,'+tbIdx+');"'
							+  ' onClick="javascript:changeClass(this.id, '+divNm+','+tbIdx+');tableClickEvent(\''+onClickFnNm+'\','+(i+1)+');" onDblClick="tableClickEvent(\''+onDblClickFnNm+'\','+i+');" style="cursor:pointer" >' ;
			   
			}		
    	       	    
            // ù��° �÷� Ÿ���� ��ȣ���̸�.(����Ʈ)                
            if(TB_TYPE == 0){
	    	    htmlString += '<td width='+colSizeArr[0]+' align="center">'+(startNum+i)+'</td>';
            // ù��° �÷� Ÿ���� üũ�ڽ����̸�.
            }else if(TB_TYPE == 1){
            	
		    	if(isNull(appendTrId))
		    	{
		    		htmlString += '<td width='+colSizeArr[0]+' align="center"><input type="checkbox" name="'+tbNm+'_CB" value="checkbox" onClick="javascript:'+onCheckBoxFnNm+'(this);" onFocus="this.blur();" style="border:0"/></td>';
		    	}
		    	else
	    		{
		    		htmlString += '<td width='+colSizeArr[0]+' align="center">&nbsp;</td>';
	    		}
            }        
			try{
				
			// �迭 ����.-�����ȭ�鿡 �ش��Լ� �����ؾ���.(makeArr �Ʒ� ���� ���� ).
		    	htmlString = eval(makeArrFnNm+'(i, viewCols, htmlString, jsonObj, divNm, tbIdx, colSizeArr, appendTrId)');
		    	
			}catch(ex){
				if(i==0){
					alert("�Ʒ� �Լ��� �������� �ʰų� ������ �ֽ��ϴ�.\n\n ==> "+ makeArrFnNm+"(i, viewCols, htmlString, jsonObj, divNm, tbIdx)")
					return ;
				}
			}
	        htmlString += '</tr>' ;	 
    
       
	        var con = jsonObj[dtName][i].replace (/\n/g, "<br>");	       
	        	        
	        htmlString +='<tr style="display:none" id="'+trNm+(i+1)+'_DT"><td style="text-align:left;padding-left:10px;padding-right:10px;"><img src="/common/images/customer/A.gif"></td><td colspan="'+viewCols+'" style="text-align:left;padding-left:10px;;padding-right:10px;"><font color="#920000">'+con+'</font></td></tr>';
	        
        }
        
  	}else{
  		
		if(isNotNull(appendTrId))
		{
			var appendTrNm = trNm+(0) +"_"+ Number(appendTrId) ;
			
			// �̹� ��ȸ �� ��� '����'ó�� �Ѵ�.
			if(isNotNull($("#"+appendTrNm).html())){
				$("#"+appendTrNm).remove() ;
			}else{
				htmlString +=  '<tr id="'+appendTrNm+'"><td colspan='+viewCols+' align="center"><font color=gray>��ȸ�� ����� �����ϴ�.</font></td></tr>' ;
			}			
		}else{
			htmlString +=  '<tr><td colspan='+viewCols+' align="center"><font color=gray>��ȸ�� ����� �����ϴ�.</font></td></tr>' ;
		}
  	}
		  	
  	
  	try{
  		if(isNull(appendTrId)){
  			
  			htmlString += '</table>' ;
  			
  			// ���̺� ����.
  			setHTML(divNm, htmlString) ;    
  			
  		}else{

  			// �߰��Ѵ�.
  			$("#"+trNm + (Number(appendTrId)+1)).append(htmlString) ;
			//$(htmlString).hide().appendTo($("#"+trNm + (Number(appendTrId)+1))).slideDown("slow") ; 
  			
  		}
        tableClickEvent(afterFnNm);
  	}catch(ex){
  		alert(ex.description);
  		return ;
  	}
  	
	if(isNull(appendTrId))
	{
	
		// ����¡ ���̺�.
		var pageString = '' ;
		
		if(dataCnt > 0){
		    if(totCnt != null && maxListCnt != null && reqPageFnNm != null){
		        pageString += '	<table border="0" width="100%" height="21" align="center" style="background-color:white">'
		        				+		'<col width="45px"><col width="40px"><col width="%"><col width="40px">'
		        				+		  '<tr><td height="5"></td></tr><tr align="center">'
		        				+			'<td>' ;
		        				
				// ���� �������� �ٽ� ��û ����.
		        if( CUR_PAGE_SET[tbIdx] > 1){				
				    pageString +=	  	  '<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqFirstPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+1+'); " onFocus=this.blur();>'
			        				+			    '<img src="/common/images/common/bod_btn_prev2.gif" width="16" height="15" style="margin-right:5px" align="absmiddle" alt="ó��">'
			        				+			  '</a>';
				}else{
				    pageString +=	  	  '<a href="#" onFocus=this.blur();>'
			        				+			    '<img src="/common/images/common/bod_btn_prev2.gif" width="16" height="15" style="margin-right:5px" align="absmiddle" alt="ó��">'
			        				+			  '</a>';
				}
				// ù��° �������� ���� ���� ������.
		        if( CUR_PAGE_SET[tbIdx] > 1){				
			        pageString += 		  '<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqPrevPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+((CUR_PAGE_SET[tbIdx]-2)*MAX_PAGE_SET[tbIdx]+1)+'); "  onFocus=this.blur();>'
			        				+				'<img src="/common/images/common/bod_btn_prev.gif" width="16" height="15" align="absmiddle" style="margin-right:5px" alt="����">'
			        				+			  '</a>&nbsp;';
			    }else{
			        pageString += 		  '<a href="#" onFocus=this.blur();>'
			        				+				'<img src="/common/images/common/bod_btn_prev.gif" width="16" height="15" align="absmiddle" style="margin-right:5px" alt="����">'
			        				+			  '</a>&nbsp;';
			    }
	
				// �� ������ ��.
				var pageCnt = fnFixNum((totCnt/maxListCnt), 3) ;
				if(totCnt%maxListCnt == 0) --pageCnt ;
	
				// ������ �� ����.
				var pageSetCnt = fnFixNum((pageCnt/MAX_PAGE_SET[tbIdx]), 3) ;
	
				if(pageCnt%MAX_PAGE_SET == 0) --pageSetCnt ;
				
				//alert(pageSetCnt)
				
				// �̵��� ������ �� ���۹�ȣ.
				var goPageSetNo = (CUR_PAGE_SET[tbIdx]-1)*MAX_PAGE_SET[tbIdx]+1 ;
				//REQ_PAGE[tbIdx] = goPageSetNo ;
	
				// ������ ����
				CUR_PAGE[tbIdx] = pageCnt;

				for(i=0 ; i<CUR_PAGE[tbIdx]; i++){
				
					// �� ȭ�鿡 ������ ������ ������ �����ְ� �������� �����.
			        if(i >= (goPageSetNo-1) && i < (goPageSetNo-1)+MAX_PAGE_SET[tbIdx]){
			        
						// �� �������� ��û �������� ������. �ٽ� ��û ����.
						if( REQ_PAGE[tbIdx] != (i+1)){
					        pageString +=	'<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');REQ_PAGE['+tbIdx+']='+(i+1)+';'+reqPageFnNm+'('+maxListCnt+', '+(i+1)+'); " onFocus=this.blur();>';
						}else{
					        pageString +=	'<a href="#" onFocus=this.blur();>';
						}				
				        // ���� ������ ����.
				        if(REQ_PAGE[tbIdx] == (i+1)){
					        pageString +=		'<font color="#0876D0"><span id= pageSpan'+(i+1)+'>['+(i+1)+']</span></font></a>';
				        }else{
					        pageString +=		'<span id= pageSpan'+(i+1)+'>['+(i+1)+']</span></a>';
				        }
				        
			        }else{
			        }
				}	        				
				
				// ������ �������� ���� ���� ������.																																											
				if( CUR_PAGE_SET[tbIdx] < pageSetCnt ){
					pageString +=	'&nbsp;<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqNextPage('+tbIdx+');'+reqPageFnNm+'('+maxListCnt+', '+(CUR_PAGE_SET[tbIdx]*MAX_PAGE_SET[tbIdx]+1)+'); " onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next.gif" width="16" height="15" align="absmiddle" style="margin-left:5px" alt="����">'
			        				+		'</a>&nbsp;';			        
				}else{
			        pageString +=	'<a href="#" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next.gif" width="16" height="15" align="absmiddle" style="margin-left:5px" alt="����">'
			        				+		'</a>&nbsp;';
				}
				// ������ �������� �ٽ� ��û����.
				if( CUR_PAGE_SET[tbIdx] < pageSetCnt){
					pageString +=	'<a href="#" onClick="javascript:reverseAscDesc('+tbIdx+');reqLastPage('+tbIdx+','+pageSetCnt+');'+reqPageFnNm+'('+maxListCnt+', '+((pageSetCnt-1)*MAX_PAGE_SET[tbIdx]+1)+');" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next2.gif" width="16" height="15" align="absmiddle" alt="������">'
			        				+		'</a><font color="gray">&nbsp;&nbsp;[ ��ü : '+totCnt+' �� ]&nbsp;</font></td></tr></table>';
				}else{
					pageString +=	'<a href="#" onFocus=this.blur();>'
			        				+			'<img src="/common/images/common/bod_btn_next2.gif" width="16" height="15" align="absmiddle" alt="������">'
			        				+		'</a><font color="gray">&nbsp;&nbsp;[ ��ü : '+totCnt+' �� ]&nbsp;</font></td></tr></table>';
				}
				
				
				
				
				
				
				//alert(pageString);
		        /*
				pageString = '<ul class="pagination"><li><a role="button" rel="prev more"><<</a></li><li><a role="button" rel="prev"><</a></li>'   
		        	pageString += '<li>                 <a role="button">1</a>                </li>                <li>                  <a role="button">2</a>                </li>'
		        		pageString +='               <li>                  <a role="button">3</a>                </li>                <li>                  <a role="button" rel="next">></a>            </li>'
		        			pageString +='                <li>                  <a role="button" rel="next more">>></a>                </li>              </ul>';
				*/
			  	try{
			        // ������ ���̺� ����.				
				  	//setHTML(pageDivNm, pageString) ;
			  	}catch(ex){
			  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + pageDivNm);
			  		return ;
			  	}
			  	
		    }
		}else{
		    if(totCnt != null && maxListCnt != null && reqPageFnNm != null){	
		        pageString = '	<table width="100%" align="center" style="background-color:white">'
		        				+		  '<tr>'
		        				+			'<td>&nbsp;'
		        				+			'</td>'
		        				+		  '</tr>'
		        				+		'</table>';
		    
			  	try{
			        // ������ ���̺� ����.				
				  	setHTML(pageDivNm, pageString) ;    
			  	}catch(ex){
			  		alert("JSP �������� �ش� ID�� �������� �ʽ��ϴ�. ==> " + pageDivNm);
			  		return ;
			  	}
		  	}
		}
	}
    
	//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
    /*if(MEMORY_INIT){
		htmlString = null ;
		headString = null ;
		pageString = null ;
    }*/
	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	
	
  	//alert(htmlString+"\n\n"+pageString) ;
}

//����¡ ���� �Լ�
function reqPrevPage(tbIdx){
	REQ_PAGE[tbIdx]=((CUR_PAGE_SET[tbIdx]-2)*MAX_PAGE_SET[tbIdx]+1); 
	--CUR_PAGE_SET[tbIdx];
}

function reqFirstPage(tbIdx){
	REQ_PAGE[tbIdx]=1; 
	CUR_PAGE_SET[tbIdx]=1;
}

function reqNextPage(tbIdx){
	REQ_PAGE[tbIdx]=(CUR_PAGE_SET[tbIdx]*MAX_PAGE_SET[tbIdx]+1); 
	++CUR_PAGE_SET[tbIdx];
}

function reqLastPage(tbIdx,pageSetCnt){
	REQ_PAGE[tbIdx]=((pageSetCnt-1)*MAX_PAGE_SET[tbIdx]+1);  
	CUR_PAGE_SET[tbIdx]=(pageSetCnt);
}


function tableClickEvent(fnName,i)
{
     try
    {
        if (i != null) 
        {
            eval(fnName + "('" + i + "')");
        }
        else
        {
            eval(fnName+"()")
        }
    }
    catch (e)
    {
    }
}

/*========================================================= *
 * Request    Function Name : 	getOrderSql/getAndSql					*
 * Description   : 	Order By SQL ���� ���� 										*
 *========================================================= */
function getOrderSql(colNmStr, index, tbIdx)
{
	if(index < 1) return '';
	
	index = eval(index-1) ;
	
	var colNmArr = colNmStr.split(",") ;
	
	if(ASCDESC[tbIdx] == 'ASC'){
		ASCDESC[tbIdx] = 'DESC' ;
	}else{
		ASCDESC[tbIdx] = 'ASC' ;
	}
//	return " order by " +colNmArr[index] + " "+ ASCDESC[tbIdx] ;
   //var orderByParam = "orderByColumn=" + colNmArr[index] +"&orderBy="+ASCDESC[tbIdx];
	return "orderBySql=" +colNmArr[index] + " "+ ASCDESC[tbIdx] ;
}

function getStartOderBySql(startCol, orderBy)
{
   // orderBy = orderBy == null ? "ASC" : orderBy;
    return "orderBySql=" + startCol ;    
} 



function getAndSql(colNm, val)
{
	return " and " +colNm + "="+ val ;
}

 /*========================================================= *
 * Request Function Name : getSelectedHeadIndex()						*
 * Request Parametes						 :	 											*
 * Description   : 	������ �÷� �ε����� ��ȯ.										*
 *========================================================= */
function getSortIndex(idxStr, tbIdx)
{
	// ���� ��û �Լ����� ��Ƶΰ� ���̺� ��ũ��Ʈ ���� �� �� �����Ѵ�.
	SELECTED_SORT_IDX_STR = idxStr ;
	
	return SELECTED_SORT_IDX[tbIdx] ;
	
}

 /*========================================================= *
 * Request Function Name : reverseAscDesc									*
 * Request Parametes						 :	 											*
 * Description   : 	ASC/DESC ��Ʈ��													*
 *========================================================= */
function reverseAscDesc(tbIdx)
{
	try{
		if(ASCDESC[tbIdx] == 'ASC'){
		    ASCDESC[tbIdx] = 'DESC' ;
		}else{
		    ASCDESC[tbIdx] = 'ASC' ;
		}
	}catch(ex){
		alert("reverseAscDesc(); --> "+ex) ;
	}
}

 /*========================================================= *
 * Request Function Name : getOrderMark()										*
 * Request Parametes						 :	 											*
 * Description   : 	Ư�� �ؽ�Ʈ ��ȯ.													*
 *========================================================= */
function getOrderMark(tbIdx)
{
	if(ASCDESC[tbIdx] != null){
		if(ASCDESC[tbIdx] == 'ASC'){
		    return '��' ;
		}else{
		    return '��' ;
		}
	}else{
        return "��"; 
	}
}

 /*========================================================= *
 * Request Function Name : rOverAndOut											*
 * Request Function Name : changeClass											*
 * Request Parametes						 :	 											*
 * Description   : 	���̺� TR �ѿ���/�ƿ�/Ŭ�� ���� ����.					*
 *========================================================= */
function rOver(id, rowindex, divNm, tbIdx)
{
	try{
		if(id!=OLD_CLICK_ID[tbIdx]){
			// TR �� �ѿ����� ���� �÷� TD �� ������.
			if(SELECTED_SORT_IDX[tbIdx] != null && SELECTED_ROW_IDX[tbIdx] != null){
				var sortId = divNm.id+'_sort'+SELECTED_ROW_IDX[tbIdx]+'Td'+(SELECTED_SORT_IDX[tbIdx]-1) ;
				document.getElementById(sortId).style.backgroundColor = '' ;
				OLD_SORT_TD_ID[tbIdx] = sortId ;
				
			}
			document.getElementById(id).className = 'trhover' ;
			OLD_OVER_ID[tbIdx] = id ;
		}
	}catch(ex){
		//alert("rOver() ==> " + ex);
	}
}
function rOut(id, tbIdx)
{
	try{
		if(OLD_OVER_ID[tbIdx]!='new'){
			document.getElementById(OLD_OVER_ID[tbIdx]).className = '' ;
		}
		// TR �� �ѿ����� ���� �÷� TD �� ������.
		if(OLD_SORT_TD_ID[tbIdx]!='new'){
			document.getElementById(OLD_SORT_TD_ID[tbIdx]).style.backgroundColor = '#F5F5FA' ;
		}
	}catch(ex){
		//alert("rOut() ==> " + ex);
	}
}
function changeClass(id, divNm, tbIdx)
{
	try{
		if(id!=OLD_CLICK_ID[tbIdx]){
			OLD_OVER_ID[tbIdx] = 'new' ;
			
			document.getElementById(id).className = 'tractive' ;
			
			if(OLD_CLICK_ID[tbIdx] != 'new'){
				document.getElementById(OLD_CLICK_ID[tbIdx]).className = '' ;
			}
			OLD_CLICK_ID[tbIdx] = id ;
			
			// TR �� �ѿ����� ���� �÷� TD �� ������.
			if(SELECTED_SORT_IDX[tbIdx] != null && SELECTED_ROW_IDX[tbIdx] != null){
				var clossId = divNm.id+'_sort'+SELECTED_ROW_IDX[tbIdx]+'Td'+(SELECTED_SORT_IDX[tbIdx]-1) ;
				document.getElementById(clossId).style.backgroundColor = '' ;
				NEW_SORT_TD_CLICK_ID[tbIdx] = clossId ;
			}
			if(NEW_SORT_TD_CLICK_ID[tbIdx] != 'new'){
				document.getElementById(NEW_SORT_TD_CLICK_ID[tbIdx]).style.backgroundColor = SORT_TD_CLICK_COLOR ;
			}
			if(OLD_SORT_TD_CLICK_ID[tbIdx]!='new'){
				document.getElementById(OLD_SORT_TD_CLICK_ID[tbIdx]).style.backgroundColor = SORT_TD_OVER_COLOR ;
			}
			
			OLD_SORT_TD_CLICK_ID[tbIdx] = NEW_SORT_TD_CLICK_ID[tbIdx] ;
			OLD_SORT_TD_ID[tbIdx] = 'new' ;
		}
	}catch(ex){
		//alert("changeClass() ==> " + ex);
	}
}

/*========================================================= *
 * Request    Function Name : 	initTargetTable									*
 * Description   : 	Ư�� ���̺� ���� �ʱ�ȭ.										*
 *========================================================= */
 // tbIdx : ���̺� �ε���.
function initTargetTable(tbIdx)
{
	// ���� Ŭ���� TR ID.
	OLD_CLICK_ID[tbIdx] = "new" ;
	// ���� Ŭ���� ��Ʈ TD ID.
	NEW_SORT_TD_CLICK_ID[tbIdx] = "new" ;
	// ���� Ŭ���� ��Ʈ TD ID.
	OLD_SORT_TD_CLICK_ID[tbIdx] = "new" ;
	
	// ASC/DESC String
	ASCDESC[tbIdx] = null ;
	 
	 // ���� �ѿ��� TR ID.
	OLD_OVER_ID[tbIdx] = "new" ;  
	 // ���� �ѿ��� TD ID.
	OLD_SORT_TD_ID[tbIdx] = "new" ;
	
	// ���õ� �ο� �ε��� 
	SELECTED_ROW_IDX[tbIdx] = null ;
	// ���õ� ��Ʈ �÷� �ε���  
	SELECTED_SORT_IDX[tbIdx] = null ;

	// ��û �� ������.
	REQ_PAGE[tbIdx] = 1 ;
	// ���� ������.
	CUR_PAGE[tbIdx] = 0 ;
	
	// ��ǥ���� ��Ʈ �÷� �ε���.
	SELECTED_SORT_IDX_STR = null ;

	// ���̺� WIDTH SIZE.
	TB_WIDTH[tbIdx] = '100%' ;		
	
	// ���������� ������ MAX ������ ��.
	MAX_PAGE_SET[tbIdx] = 10 ;
	// ���� ������ ��.
	CUR_PAGE_SET[tbIdx] = 1 ;
	
}

 /*========================================================= *
 * Request Function Name : 	initTable											*
 * Description   : 	���̺� ������ ���� ���̺� ���� �迭 ���. -������ ���� ȣ��� *
 *========================================================= */
 // tbCnt : ���̺� ����.
function initTable(tbCnt)
{
	for(i=0 ; i < tbCnt ; i++){
		// ���� Ŭ���� TR ID.
		OLD_CLICK_ID[i] = "new" ;
		// ���� Ŭ���� ��Ʈ TD ID.
		NEW_SORT_TD_CLICK_ID[i] = "new" ;
		// ���� Ŭ���� ��Ʈ TD ID.
		OLD_SORT_TD_CLICK_ID[i] = "new" ;
		
		// ASC/DESC String
		ASCDESC[i] = null ;
		 
		 // ���� �ѿ��� TR ID.
		OLD_OVER_ID[i] = "new" ;
		 // ���� �ѿ��� TD ID.
		OLD_SORT_TD_ID[i] = "new" ;
		
		// ���õ� �ο� �ε��� 
		SELECTED_ROW_IDX[i] = null ;
		// ���õ� ��Ʈ �÷� �ε���  
		SELECTED_SORT_IDX[i] = null ;

		// ��û �� ������.
		REQ_PAGE[i] = 1 ;

		// ���� ������.
		CUR_PAGE[i] = 0 ;
		
		// ���̺� WIDTH SIZE.
		TB_WIDTH[i] = '100%' ;		
		
		// ���������� ������ MAX ������ ��.
		MAX_PAGE_SET[i] = 10 ;
		// ���� ������ ��.
		CUR_PAGE_SET[i] = 1 ;		
	}
	// ��ǥ���� ��Ʈ �÷� �ε���.
	SELECTED_SORT_IDX_STR = null ;
}


/*========================================================= *
 * Request    Function Name : 	fnFixNum											*
 * Request    params : 	strValue - ó���� , strType - �Ҽ��� ���. 0:����, 1:�ݿø�, 2:�ø�, 3:����+1*
 * Description   : 	�Ҽ��� ó�� �� ��ȯ.												*
 *========================================================= */
function fnFixNum( strValue, strType) 
{
    var iType =  parseInt( strType );
    switch ( iType ) 
    {
        case 0 :  // ����
                return( parseInt( strValue ) );
                break;

        case 1 :  // �ݿø�
                if( strValue< 0 ){  //������ ���
                
                    if( ( Math.abs( strValue ) + 0.5 ) 
                         - ( parseInt( Math.abs( strValue ) + 0.5 ) ) == 0 ){
                          return ( ( parseInt( Math.abs( strValue ) + 0.5 ) * -1 ) +1 );
                    } 
                    else 
                    {
                          return ( parseInt( Math.abs( strValue ) + 0.5 ) * -1 );
                    }

                } else { //��� �� ���
                     return ( parseInt( strValue + 0.5 ) )
                }
                break;

        case 2 : //�ø�
                if( ( value - parseInt( strValue ) ) >= 0.1 ) {
                     return ( parseInt( strValue ) +1 );
                }
                if( ( value - parseInt( strValue ) ) <= -0.1 ){
                     return ( parseInt( strValue ) -1 ) ;
                }
        case 3 :  // ���� + 1
                return( parseInt( strValue ) +1 );
                break;

        }
}
 /*========================================================= *
 * Request    Function Name : 	setHTML											*
 * Description   : 	���̵� ã�� ���� �ִ´�. (innerHTML)				*
 *========================================================= */
/*function setHTML(id, html)
{
	try{
	 	document.getElementById(id).innerHTML = html ;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
	
    //-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
    if(MEMORY_INIT){
		id = null ;
		html = null ;
    }
  	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	  	
}*/
 /*========================================================= *
 * Request    Function Name : 	setTdText											*
 * Description   : 	TD Text ����.														*
 *========================================================= */
function setTdText(id)
{
	try{
	 	document.getElementById(id).innerText ;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}

 /*========================================================= *
 * Request    Function Name : 	getTdText											*
 * Description   : 	TD outerText ��ȯ.												*
 *========================================================= */
function getTdText(id)
{
	try{
	 	return document.getElementById(id).outerText ;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}

 /*========================================================= *
 * Request    Function Name : 	getTdText											*
 * Description   : 	TD outerText ��ȯ.												*
 *========================================================= */
function getHTML(id)
{
	try{
	 	return document.getElementById(id).outerHTML;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}

  /*========================================================= *
 * Request    Function Name : 	setValue											*
 * Description   : 	���̵� ã�� ���� �ִ´�. (value)							*
 *========================================================= */
function setValue(id, val)
{
	if(val == null) val='' ;
	try{
	 	document.getElementById(id).value = val ;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}
 /*========================================================= *
 * Request    Function Name : 	getValue											*
 * Description   : 	���̵� ã�� ���� ��ȯ�Ѵ�. (value)						*
 *========================================================= */
function getValue(id)
{
	try{
	 	return (document.getElementById(id).value) ;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}
 /*========================================================= *
 * Request    Function Name : 	getDateToValue								*
 * Description   : 	���̵� ã�� ���� ��ȯ�Ѵ�. ��¥���Ŀ��� (-) ����.*
 *========================================================= */
function getDateToValue(id)
{
	try{
	 	return ((document.getElementById(id).value).replaceAll(' ','')).replaceAll('-','');
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}
  /*========================================================= *
 * Request    Function Name : 	getText												*
 * Description   : 	���̵� ã�� ���� ��ȯ�Ѵ�. (value)						*
 *========================================================= */
function getText(id)
{
	try{
	 	return document.getElementById(id).text;
	}catch(ex){
		alert("JSP �������� ���� ���̵� �������� �ʽ��ϴ�. ==> "+ id)
	}
}
 /*========================================================= *
 * Request    Function Name : 	setRidio											*
 * Description   : 	������ư ����.			 										*
 *========================================================= */
function setRadio(id, idx, bool)
{
 	var obj = eval('document.all.'+id) ;
 	obj[idx].checked = bool ;
}
 /*========================================================= *
 * Request    Function Name : 	setRidio											*
 * Description   : 	������ư Y/N ��ȯ.			 									*
 *========================================================= */
function getYnValue(id)
{
 	var obj = eval('document.all.'+id) ;
 	
	if(obj[0].checked == true){
		return 'Y' ;
	}else if(obj[1].checked == true){
		return 'N' ;
	}else{
		return null ;
	}	
}

 /*========================================================= *
 * Request    Function Name : 	getCheckValue									*
 * Description   : 	üũ�ڽ� ���� �� ��ǥ�������� ��ȯ.						*
 *========================================================= */
function getCheckValue(id)
{
	var rtnValue = '' ;
 	var obj = eval('document.all.'+id) ;
 	
 	if(obj != null)
 	{
 		if(isNotNull(obj.length))
 		{
 			for(var i=0 ; i < obj.length ; i++)
 			{
 				if(rtnValue==''){
 					if(obj[i].checked == true){
 						rtnValue += (i) ;
 					}
 				}else{
 					if(obj[i].checked == true){
 						rtnValue += ',' + (i) ;
 					}
 				}
 			}
 		} else {
 			if(obj.checked == true){
 				rtnValue = '0' ;
 			}
 		}
 	}
// 	alert(rtnValue)
// 	alert('id = ' + id)
// 	alert('length = ' + obj.length)
// 	alert('rtnValue = ' + rtnValue)
 	
 	return rtnValue ;
}
 /*========================================================= *
 * Request    Function Name : 	getCheckValue2								*
 * Description   : 	üũ�ڽ� ���� �� ��ǥ�������� ��ȯ. - ������ ������� *
 *========================================================= */
function getCheckValue2(id, checkbox_index, textField)
{
	var rtnValue = '' ;
 	var obj = eval('document.all.'+id) ;
 	
 	// üũ�ϸ�.
	if(obj[checkbox_index].checked == true){
		// ó�� �̸� ��ǥ ����.
		if(getValue(textField).length < 1){
			rtnValue = checkbox_index + 1 ;
			
		}else{
	 		rtnValue = getValue(textField) + ',' + (checkbox_index + 1) ;
		}
 	// üũ Ǯ��.
	}else{
		// ó���̸�.
		if(getValue(textField).indexOf((checkbox_index + 1)) == 0 ){
			if (getValue(textField).length == 1) {
				rtnValue = getValue(textField).replaceAll( (checkbox_index + 1) , '') ;
			}else{
				rtnValue = getValue(textField).replaceAll( (checkbox_index + 1) + ',' , '') ;
			}
		}else {
			rtnValue = getValue(textField).replaceAll( ','+(checkbox_index + 1) , '') ;
		}
	}
 	return rtnValue ;
}
 /*========================================================= *
 * Request    Function Name : 	setRidio											*
 * Description   : 	������ư�׷�/üũ�ڽ��׷� ���� �ʱ�ȭ.				*
 *========================================================= */
function radioCheckInit(id)
{
 	var obj = eval('document.all.'+id) ;
 	
 	for(var i=0 ; i < obj.length ; i++ ){
		obj[i].checked = false ;
 	}
 	
}
  /*========================================================= *
 * Request    Function Name : 	clear												*
 * Description   : 	�ʵ� Clear						 										*
 *========================================================= */
function clear(id)
{
 	document.getElementById(id).value = '' ;
}
  /*========================================================= *
 * Request    Function Name : 	clear												*
 * Description   : 	�ʵ� Focus �̵�.			 										*
 *========================================================= */
function focus(id)
{
	if(document.getElementById(id) != null){
	 	document.getElementById(id).focus() ;
	}
}
  /*========================================================= *
 * Request    Function Name : 	setEnable											*
 * Description   : 	Ȱ��/��Ȱ��.			 												*
 *========================================================= */
function setEnable(id, bool)
{
 	var obj = eval('document.all.'+id) ;
 	obj.disabled  = bool ;
}

  /*========================================================= *
 * Request    Function Name : 	setBgColor										*
 * Description   : 	TD ���� ��׶��� �÷��� �����Ѵ�.						*
 *========================================================= */
function setBgColor(id, color)
{
 	var obj = eval('document.all.'+id) ;
 	obj.style.backgroundColor = color ;
}

  /*========================================================= *
 * Request    Function Name : 	view, hide											*
 * Description   : 	�ش翵���� ���ϱ�� 											*
 *========================================================= */
function view(id){
	document.getElementById(id).style.display = "block" ;
}
function hide(id){
	document.getElementById(id).style.display = "none" ;
}

/*========================================================= *
* Request    Function Name : 	handlerNum										*
* Description   : 	���ڸ� �Է� �ްԲ� �ϴ� �Լ�.								*
*========================================================= */
function handlerNum( obj )
{
  e = window.event; //�������� event�� ���.
  
  //�Է� ��� Ű
  if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||   //���ڿ� 0 ~ 9 : 48 ~ 57
      ( e.keyCode >=  96 && e.keyCode <= 105 ) ||   //Ű�е� 0 ~ 9 : 96 ~ 105
        e.keyCode ==   8 ||    //BackSpace
        e.keyCode ==  46 ||    //Delete
        //e.keyCode == 110 ||    //�Ҽ���(.) : ����Ű�迭
        //e.keyCode == 190 ||    //�Ҽ���(.) : Ű�е�
        e.keyCode ==  37 ||    //�� ȭ��ǥ
        e.keyCode ==  39 ||    //�� ȭ��ǥ
        e.keyCode ==  35 ||    //End Ű
        e.keyCode ==  36 ||    //Home Ű
        e.keyCode ==   9       //Tab Ű
    ) {
  
    if(e.keyCode == 48 || e.keyCode == 96) { //0�� ���������
      if ( obj.value == "" || obj.value == '0' ) //�ƹ��͵� ���ų� ���� ���� 0�� ��쿡�� 0�� ���������
        e.returnValue=false; //-->�Էµ����ʴ´�.
      else //�ٸ����ڵڿ����� 0��
        return; //-->�Է½�Ų��.
      }

    else //0�� �ƴѼ���
      return; //-->�Է½�Ų��.
    }
    else //���ڰ� �ƴϸ� ������ ����.
 {
  //alert('���ڸ� �Է°����մϴ�');
  e.returnValue=false;
 }
}

/*========================================================= *
* Request    Function Name : 	setTableType									*
* Description   : ù��°�÷��� Ÿ��  0 - ��ȣ. 1 - üũ�ڽ�. (����Ʈ-0)*
*========================================================= */
var TB_TYPE = 0 ;
function setTableType(gubun)
{
	TB_TYPE = gubun ;
}

/*========================================================= *
* Request    Function Name : 	setTableWidth									*
* Description   : ���̺� WIDTH ����Ʈ-100%										*
*========================================================= */
function setTableWidth(width, tbIdx)
{
	TB_WIDTH[tbIdx] = width ;
}

/*========================================================= *
* Request    Function Name : 	setTableWidth									*
* Description   : 2�� ����� ��� �߰�.												*
*========================================================= */
function setAddHeadHtml(addHeadHtml)
{
	ADD_HEAD_COLS_HTML = addHeadHtml ;	
	ADD_HEAD_TD_CLASS = ' class=ti ' ;
}

/*========================================================= *
* Request    Function Name : 	msgposit_list									*
* Description   : ǳ�����򸻰��� 														*
*========================================================= */
// leftGap :  DIV ��ġ ������.
// topGap :  DIV ��ġ ������.
// evt		:  Netscape �� �Ķ����.
/* 
function msgposit_list(leftGap, topGap, evt)
{
    if(navigator.appName == "Netscape"){ //browser�� Netscape���
	    //pageX, pageY: ���� ��ü�� ũ�⸦ �������� �̺�Ʈ�� �߻��� ��ġ����
	    helpbox.style.left  = evt.pageX + leftGap;	//left: ȭ���� ���������� �������� ������ �Ÿ� --> helpbox�� ��ġ����
	    helpbox.style.top = evt.pageY + topGap;
    } else {
    	//posLeft: left ��Ʈ����Ʈ�� ������ ��ü�� ���� ��ġ�� ��Ÿ���� �ε��Ҽ�����ġ���̴�
    	//scrollLeft: ��ü�� ���� ������ ������ ���̴� ���� �������� �Ÿ��� ��ȯ
  		//event.x: �̺�Ʈ�� �߻��� �������� x ���� �Ÿ�
   		helpbox.style.posLeft  = event.x + leftGap + document.body.scrollLeft;
   		helpbox.style.posTop  = event.y + topGap + document.body.scrollTop;
  	}
}
 */
 
 // ���� LeftGap �缳���� ���� ���� ������������ ������(220px) - ������ on/off�� ���� �����Ѵ�.
var LEFT_SPLIT_SIZE = 0 ;
/* 
function msgposit_list(leftGap, topGap, obj)
{
//alert('Left : '+document.body.scrollLeft + ', Top :  '+ document.body.scrollTop)

    if(navigator.appName == "Netscape"){ //browser�� Netscape���
	    //pageX, pageY: ���� ��ü�� ũ�⸦ �������� �̺�Ʈ�� �߻��� ��ġ����
	    helpbox.style.left  = evt.pageX + leftGap;	//left: ȭ���� ���������� �������� ������ �Ÿ� --> helpbox�� ��ġ����
	    helpbox.style.top = evt.pageY + topGap;
    } else {
    	//posLeft: left ��Ʈ����Ʈ�� ������ ��ü�� ���� ��ġ�� ��Ÿ���� �ε��Ҽ�����ġ���̴�
    	//scrollLeft: ��ü�� ���� ������ ������ ���̴� ���� �������� �Ÿ��� ��ȯ
  		//event.x: �̺�Ʈ�� �߻��� �������� x ���� �Ÿ�
  		
  		// ���� ���������� SPLIT PANE�� ���� ��ü�� ����/�� �ȴٸ� �������� �̺�Ʈ ȣ���(����/��) ������ �־���Ѵ�. 
  		if(LEFT_SPLIT_SIZE == null) LEFT_SPLIT_SIZE = 0 ;
  		
  		if(obj != null){ // �ش� ��ü(��ü)�� ��ũ�ѷκ��� ���̸� ����.
	   		helpbox.style.posLeft  = event.x + leftGap + obj.scrollLeft - LEFT_SPLIT_SIZE;
	   		helpbox.style.posTop  = event.y + topGap + obj.scrollTop ;
  		}else{ // body ��� ��ũ�ѷκ��� ���̸� ����.
	   		helpbox.style.posLeft  = event.x + leftGap + document.body.scrollLeft  - LEFT_SPLIT_SIZE;
	   		helpbox.style.posTop  = event.y + topGap + document.body.scrollTop;
  		}
  	}
}
*/
//���̺� ����.
function msgset_list(title, text)
{
  	var htmlString ;
  	
  	// ���� �̹��� ������.
  	var img = '<img src=/common/images/common/icon_ti_orange.gif width=5 height=8>&nbsp;&nbsp;'
  	
  	// ����� ������ ������.
  	var gubunja = ' : ' ;
  	
  	// Bold ó��.
  	text = '<b>'+text+'</b>' ;
  	
  	// TD Width
  	var tdWidth = '100%' ;
  	
  	// text ����� maxLen ���� ũ�� 200px�� ������Ű��.
  	var maxLen = 12 ;
  	
  	if(text.length > maxLen){
  		tdWidth = '200px' ;
  	}else{
  		tdWidth = '100%' ;
  	}
  	
// JS ���� ó���ϹǷ� �ּ�ó����.  	
//	if(((str.replaceAll(' ','')).replaceAll('-','')).replaceAll('~','') != ''){ // '����','-','~'�� ��� �����ϰ�.
	  	htmlString  ='<table align="center" border="0" cellpadding="10" cellspacing="0" style="border-width:'+TOOLTIP_BORDER_WIDTH+'; border-color:'+TOOLTIP_BORDER_COLOR+'; background-color:'+TOOLTIP_BG_COLOR+'; border-style:solid;font-size:9pt;">';
	  	htmlString += '<tr><td width='+tdWidth+' align=left>'+ img + title + gubunja + text + '</td></tr></table>';
	  	helpbox.innerHTML=htmlString ;
//	}
	  	
    //-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
   /* if(MEMORY_INIT){
		htmlString = null ;
		img = null ;
		gubunja = null ;
		tdWidth = null ;
		maxLen = null ;
    }*/
  	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	  	
	  	
}
//���̺� ����.
/*
function msghide_list()
{
	helpbox.innerHTML='';
}
if(navigator.appName == "Netscape"){
	//captureEvents: ���� ���� �̺�Ʈ�� �߻��ϸ� ĸ���϶�.
    document.captureEvents(Event.MOUSEDOWN | Event.MOUSEMOVE | Event.MOUSEUP);
	//mousemove �̺�Ʈ �߻��� msgopsit_list�Լ� ����
  	document.onmousemove = msgposit_list;
}
*/
/**
 * ��Ʈ�÷��� ��ȣ���� �����´�.
 * @param {Object} colNmStr
 * ex) 1,2,3,4,5,6,7
 */
function getSortColNums(colNmStr)
{
	var cnt = colNmStr.split(",").length;
	var value = "";
	try {
		for(var i=0; i<cnt ; i++)
		{
			if (i < cnt - 1) 
			{
				value += (i + 1) + ",";
			}
		}
		if(cnt>0)
		{
			value = value.substring(0, value.length-1);
		}    
		
		return value;
		
	} catch (e) {
		// TODO: handle exception
	} finally {
		
		//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
		/*if(MEMORY_INIT){
			cnt = null ;
			value = null ;
		}*/
		//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	      
	}
}

/**
 * orderBy ������ �����´�.
 * getColInfo()�Լ��� ��������� js�� ���� �Ǿ� �־����.
 */
function getOrderByInfo(tbIdx)
{
	try {
		var sortCols = getColInfo(tbIdx, "sortCols");    
		var startOderBySql = getColInfo(tbIdx,"startOrerBy");
		var orderBy = getOrderSql(sortCols, getSortIndex(null, tbIdx), tbIdx) ; 
		if(orderBy == '' || orderBy== undefined) orderBy = getStartOderBySql(startOderBySql) ;    
		
		return orderBy;    
		
	} catch (e) {
		// TODO: handle exception
	} finally {
		
		//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
		/*if(MEMORY_INIT){
			tbIdx = null ;
			sortCols = null ;
			startOderBySql = null ;
			orderBy = null ;
		}*/
		//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//		
	}
	
}



/**
 * ���̺��� �׸���. (�ߺ����� ���̴� �߰������κ��� �ڵ������ؼ� ���̺��� �׸�  
 */
function assistMakeTablePage(jsonObj, tbNm, reqSortFnNm, tbIdx, union, appendTrId)
{
  	var colSizeStr = getColInfo(tbIdx, "colSize"); 
 	var colNmStr = getColInfo(tbIdx);
	var viewColCnt = getColInfo(tbIdx, "viewColCnt");			
	var maxListCnt = getColInfo(tbIdx, "maxListCnt"); ;
	var reqPageFnNm = reqSortFnNm ;
	makeTable(jsonObj, tbNm, tbIdx, union, colNmStr, colSizeStr, viewColCnt ,reqSortFnNm, jsonObj.totCnt, maxListCnt, reqPageFnNm, appendTrId);   
   		
	//-- �� ��� �� ���ú��� �ʱ�ȭ ���� ���� --//
   /* if(MEMORY_INIT){
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
    }*/
	//-- # ��� �� ���ú��� �ʱ�ȭ ���� ���� --//	
   		
}

function getColDetailInfo(arguCnt, type, tbIdx, arrColNm, arrMaxListCnt, arrStartOrderBy, arrColSize )
{
    var value = null;
    if(arguCnt == 1 )            value = arrColNm[tbIdx];
    else if(type == "maxListCnt")  value = arrMaxListCnt[tbIdx];
    else if( type == "sortCols")     value =  getSortColNums(arrColNm[tbIdx]);
    else if(type == "startOrerBy")  value = arrStartOrderBy[tbIdx];
    else if(type == "viewColCnt" ) value = arrColNm[tbIdx].split(",").length;
    else if(type == "colSize")  value = arrColSize[tbIdx];    
    return value;
}

