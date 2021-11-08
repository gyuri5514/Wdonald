<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<div id="container">
	<div class="content">
		<div class="visualArea bgStore01" data-title="지역별 매장찾기" data-desc="매장찾기">
			<div class="inner">
				<h1 class="titDep1">매장찾기</h1>
				<ul class="navPath">
					<li><a href="main.do">Home</a></li>
					<li><a href="main.do">Store</a></li>
					<li><a href="main.do">매장찾기</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<ul class="tabType01">
					<li><a href="main.do" role="button" aria-selected="true">지역별</a></li>
					<li><a href="/kor/store/event.do" role="button">이벤트매장</a></li>
				</ul>
				<form id="searchForm" method="post">
					<input type="hidden" name="page" id="page" value="1">
					<input type="hidden" name="lat" id="lat" value="NO"> 
					<input	type="hidden" name="lng" id="lng" value="NO"> 
					<input type="hidden" name="search_options" id="search_options" value="">
					<div class="storeFind">
						<span class="storeFind_bg" style=""></span>
						<div class="srvcFilter">
							<div class="service">
								<span class="srvc"> 
								<input type="checkbox" id="1" value="Y"> 
									<label for="1"> 24시간 
										<span class="icon">
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887217994.png"	alt="24시간"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887217994.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887222493.png">
										</span>
									</label>
								</span> 
								<span class="srvc"> 
									<input type="checkbox" id="6" value="Y"> 
									<label for="6"> 맥드라이브 
										<span class="icon"> 
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887501964.png"	alt="맥드라이브"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887501964.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887505434.png">
										</span>
									</label>
								</span> 
								<span class="srvc"> 
									<input type="checkbox" id="2" value="Y"> 
									<label for="2"> 맥딜리버리 
										<span class="icon"> 
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887371824.png"	alt="맥딜리버리"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887371824.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887378094.png">
										</span>
									</label>
								</span> 
								<span class="srvc"> 
									<input type="checkbox" id="4" value="Y"> 
									<label for="4"> 맥모닝 
										<span class="icon"> 
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887410227.png" alt="맥모닝"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887410227.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887415001.png">
										</span>
									</label>
								</span> 
								<span class="srvc"> 
									<input type="checkbox" id="3" value="Y"> 
									<label for="3"> 주차 
										<span class="icon"> 
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887307761.png" alt="주차"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887307761.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887311487.png">
										</span>
									</label>
								</span> 
								<span class="srvc"> 
									<input type="checkbox" id="9" value="Y"> 
									<label for="9"> 디카페인 커피 
										<span class="icon"> 
											<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887849368.png" alt="디카페인 커피"
												data-off="https://www.mcdonalds.co.kr/upload/main/store_service/1580887849368.png"
												data-on="https://www.mcdonalds.co.kr/upload/main/store_service/1580887855311.png">
										</span>
									</label>
								</span>
							</div>
						</div>
						<fieldset class="srchBox">
							<legend>매장검색</legend>
							<div class="form">
								<input type="text" placeholder="매장명, 동명, 도로명을 검색해 주세요." title="검색어 입력" id="searchWord" name="searchWord">
								<button type="button" class="btnMC btnM" id="storeSearch">검색하기</button>
							</div>
						</fieldset>
					</div>
				</form>
				<!-- //storeFind -->
				<div class="storeResult">
					<div id="map" class="map"
						style="height: 600px; position: relative; overflow: hidden; background: url('https://t1.daumcdn.net/mapjsapi/images/bg_tile.png');">
						<!-- 지도 마커용 태그, A~Z까지 순차적으로 사용 -->
						<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url('https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico') 7 5, url('https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico'), default;">
							<div style="position: absolute;">
								<div style="position: absolute; z-index: 0; left: 0px; top: 0px;">
									<img src="https://map3.daumcdn.net/map_2d/2106wof/L4/1000/443.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 36px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1000/444.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L4/1000/445.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 292px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L4/1000/446.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1000/447.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 548px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1000/448.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: 346px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1001/443.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 36px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1001/444.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L4/1001/445.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 292px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L4/1001/446.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1001/447.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 548px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1001/448.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1002/443.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 36px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1002/444.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L4/1002/445.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 292px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L4/1002/446.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1002/447.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 548px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1002/448.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: 90px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1003/443.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 36px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1003/444.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L4/1003/445.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 292px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L4/1003/446.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L4/1003/447.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 548px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L4/1003/448.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;">
								</div>
								<div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
									<img src="https://map1.daumcdn.net/map_2d/2106wof/L5/499/221.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -92px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/499/222.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L5/499/223.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L5/499/224.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/499/225.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 932px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/499/226.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1188px; top: 474px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/500/221.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -92px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/500/222.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L5/500/223.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L5/500/224.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/500/225.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 932px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/500/226.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1188px; top: 218px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/501/221.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -92px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/501/222.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L5/501/223.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L5/501/224.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/501/225.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 932px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/501/226.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1188px; top: -38px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/502/221.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -92px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/502/222.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 164px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map3.daumcdn.net/map_2d/2106wof/L5/502/223.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 420px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map0.daumcdn.net/map_2d/2106wof/L5/502/224.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 676px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map1.daumcdn.net/map_2d/2106wof/L5/502/225.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 932px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
										src="https://map2.daumcdn.net/map_2d/2106wof/L5/502/226.png"
										alt="" draggable="false"
										style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1188px; top: -294px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
								</div>
								<div style="position: absolute; z-index: 1;"></div>
								<div style="width: 1168px; height: 600px; position: absolute; z-index: 1;"></div>
								<div style="position: absolute; z-index: 1;">
									<svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -2336px; top: -1200px; width: 5840px; height: 3000px;" viewBox="0 0 5840 3000">
										<defs></defs>	
									</svg>
									<!-- <svg> - html로 그림을 그림, <defs> - 참조용 태그, 그라데이션 만들때 사용 -->
								</div>
								<div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
									<div style="position: absolute; margin: -69px 0px 0px -26px; z-index: 0; left: 468px; top: 387px; display: block;">
										<img draggable="false" src="https://www.mcdonalds.co.kr/kor/images/store/ico_marker.png" alt="" title="한국맥도날드(유)"
											style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 54px, 70px, 0px); top: 0px; left: 0px; width: 54px; height: 70px;">
									</div>
								</div>
							</div>
						</div>
						<div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
							<div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
								<div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div>
								<div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">250m</div>
							</div>
							<div style="margin: 0px 4px; float: left;">
								<a target="_blank" href="http://map.kakao.com/"	title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;"><img
									src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"
									alt="Kakao 지도로 이동"
									style="float: left; width: 32px; height: 10px; border: none;"></a>
								<div style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
							</div>
						</div>
						<div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;">
							<div style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 1133px; top: 42px;">
								<button draggable="false" title="확대" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -40px 0px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button>
								<div style="float: left; background: url('https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png') repeat; padding: 7px 0px; transition: height 0s ease 0s, margin 0.1s ease 0s;">
									<div style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s ease 0s; margin: 2px 0px; display: block; width: 32px; height: 104px;">
										<div style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;">
											<div style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -50px -127px/116px 264px;"></div>
											<div style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -40px -100px/116px 264px;"></div>
										</div>
										<div style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s ease 0s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 32px;"></div>
										<div style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -40px -80px/116px 264px; left: 50%; transition: top 0.1s ease 0s; top: 32px;"></div>
									</div>
								</div>
								<button draggable="false" title="축소" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -40px -32px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button>
								<div style="position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px; display: none;">
									<div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') 0px -80px/116px 264px; left: 0px; top: 8px;"></div>
									<div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') 0px -100px/116px 264px; left: 0px; top: 32px;"></div>
									<div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') 0px -120px/116px 264px; left: 0px; top: 64px;"></div>
									<div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') 0px -140px/116px 264px; left: 0px; top: 80px;"></div>
									<div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') 0px -160px/116px 264px; left: 0px; top: 96px;"></div>
								</div>
							</div>
							<div style="width: 106px; height: 32px; box-sizing: content-box; background-color: rgb(255, 255, 255); padding: 2px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 1055px; top: 3px;">
								<button draggable="false" title="지도" type="button"style="float: left; cursor: default; width: 43px; height: 32px; user-select: none; -webkit-user-drag: none; border: none; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -5px -183px/116px 264px no-repeat; color: rgb(255, 255, 255); font-weight: bold;"></button>
								<button draggable="false" title="스카이뷰" type="button" style="float: left; cursor: pointer; width: 63px; height: 32px; user-select: none; -webkit-user-drag: none; border: none; background: url('https://t1.daumcdn.net/mapjsapi/images/control.png') -48px -183px/116px 264px no-repeat; color: rgb(0, 0, 0); font-weight: normal;"></button>
							</div>
						</div>
					</div>
					<button type="button" class="mc_current">
						<span>내 위치 중심으로 지도보기</span>
					</button>
					<div class="mcStore">
						<table class="tableType01">
							<caption>매장목록 - 매장명/주소, 전화번호, 영업시간, 이용가능 서비스 정보표</caption>
							<colgroup>
								<col style="width: 16%">
								<col style="width: 16%">
								<col style="width: 34%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">매장명 / 주소</th>
									<th scope="col">전화번호</th>
									<th scope="col">영업시간</th>
									<th scope="col">이용가능 서비스</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tdName">
										<dl class="name">
											<dt>
												<strong class="tit"><a href="javascript:moveMap(37.570698,126.983558);"	title="지도보기">한국맥도날드(유)</a></strong>
											</dt>
											<dd>서울 종로구 공평동 70</dd>
											<dd class="road">서울특별시 종로구 종로 51(종로타워)</dd>
										</dl>
									</td>
									<td>1600-5252</td>
									<td></td>
									<td class="tdService">
										<div class="service"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="noResult nobg">검색어를 입력해 주세요.</p>
				</div>
				<!-- //storeResult -->
			</div>
		</div>
	</div>
	<div class="aside">
		<a href="cart.do" class="goDelivery" title="새창 열림">Wcdelivery</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
</div>
<script>
$(document).ready(function () {

	function storeFindBg() {
		var winWidth = window.innerWidth;
		var $storeFind = $('.storeFind');
		var $storeFindBg = $storeFind.find('.storeFind_bg');
		var storeFindWidth = $storeFind.innerWidth();
		if (winWidth >= 1168) {
			$storeFindBg.css({
				'width' : winWidth,
				'margin-left' : -(winWidth - storeFindWidth) / 2
			});
		} else {
			$storeFindBg.attr({
				'style' : ''
			});
		}
	};
	storeFindBg();
	
	$(window).resize(function() {
		storeFindBg();
	});

	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new kakao.maps.LatLng(37.57056001779529,126.99046810138731),
		level : 3,
		mapTypeId: kakao.maps.MapTypeId.ROADMAP	//지도 종류
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
	
	var positions = [

		{
	        title: '윈도날드 종로3가점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.57056001779529,126.99046810138731)
	    },
		{
	        title: '윈도날드 서울동묘역점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.57311655456051,127.01510539116606)
	    },
		{
	        title: '맥도날드 명동점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.56416674801353,126.9844438972081)
	    },
		{
	        title: '맥도날드 병관점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.54458425362564,126.83157622677554)
	    },
		{
	        title: '맥도날드 규리점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.44656980118255,126.90116941328256)
	    },
		{
	        title: '맥도날드 도은점 WcDonald\'s', 
	        latlng: new kakao.maps.LatLng(37.59047879273179,126.67553501143038)
	    }
	];
	
	var markers = [];
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl,	kakao.maps.ControlPosition.RIGHT);
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	for (var i = 0; i < positions.length; i++) {

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(54, 70);

		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage("https://www.mcdonalds.co.kr/kor/images/store/ico_marker.png", imageSize);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title,	//마우스 올리면 제목부분 나옴
			image : markerImage
		// 마커 이미지 
		});
		marker.setMap(map);
		
		markers.push(marker);	//markers라는 변수안에 marker라는 마커를 집어넣음
	}
	// 클러스터러에 마커들을 추가합니다
	clusterer.addMarkers(markers);
	
	moveMap(37.57056001779529, 126.99046810138731);

	function moveMap(xx, yy) {
		var po = new kakao.maps.LatLng(xx, yy);
		map.panTo(po);
	}
	
	$('.mc_current').click(function(){
		if(confirm("위치정보의 사용시 보안된 페이지에서 위치정보을 요청합니다.\n이동하시겠습니까?")){
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		       var lat = position.coords.latitude, // 위도
		       lon = position.coords.longitude; // 경도
		       var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		       $("#lat").val(lat);
			   $("#lng").val(lon);
			   var marker = new kakao.maps.Marker({  
			        map: map, 
			        position: locPosition
			    }); 
			   marker.setMap(map);
		       map.panTo(locPosition);
		    });
		}else{
			if(getCookie("locate_info")=="Y"){
				if (navigator.geolocation) {
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        var lat = position.coords.latitude, // 위도
				        lon = position.coords.longitude; // 경도
				      	var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				      	var marker = new kakao.maps.Marker({  
					        map: map, 
					        position: locPosition
					    }); 
					    marker.setMap(map);
				        map.panTo(locPosition);
			            $("#lat").val(lat);
				        $("#lng").val(lon);
				        page(1);
			      	 });
				}else{
					alert("위치정보을 사용할수 없습니다");
				}
			}else{
				if(confirm("[위치정보 사용 동의]\n이 페이지에서\n현재 위치 정보를 사용하고자 합니다.\n동의하시겠습니까?")){
					setCookie("locate_info","Y",36500);
					if (navigator.geolocation) {
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				 	   navigator.geolocation.getCurrentPosition(function(position) {
					       var lat = position.coords.latitude, // 위도
					       lon = position.coords.longitude; // 경도
					       var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					       var marker = new kakao.maps.Marker({  
						       map: map, 
						       position: locPosition
						   }); 
						   marker.setMap(map);
					       map.panTo(locPosition);
				           $("#lat").val(lat);
					       $("#lng").val(lon);
				       });
					}else{
						alert("위치정보을 사용할수 없습니다");
					} 
				}
			}
		}
	});
		
	function setCookie( name, value, expiredays) { 
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	}
	function getCookie(cname) {
	    var name = cname + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    return "";
	}
	function altEscapeTag(){
		$("img").each(function (i,ob){
			$(ob).attr("alt",$(ob).attr("alt").replace(/(<([^>]+)>)/ig,""));
		});
	}
	
	$("#searchWord").on("keydown", function(event) {
		if (event.keyCode == 13) {
			search();
		}
	});
	
	function search(){
		for(var i = 0; i < positions.length; i++) {
			var searchWord = $("#searchWord").val();
			if(positions[i].title.indexOf(searchWord) > 0) {
				map.panTo(positions[i].latlng);
			}
		}
	};
	
	$("#storeSearch").click(function(){
		/* $("#page").val(1);
		$("#lat").val("NO");
		$("#lng").val("NO");
		go(); */
		search();
	});
		
	function page(page){
		$("#page").val(page);
		go();
	}
	function go(){
	    var search_options= [];
	    $('.storeFind .srvcFilter .service>span input:checked').each(function(index, item){
	    	search_options[index] = this.id;
	    });
		$("#search_options").val(search_options.join(","));
		$("#searchForm").attr("action","store.do");
		$("#searchForm").submit();
	}
	function gohttps(){
		$("#searchForm").attr("action","https://www.mcdonalds.co.kr/kor/store/list.do");
		$("#searchForm").submit();
	}
});
</script>
<%@ include file="footer.jsp"%>
    