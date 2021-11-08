<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="container">
	<div class="content">
		<div class="visualArea bgStory04" data-title="맥도날드 사람들"
			data-desc="크루 이야기">
			<div class="inner">
				<h1 class="titDep1">맥도날드 사람들</h1>
				<p class="subCopy">
					끊임없는 변화와 도전을 통해 성장해온 맥도날드<br>이 변화의 중심에는 맥도날드와 함께 변화하며 성장하는
					&lsquo;맥도날드 사람들&rsquo;이 있습니다.
				</p>
				<ul class="navPath">
					<li><a href="main.do">Home</a></li>
					<li><a href="brandintro.do">Story</a></li>
					<li><a href="crew.do">맥도날드 사람들</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<ul class="tabType01">
					<li><a href="crew.do" role="button" aria-selected="true">크루이야기</a></li>
					<li><a href="crew_work.do" role="button">업무소개</a></li>
					<li><a href="crew_recruit.do" role="button">인재채용</a></li>
				</ul>
				<h2 class="hide">크루이야기</h2>
				<h2 class="titDep2">변화를 만나는 곳, 변화를 만드는 곳.</h2>
				<p role="text" class="txtInfo">맥도날드 크루들의 이야기를 영상으로 만나보세요.</p>
				<div class="crewCont01">
					<div class="videoArea">
						<!-- 영상 삽입 영역  -->
						<iframe title="변화를 만나는 곳, 변화를 만드는 곳." width="100%" height="720px"
							src="https://www.youtube.com/embed/ny8cb5j92t8?controls=1&amp;cc_lang_pref=ko&cc_load_policy=1"
							frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						<!-- //영상 삽입 영역  -->
					</div>
				</div>
				<div class="crewCont02">
					<h3 class="titDep3">크루들이 만들어가는 맥도날드의 변화 이야기</h3>
					<!-- 수정 -->
					<ul class="crewList">
						<li>
							<a href="javascript:commonJs.popup.basic.show($('#crew_1'));" class="crewThumb">
								<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/crew/crew_01.png" alt="목포 남악 DT점 김지웅 매니저">
							</a></a> 
							<strong class="tit">변화는 나의 자부심</strong> 
							<span class="crewInfo">목포 남악 DT점 김지웅 매니저</span>
						</li>
						<li>
							<a href="javascript:commonJs.popup.basic.show($('#crew_2'));" class="crewThumb">
								<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/crew/crew_02.png" alt="경희대점 권영미 크루">
							</a></a>
							<strong class="tit">
								매일 열정적일 수 있는<br>
								나만의 비결
							</strong> 
							<span class="crewInfo">경희대점 권영미 크루</span>
						</li>
						<li>
							<a href="javascript:commonJs.popup.basic.show($('#crew_3'));" class="crewThumb">
							<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/crew/crew_03.png" alt="미아역점 이지혁 라이더">
						</a></a>
							<strong class="tit">행복을 배달하는 사람으로</strong> 
							<span class="crewInfo">미아역점 이지혁 라이더</span>
						</li>
						<li>
							<a href="javascript:commonJs.popup.basic.show($('#crew_4'));" class="crewThumb">
								<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/crew/crew_04.png" alt="석촌역점 이나라 크루">
							</a></a>
							<strong class="tit">맥도날드를 넘어,<br>
							나 자신의 변화까지
							</strong> 
							<span class="crewInfo">석촌역점 이나라 크루</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //contArea -->
	</div>
	<div class="aside">
		<a href="https://www.mcdelivery.co.kr/kr/" class="goDelivery" target="_blank" title="새창 열림">Mcdelivery</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
</div>
<!-- //container -->
<%@ include file ="footer.jsp"%>
<!-- //footer -->