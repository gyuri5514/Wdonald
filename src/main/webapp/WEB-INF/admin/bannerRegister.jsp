<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="${pageContext.request.contextPath}/resources/css/adminStyles.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc50f0bdab0c2e48e4552db155399164&libraries=services"></script>
    	 <script src="resources/js/banner.js"></script>
    </head>
    <script type="text/javascript">
    $(document).ready(function(){
   	 $("#cancle").on("click",function(){ 
   		
   		 location.href = "/controller/layout-sidenav-light.mdo"
   	 })
   	$("#submit").on("click",function(){
		 if($("#coupon_code").val()==""){
			 alert("쿠폰코드를 입력하세요.");
			 $("#coupon_code").focus();
			 return false;
		 }
		 if($("#coupon_title").val()==""){
			 alert("쿠폰명을 입력하세요.");
			 $("#coupon_title").focus();
			 return false;
		 }
		 if($("#coupon_type").val()==""){
			 alert("분류를 입력하세요.");
			 $("#coupon_type").focus();
			 return false;
		 }
		 if($("#coupon_regdate").val()==""){
			 alert("쿠폰등록일을 입력하세요.");
			 $("#coupon_regdate").focus();
			 return false;
		 }
		 if($("#coupon_enddate").val()==""){
			 alert("유효일자를 입력하세요.");
			 $("#coupon_enddate").focus();
			 return false;
		 }
		 $.ajax({
			type : 'post',
			url : 'controller/couponCheck.mdo',
			data : {
				coupon_code : ${"#coupon_code"}.val()
			},
			dataType : 'json',
			success : function(data) {
				alert(data);
				if(data == 1){
					$('#content').attr("style","display:block;");
					$('#content').text("이미 존재하는 쿠폰코드 입니다.");
					return;
				}else{
					$.ajax({
						type : 'post',
						url : '/controller/couponCheck.mdo',
						data : {
							coupon_title : $("#coupon_title").val()
						},
						dataType : 'json',
						success : function(data){
							if(data == 1){
								$('#content').attr("style","display:block;");
								$('#content').text("이미 존재하는 쿠폰명 입니다.");
								return;
							}
						}
					});
				}
			}
		 });
		 /* $('#addCoupon').submit(); */
	 });
	})
   	 </script>
   	 <script>
var slider = {
		setup : function( target )
		{
			var sTarget = target.find('.swiper');
			sTarget.addClass('swiper-container');
			sTarget.find('>ul , >ol').addClass('swiper-wrapper');
			sTarget.find('>ul>li , >ol>li').addClass('swiper-slide');

			if( target.find('.swiper').data('swipe') )
			{
				target.find('.swiper').data('swipe').destroy();
				target.find('.indicator .bar').stop().css('width','0');
				// target.find('.slide-invisible-blank').remove();
			}

			var opt = {};
			if( target.hasClass('basicSwiper') )
			{
				// console.log('-- basic -')
				var transitionVisible = function()
				{
					bar.stop().css('width','0');
					target.find('.swiper-slide').css('visibility','visible');
				}
				var transitionHidden = function()
				{
					target.find('.swiper-slide').css('visibility','hidden');
					if( target.hasClass('swiperType02') ){
						target.find('.swiper-slide-next').css('visibility','visible');
					}
					target.find('.swiper-slide-active').css('visibility','visible');
				}
				opt = {
					delay : 5000 , 
					loop: true,
					navigation : {
						nextEl: target.find('.next'),
						prevEl: target.find('.prev'),
					},
					on : {
						transitionEnd : function(  )
						{
							if( target.find('.indicator button').hasClass('pause') ){
								nextH();
							}
							transitionHidden();
						},
						sliderMove 	:	transitionVisible,
						// slideChange 	:	transitionVisible,
						transitionStart	:	transitionVisible,
						// touchStart		:	transitionVisible
					}
				}
				// 다른 타입
				if( target.hasClass('swiperType02') ){
					opt.slidesPerView = 2;
					opt.slidesPerGroup =  2;
					opt.spaceBetween = 50;
				}

				var bar			= target.find('.indicator .bar');
				var inButton	= target.find('.indicator button');
				inButton.off().addClass('pause')

				inButton.on('click' , function(evt)
				{
					evt.preventDefault();
					if( $(this).hasClass('pause')  ){
						bar.stop().css('width','0');
						$(this).removeClass('pause');
						$(this).text('재생');
					}else{
						$(this).addClass('pause');
						$(this).text('정지');
						nextH();
					}
				});

				inButton.on('keydown',function( evt )
				{
					if( !evt.shiftKey ){
						nextH();
					}
					
				});
				inButton.on('keyup',function( evt )
				{
					if( evt.shiftKey ){
						transitionVisible();
						transitionHidden();
					}
				});

				target.find('.prev').off().on('keyup',function( evt ){
					if( evt.shiftKey ){
						nextH();
					}else{
						transitionVisible();
						transitionHidden();
					}
				})
			}
		}
	}
</script>
    <body class="bg-black">
    <div id="map" style="width: 0px; height:0px;"></div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">배너 등록</h3></div>
                                    <div class="card-body">
                                        <form action="addcouponInsert.mdo" method="post" id="addCoupon">
                                        <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="banner_title" name="banner_title" type="text" placeholder="Enter your first name" />
                                                        <label for="banner_title">배너 제목</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="banner_content" name="banner_content" type="text" placeholder="Enter your first name" />
                                                        <label for="banner_content">배너 내용</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slideshow-container">
			<div class="mySliders fade">
				<div class="numbertext">1 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633519760853.png" alt="1955 스모키 더블 베이컨 버거 출시">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">2 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633519887333.png">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">3 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633532684256.png"	alt="맥런치 리힛">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">4 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1631842026946.png" alt="해피스낵 Q3">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">5 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1630301940217.png" alt="자두 칠러">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">6 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1621833457701.png" alt="트리플치즈버거">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">7 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1617176534703.png" alt="">
			</div>
		</div>
		<div style="text-align:center">
		  <span class="dot" onclick="currentSlide(1)"></span> 
		  <span class="dot" onclick="currentSlide(2)"></span> 
		  <span class="dot" onclick="currentSlide(3)"></span> 
		  <span class="dot" onclick="currentSlide(4)"></span> 
		  <span class="dot" onclick="currentSlide(5)"></span> 
		  <span class="dot" onclick="currentSlide(6)"></span> 
		  <span class="dot" onclick="currentSlide(7)"></span> 
		</div>
                                            <div class="row mb-3">
                                                    <div class="file-field">
													    <div class="btn btn-sm float-left" style="width:100%; font-size:20px;">
													      <input type="file" multiple>
													    </div>
												   </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="coupon_enddate" name="coupon_enddate" type="date"/>
                                                <label for="coupon_enddate">유효일자</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">쿠폰 등록</a></div>
                                                <div class="d-grid" style="padding-top: 5px"><a class="btn btn-danger btn-block" id="cancle" style="background-color: #0d6efd; border:solid 1px #0d6efd;">취	소</a></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>	
    </body>
</html>
