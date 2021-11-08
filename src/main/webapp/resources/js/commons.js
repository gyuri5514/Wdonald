$(document).ready(function() {

	var limit = $(".header").height();
	var ch = false;

	$(document).scroll(scrollH);	//마우스 스크롤할떄마다 이벤트 발생

	$('.btnTop').click(function() {	//Top 클릭시 이벤트
		$('btnTop').removeClass("fixedB");
		$("body,html").animate({ "scrollTop": 0 }, 200);
	});

	function scrollH() {	//마우스 스크롤 이벤트
		if ($(".footer").length > 0) {
			if ($(document).scrollTop() + $(window).height() < $(".footer").offset().top) {
				$(".btnTop").removeClass('fixedB');
				$(".aside").removeClass('fixedB');
			} else {
				if ($(document).scrollTop() !== 0) {
					$(".btnTop").addClass('fixedB');
					$('.aside').addClass('fixedB');
				}
			}
		}
		if ($(document).scrollTop() < limit) {
			$(".header").removeClass('fixed');
			if (ch) {
				ch = false;
				$(".header").removeClass('fixed');
				return;
			}
		} else {
			if (!ch) {
				ch = true;
				$(".header").addClass('fixed');
				$(".header").stop().css({	//현재동작하는 애니메이션을 중지
					'margin-top': '-30px'
				}).animate({
					'margin-top': 0
				}, 100, function() {	//animate({'속성명':'속성값'}, 가속도, 가속도함수) - animate로 보여지는 속도값지정
				});
				return;
			}
		}
	};

	$(".menu").mouseover(function(e) {	//메인 메뉴바에 마우스 오버시 이벤트
		$(".header").addClass("open");
	}).mouseout(function(e) {			//메인 메뉴바에 마우스 아웃시 이벤트
		$(".header").removeClass("open");
	});

	$(".btn_login").click(function(e) {	//로그인 버튼 클릭 이벤트
		e.preventDefault();
		$("#login_pop").slideDown(200);
		$("#login_pop").removeClass("close");
		$(".dimmed").attr("style", "display:block;");
	});

	$("#login_pop > .dimmed, #login_pop .btn_x").click(function(e) {	//로그인 x버튼 클릭, 바탕 클릭시 이벤트
		e.preventDefault();
		e.stopPropagation();
		$("#login_pop").fadeOut(200);
		$("#login_pop").addClass("close");
		$(".dimmed").attr("style", "display:none;");
	});

	$("#login_pop .check").click(function() {
		if ($(this).hasClass("checked")) {
			$(this).removeClass("checked");
		} else {
			$(this).addClass("checked");
		}
	});

	var utils = {
		scrollDisabled: function() {
			// console.log('idsenabled')
			$("html , body").css("overflow", "hidden");
		},
		scrollEnabled: function() {
			$("html , body").css("overflow", "");
		}
	};

	var topSearch = $(".topSearch")
	$(".srch").click(function(e) {	//검색 돋보기 클릭 이벤트
		utils.scrollDisabled();
		topSearch.addClass("open");
		e.preventDefault();
		topSearch.find(".dimmed").remove();
		// $('.dimmed').show();
		topSearch.append("<div class='dimmed'></div>");
		// open
	});
	topSearch.find(".close").click(function(e) {	//검색 닫기버튼 클릭 이벤트
		utils.scrollEnabled();
		e.preventDefault();
		topSearch.removeClass("open");
		// $('.dimmed').hide();
		topSearch.find(".dimmed").remove()
	});

	$(".btn_view01").click(function() {	//눈알 이미지 클릭 이벤트
		if ($(this).hasClass("on")) {
			$(this).removeClass("on");
			$("#password").attr("type", "password");
		} else {
			$(this).addClass("on");
			$("#password").attr("type", "text");
		}
	});

	function clickItem() {	//이용가능한 메뉴 클릭 이벤트
		$(".storeFind .srvcFilter .service>span input").each(function() {	//각각의 input들을 가져오고 반복문을 돌림(for문과 같음)
			$(this).click(function() {	//this = 클릭한input,  input 클릭시 이벤트(each로인해 반복됨(중복처리되는듯))
				var chk = $(this).is(":checked");	//is(":checked") = 체크박스 체크여부
				var dataOff = $(this).siblings("label").find("img").attr("data-off");	//siblings = this선택자를 제외한 같은 선상에있는 this들
				var dataOn = $(this).siblings("label").find("img").attr("data-on");
				if (chk) {
					$(this).prop("checked", true);	//this의 속성(checked)의 값을 true로 줌
					$(this).parent("span").addClass("on");
					$(this).siblings("label").find("img").attr({ "src": dataOn });
				} else {
					$(this).prop("checked", false);
					$(this).parent("span").removeClass("on");
					$(this).siblings("label").find("img").attr({ "src": dataOff });
				}

			});
		});
	};
	clickItem();
	
/*------네이버 로그인------*/
//loginWithnaverId Javascript 설정 정보 및 초기화
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

var testPopUp;
function openPopUp() {
	testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes, width=1, height=1");
}
function closePopUp() {
	testPopUp.close();
}
function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
	}, 1000);
}
}); //End document	

/*------카카오 로그인------*/
Kakao.init('78b392cdaf1eebab161a60b328e54f3a');
console.log(Kakao.isInitialized());
//카카오 로그인
function kakaoLogin() {
	Kakao.Auth.login({
		success: function(response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(response) {
					console.log(response);
					alert(response);
					$.ajax({
						type: "POST",
						url: "kakaoLogin.do",
						data: JSON.stringify(response.kakao_account),
						contentType: "application/json",
						succcess: function() {
												
								}
					})
					window.location.href="http://localhost:8080/controller/main.do";
				},
				fail: function(error) {
					console.log(error)
				},
			})
		},
		fail: function(error) {
			console.log(error)
		},
	})
}
/* */
					 
function kakaoLogout(){
	console.log(Kakao.isInitialized());
	
	if(!Kakao.Auth.getAccessToken()){
		alert('Not logged in');
		return;		
	}
	Kakao.Auth.logout(function(){
		console.log(Kakao.Auth.getAccessToken());
		$.post("logout.do");
	})	
	/*window.location.href="http://localhost:8080/controller/main.do";*/
}
function naverLogout(accessKey){
	$.post("logout.do",function(){
		window.location.href="https://nid.naver.com/oauth2.0/token?grant_type="+
		"delete&client_id=Xh_il_8tTurOD_pU6D37&client_secret=JHDMkT0G7N&access_token="
		+accessKey+"&service_provider=NAVER";		
	})
	window.location.href="http://localhost:8080/controller/main.do";
	//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=Xh_il_8tTurOD_pU6D37&client_secret=JHDMkT0G7N&access_token=&service_provider=NAVER		
}

