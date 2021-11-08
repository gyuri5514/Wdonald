<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>McDonald's Crew</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<meta name="description" content="">
<meta name="author" content="Themelize.me">
 
<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901"> 

<!-- Bootstrap CSS -->	
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed" href="/m/appstrap/img/icons/default.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti' rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts -->
<script type="text/javascript" src="resources/js/join/join.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/commons.js"></script>
</head>
	<div class="wrapper ">
	<div id="content">
  	<div class="container" id="sub-page-content">
    <div class="row"> 
      <!-- sidebar -->
      <div class="col-md-3 sidebar">
	<div class="section-menu">
	  <ul class="nav nav-list">
		<li class="nav-header lnb-header">회원가입<span>Join Us</span></li>
		<li class="active"><a href="join.do" class="first">회원가입<small>Join Us</small><i class="fa fa-angle-right"></i></a></li>
	  </ul>
	</div>
	 </div>
      <!--main content-->
      <div class="col-md-9">
		
		<h3 class="title-divider mt_0"><span>회원가입</span> <small>Join Us</small></h3>
		<form name="join_form" method="post" action="memberJoin.do">
			<h4 class="title">이용약관</h4>
			<textarea name="textarea" rows="10" class="w100per" readonly title="이용약관">
제1조. 목적

이 약관은 "한국윈도날드의 아르바이트(Crew) 상시채용시스템 홈페이지"(이하 "홈페이지")가 제공하는 모든 정보 제공 서비스를 이용하는 조건 및 절차에 관한 사항을 규정함을 목적으로 하며, 
이용자는 서비스 제공업체인 한국윈도날드 유한회사(이하 "윈도날드")에서 제공해 드리는 홈페이지 서비스 이용 약관에 동의하였음을 확인합니다. 
윈도날드는 보다 나은 서비스 제공을 위하여 이용자들이 홈페이지 서비스 이용과정에서 제공하는 개인정보를 McDonald's Family와 공유할 수 있습니다. 
McDonald's Family는 윈도날드의 계열회사, 프랜차이즈 및 윈도날드가 고객들에게 제공하는 서비스와 관련하여 윈도날드와 제휴관계에 있는 제휴사를 포함합니다. 
McDonald's Family의 개인정보 사용은 &lt;개인정보 수집목적 및 이용목적&gt;을 준수합니다. 
윈도날드는 윈도날드의 웹사이트를 보호하고 어떠한 법규에도 어긋나지 않기 위하여 여하한 정부기관으로부터 적법한 법률상의 요청이 있을 시 
공공의 안전을 위하여 어떠한 정보이든 해당 정부기관과 협조하여 공유할 권한이 있음을 알려드립니다. 

제2조. 회원가입

1. 홈페이지 회원은 "본인회원"만을 원칙으로 합니다. 
2. 본인회원이란 이 약관을 승인하고 홈페이지 서비스의 회원신청 양식에 의거, 본인의 신상 정보를 사실에 입각, 입력하여 
ID와 Password를 발급받으신 분을 의미합니다. 법인 혹은 단체회원으로 가입신청을 하실 수는 없습니다. 
3. 만14세 미만의 미성년자가 회원으로 가입하고자 하는 경우에는 해당 미성년자의 부모님이나 보호자분의 동의가 있어야 회원으로서의 자격이 부여됩니다. 
만14세 미만의 미성년자가 회원가입을 신청하면 그 부모님이나 보호자분의 이메일로 자녀분 회원가입 동의 이메일을 발송합니다. 
이메일을 받으시고 부모님 또는 보호자분이 14일 이내로 동의를 해주시면 귀하의 자녀가 정식으로 윈도날드의 회원이 되십니다. 
14세 미만의 어린이가 부모님의 이메일을 입력하지 않고 임의의 이메일을 입력하여 회원가입 후 문제점 발생시 윈도날드는 이에 수반되는 법적 책임을 지지 않습니다. 
4. 윈도날드는 다음 사항에 해당하는 경우에는 가입승인을 유보, 거부 또는 삭제 할 수 있습니다. 
1) 가명으로 회원에 가입할 경우. 
2) 혐오스럽거나 타인에게 불쾌감을 줄 수 있는 아이디로 회원가입을 할 경우. 
3) 다른 사람의 명의를 빌리거나 도용하여 차명으로 신청하였을 경우. 
4) 기타 가입신청 항목에 허위로 기재할 경우. 
5) 관계법령에 위배되거나 미풍양속을 저해하고자 하는 목적으로 회원가입 신청을 할 경우. 

제3조. 회원정보

1. 회원 가입 시 입력한 신상정보는 이 약관에서 달리 정한 경우를 제외하고는 회원관리용의 목적 및 특정 물품 (경품이벤트 당첨 등) 발송 외 다른 용도로 사용되지 않으며, 
또한 외부로 유출되지 않습니다. 만약 이 사항에 대한 위반행위 시 윈도날드에서 법적 책임을 질 것을 약속 드립니다. 
2. 상기 제3조 제1항의 예외적용 만약 검찰/경찰 등 수사기관이 수사목적으로 회원 정보의 제공을 요청하는 경우 윈도날드는 법에 의하여 강제되는 범위 내에서는 
부득이하게 회원정보를 해당 수사기관에 제공할 수 있습니다. 
다만, 이 경우 윈도날드는 본인에게 그 내용을 통보해 드리되, 가능한 범위 내에서는 가급적 사전에 통보하도록 노력할 것입니다. 

제4조. 회원의무

1. ID와 Password는 회원본인이 직접 사용하여야 하며, 본인이 아닌 타인이 이용하게 하여서는 안됩니다. 
2. 본인 부주의로 ID와 비밀번호가 타인에게 유출되어 발생할 수 있는 각종 손실 및 손해에 대한 책임은 본인에게 귀속됩니다. 
3. 개인신상정보의 변경사항 발생시 회원본인이 수정하지 않은 사항에 관련된 문제점 발생시, 책임은 회원 본인에게 귀속됩니다. 

제5조. 회원관리

1. 회원은 언제든지 개인정보를 열람하고 정정 또는 동의철회(회원탈퇴)를 요청할 수 있습니다. 
2. 개인정보의 수집에 대한 동의철회(회원탈퇴)를 하시려면 회원탈퇴를 누르시고 회원탈퇴를 하시면 됩니다. 
회원탈퇴시 귀하가 윈도날드에 제공한 개인정보는 회원탈퇴의 효력이 발생한 날로부터 3개월 안에 모두 삭제됩니다. 
3. 홈페이지 이용자는 홈페이지 내에 게재되어 있는 각종 정보서비스 이용에 관련된 불만사항이나 의견을 제안하여 시정을 요구할 수 있습니다. 
4. 회원으로 가입되어 있는 분들은 누구나 동등한 자격으로 서비스를 이용하실 수 있습니다. 

제6조. 회원정보 이용

1. 홈페이지 이용자는 홈페이지의 이용과정에서 취득한 e-mail 주소 등 다른 이용자의 개인정보를 영리 목적을 불문하고 사용하거나 제3자에게 제공할 수 없습니다. 
2. 홈페이지 이용자가 스팸메일 발송 등을 위하여 다른 회원들의 e-mail 주소를 사용하거나 이를 제3자에게 제공하였을 경우 , 이에 대한 법적책임은 해당 홈페이지 이용자에게 있으며, 
해당 홈페이지 이용자는 이로 인하여 발생하는 모든 손실 또는 손해로부터 윈도날드가 면책되도록 하여야 합니다. 

제7조. 저작권

1. 홈페이지 이용자가 홈페이지에서 제공하는 각종 서비스에 대한 정보를 사전 동의 없이 외부로 유출시켰을 경우, 해당 홈페이지 이용자는 저작권법등 관련법령에 의하여 제재를 받을 수 있습니다. 
2. 홈페이지 이용자는 홈페이지 등록되어 있는 윈도날드의 CI/BI 혹은 캐릭터 등 상표권법에 의해 보호 받고 있는 이미지 파일을 무단으로 사용하실 수 없으며, 
위반사항 적발 시 해당 행위에 대한 법적 제재가 따른다는 사실을 인정하고 이에 동의합니다. 

제8조. 회원자격 중지 및 탈퇴

1. 서비스 제공업자인 윈도날드는 다음사항 발생시 별도 통보절차 없이 회원의 자격을 정지하거나 박탈할 수 있습니다. 
1) 회원가입시 입력사항을 허위로 기재하였을 경우. 
2) 회원들 간의 홈페이지 내에서의, 음란물 거래 혹은 음란물 등록을 하였을 경우. 
3) 명백한 형사처벌 또는 민사상 불법행위의 대상이 되는 행위 적발시. (불법 상행위 포함) 
4) 게시판 등 홈페이지에서 욕설이나 저속한 문구를 사용하여, 타인에게 불쾌감을 준다고 판단되는 경우. 
2. 홈페이지를 이용한 부당광고 및 다른 회원들에게 피해를 주는 행위를 하였을 경우, 윈도날드는 1회에 한하여 해당 이용자에게 해당 행위를 중지할 것으로 통보하며, 
그러한 통보에도 불구하고 그러한 행위에 발생하는 때에는 별도의 통보 없이 윈도날드는 회원자격을 정지 또는 박탈하게 됩니다. 

제9조. 서비스 이용

1. 서비스는 윈도날드의 업무상 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 
2. 제1항의 이용시간은 정기 점검 등의 필요로 인하여 윈도날드가 정한 날과 시간에는 예외로 합니다. 
단, 부득이한 경우로 서비스를 일시 중지 할 경우에는 윈도날드는 가급적 사전에 이를 공지하여야 하나, 불가피한 경우에는 사후 통지로 갈음할 수 있습니다. 
3. 회원의 ID 및 비밀번호 등의 관리 및 이용은 전적으로 회원의 책임으로 하며 회원의 부주의로 인한 이용상의 과실 
또는 제3자에 의한 부정사용 등에 대한 모든 책임은 회원에게 있습니다. 

제10조. 서비스 제공업자의 의무

1. 윈도날드는 특별한 사정이 없는 한 이용자가 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다. 
2. 윈도날드는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다. 
3. 윈도날드는 이 약관에서 특별히 정한 경우를 제외하고는 이용자의 개인신상정보를 본인의 승낙 없이 타인에게 누설, 배포하여서는 아니됩니다. 
다만 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 적법한 요구가 있는 경우에는 예외로 합니다. 
4. 윈도날드는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 
다만, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 통보 하여야 합니다. 

11조. 기타사항 (명기되지 않은 사항)

1. 이 약관에 명기되지 않은 사항이나 약관의 해석에 관하여서는 관계법령 또는 상관례에 따릅니다. 
2. 본 약관은 특별한 사유발생시 수정될 수 있으며, 이 경우 홈페이지를 통해 사전 공지됩니다. 

12조. 약관위반 시 책임

1. 이 약관을 위반함으로써 발생하는 모든 책임은 위반한 자가 부담하며, 이로 인하여 상대방에게 손해를 입힌 경우에는 관계법령에 의거하여 법적 책임을 져야 합니다. 
2. 서비스 이용과 관련하여 윈도날드와 이용자 간에 발생하는 분쟁에 관한 소송은 민사소송법 등에 의거한 관할법원에 제기합니다. 

부칙

본 약관은 2010 . 8 . 5부터 적용하고, 2006 . 8 . 16부터 적용되던 종전의 개인정보정책은 본 약관으로 대체합니다. 

			</textarea>
			<div class="form-group mt_5">
				<label for="checkbox1">
					<input type="checkbox" name="checkbox1" id="checkbox1" value="1" /> 
					한국 윈도날드의 회원가입 사이트 이용약관에 동의합니다.
				</label>
			</div>
			<h4 class="title">지원자의 개인정보 처리에 관한 동의</h4>
			<textarea name="textarea" rows="10" class="w100per" readonly title="지원자의 개인정보 처리에 관한 동의">
※ 수집하는 개인정보의 항목
&nbsp;&nbsp;&bull;&nbsp;이름, 사진, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 자기소개,
&nbsp;&nbsp;서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보 등
&nbsp;&nbsp;&bull;&nbsp;희망직종, 지원경로, 적성검사 결과 등

※ 개인정보의 수집·이용 목적
&nbsp;&nbsp;&bull;&nbsp;회원관리: 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지,
&nbsp;&nbsp;가입 의사 확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 고지사항
&nbsp;&nbsp;전달
&nbsp;&nbsp;&bull;&nbsp;과거 지원이력의 관리, 채용 여부의 결정 및 통지 

※ 개인정보의 보유·이용 기간
&nbsp;&nbsp;&bull;&nbsp;관계 법령의 규정에 따라 귀하의 개인정보를 보존할 의무가 있는 경우가 아닌 한, 회사는 위의 수집 및 이용목적을
&nbsp;&nbsp;달성할 때까지 귀하의 개인정보를 보유 및 이용합니다.
			</textarea>
			<div class="form-group mt_5">
				<label for="checkbox2"><input type="checkbox" name="checkbox2" id="checkbox2" value="2" /> 개인정보 처리에 동의합니다.</label>
			</div>
			<div class="b_btn_c">
				<a href="javascript:join_chk()" class="btn btn-md btn-red" >확인</a>
				<a href="javascript:history.back();" class="btn btn-md btn-default">뒤로</a>
			</div>
		</form>
      </div>
	  <!-- //content -->
    </div> <!-- //.row -->
  </div> <!-- //.container -->
</div> <!-- //#content -->
<!--Hidden elements - excluded from jPanel Menu on mobile-->

</div>
<%@ include file="footer.jsp"%>