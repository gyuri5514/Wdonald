<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>callBackUrl</title>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Xh_il_8tTurOD_pU6D37", //내 애플리케이션 정보에 clientId를 입력해준다 
			callbackUrl: "http://localhost:8080/controller/naverCallback.do", //내 애플리케이션 API설정의 CallbackURL을 입력해준다.
			isPopup: false,
			callbackHandle: true
		}
	);
	//네아로 로그인 정보를 초기화 하기 위하여 init호출
	naverLogin.init();
	//callback의 처리 정상적으로 callback 처리가 완료될 경우 mainPage로 redirect
	window.addEventListener('load', function() {
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				var email = naverLogin.user.getEmail(); //필수로 설정할 것을 받아와 아래처럼 조건문을 준다 
				/*console.log(naverLogin.oauthParams.access_token);*/
				/*console.log(status);
				console.log(naverLogin);
				console.log(naverLogin.accessToken.accessToken);
				alert(email);*/
				if (email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
				
				$.ajax({
							type: "POST",
							url: "naverLogin.do",
							/*data: JSON.stringify(naverLogin.user),*/
							data : JSON.stringify({
								"age" : naverLogin.user.age,
								"birthday" : naverLogin.user.birthday,
								"email" : naverLogin.user.email,
								"gender" : naverLogin.user.gender,
								"id" : naverLogin.user.id,
								"mobile" : naverLogin.user.mobile,
								"name" : naverLogin.user.name,
								"nickname" : naverLogin.user.nickname,
								"accessToken" : naverLogin.accessToken.accessToken
							}),
							contentType: "application/json",
							succcess: function() {
											
							}
						})
						location.replace("http://localhost:8080/controller/main.do");
				//window.location.replace("http://" + window.location.hostname + ((location.port == "" || location.port == undefined) ? "" : ":" + location.port) + "/controller/main.do");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});

</script>
</head>
<body>

</body>
</html>