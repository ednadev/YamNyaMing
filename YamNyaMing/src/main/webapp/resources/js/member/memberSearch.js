//지도API
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 
var search = "";
var placeNull = document.getElementById('place').value=='지역 선택';
var foodNull = document.getElementById('food').value=='음식 종류 선택';

if(placeNull&&foodNull){
	search = document.getElementById('keyword').value;
}else if(placeNull){
	search = document.getElementById('food').value + document.getElementById('keyword').value;
}else if(foodNull){
	search = document.getElementById('place').value + document.getElementById('keyword').value;
}else{
	search = document.getElementById('place').value + document.getElementById('food').value + document.getElementById('keyword').value;
}

// 키워드로 장소를 검색합니다
ps.keywordSearch(search + "맛집", placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
	
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
	
	// 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x),
        image : markerImage // 마커 이미지 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;color:black;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    }); 
    daum.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
    });    
    daum.maps.event.addListener(marker, 'click', function() {
    	location.href="detailPage.do?owStoreName="+place.place_name;
    });
}


//ajax를 이용하여 자세히 검색 기능


function check(){
	
	var storeCateDetailName = [];
	var owBudget = [];
	var owSubInfo = [];
	var owDrinkListInfo = [];
	
	//for문을 돌려서 check 된 값들을 배열에 담는다
	$("input[name='storeCateDetailName']:checked").each(function(i){
		storeCateDetailName.push($(this).val());
	});
	$("input[name='owBudget']:checked").each(function(i){
		owBudget.push($(this).val());
	});
	$("input[name='owSubInfo']:checked").each(function(i){
		owSubInfo.push($(this).val());
	});
	$("input[name='owDrinkListInfo']:checked").each(function(i){
		owDrinkListInfo.push($(this).val());
	});
	
	jQuery.ajaxSettings.traditional = true;

	jQuery.ajax({
		url:"/search.do",
		type:"GET",
		data:{storeCateDetailName:storeCateDetailName,owBudget:owBudget,owSubInfo:owSubInfo,owDrinkListInfo:owDrinkListInfo},
		success:function(data){
		}
	});
}