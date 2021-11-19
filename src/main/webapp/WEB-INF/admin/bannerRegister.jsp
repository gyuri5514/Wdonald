<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
    </head>
<script type="text/javascript">
 	$(document).ready(function(){
	 	$("#cancle").on("click",function(){ 
	   		
	   		 location.href = "banner.mdo";
	   	 })
	   	$("#submit").on("click",function(){
			 if($("#banner_title").val()==""){
				 alert("배너 제목을 입력하세요.");
				 $("#banner_title").focus();
				 return false;
			 }
			 if($("#banner_content").val()==""){
				 alert("배너 내용 입력하세요.");
				 $("#banner_content").focus();
				 return false;
			 }
			 if($("#banner_img").val()==""){
				 alert("배너이미지를 업로드하세요.");
				 $("#banner_img").focus();
				 return false;
			 }
			  $('#addBanner').submit(); 
		 });
	 	
 	 $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }
      });
 	  $(document).on('change', ':file', function() {
 	     var input = $(this),
 	         numFiles = input.get(0).files ? input.get(0).files.length : 1,
 	         label = input.val();
 	     input.trigger('fileselect', [numFiles, label]);
 	   });
	})
</script>
    <body class="bg-black">
    <div id="map" style="width: 0px; height:0px;"></div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container1" style="max-width:100%;">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">배너 등록</h3></div>
                                    <div class="card-body">
                                        <form action="bannerRegister.mdo" method="post" id="addBanner" enctype="multipart/form-data">
                                        	<div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="banner_title" name="banner_title" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="banner_title">배너 제목</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="banner_content" name="banner_content" type="text" placeholder="Enter your first name" 
                                                        	style="height: calc(3.5rem + 20px);"/>
                                                        <label for="banner_content">배너 내용</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: inline-flex; margin-top: 10px;">
	                                            <button type="button" id="slideBtn" onclick="slideButton();" class="btn btn-primary">배너 미리보기</button>	
	                                            <span id="content" style="display:none; color:red; margin:10px 15px;"></span>
                                            </div>
                                            <div class="banner_slideshow-container" id="banner_container" style="display:none;">
                                            	<c:forEach var="bannerList" items="${bannerList}" varStatus="status" end="${bannerList.size()}">
													<div class="mySliders fade">
														<div class="numbertext">${status.count}/ ${status.end}</div>
														<img style="width:100%" src="${bannerList.banner_img}">
													</div>
												</c:forEach>
											</div>
											<div style="text-align:center; margin:10px;">
											  <c:forEach var="bannerList" items="${bannerList}" varStatus="status">
											  	<span class="dot" onclick="currentSlide(${status.count})"></span> 
											  </c:forEach>
											</div>
                                            <div class="row mb-3">
                                                <div class="input-group">
								                <label class="input-group-btn">
								                    <span class="btn btn-primary">
								                        Upload <input type="file" name="file" id="file" style="display: none;" multiple>
								                    </span>
								                </label>
								                <input type="text" id="banner_img" class="form-control" readonly>
								            </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-danger btn-block" id="submit" style="background-color: #0d6efd; border:solid 1px #0d6efd;">배너 등록</a></div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>	
        <script src="${pageContext.request.contextPath}/resources/js/banner.js"></script>
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
    </body>
</html>
