// 업종
var firstList = new Array("한식","중식","일식","양식","뷔페","디저트","술집","기타");

var finalList1 = new Array("백반,가정식","한정식","쌈밥","보리밥","비빔밥","죽","국밥","국수","냉면","막국수","찌개,전골","추어탕","감자탕","해장국","곰탕,설렁탕","갈비탕",
							"찜요리","구이요리","두부요리","볶음요리","해산물요리","생선회","칼국수,만두","전,빈대떡","족발,보쌈","고기요리","분식");
var finalList2 = new Array("중식당","양꼬치");
var finalList3 = new Array("일식당","일본식라면","돈가스","샤브샤브","오니기리","오므라이스","우동,소바","일식튀김,꼬치","초밥,롤","덮밥");
var finalList4 = new Array("스테이크,립","피자","햄버거","핫도그","후렌치후라이","샌드위치","브런치","해물,생선요리","프랑스음식","이탈리아음식","미국음식","멕시코음식","스페인음식",
							"그리스음식","터키음식","독일음식");
var finalList5 = new Array("한식뷔페","고기뷔페","해산물뷔페","일식,초밥뷔페","채식,샐러드뷔페");
var finalList6 = new Array("카페","베이커리","케이크전문","도넛","와플","호두과자","떡,한과");
var finalList7 = new Array("바","펍")
var finalList8 = new Array("패밀리레스토랑","아시아음식","베트남음식","인도음식","태국음식","도시락,컵밥","치킨,닭강정");

window.onload = function(){
	var firstSelect = document.getElementById("firstSelect");
	for(i=0; i<firstList.length;i++){
		var optionEl = document.createElement("option");
		optionEl.value = firstList[i];
		optionEl.appendChild(document.createTextNode(firstList[i]));
		firstSelect.appendChild(optionEl);
	}
}

function changeSelect(){
	var firstSelect = document.getElementById("firstSelect");
	var idx = firstSelect.options.selectedIndex;
	finalSelect(idx);
}
function finalSelect(idx){
	var finalSelect = document.getElementById("finalSelect");
	var data = null;
	
	if(idx==1){
		data = finalList1;
	}
	if(idx==2){
		data = finalList2;
	}
	if(idx==3){
		data = finalList3;
	}
	if(idx==4){
		data = finalList4;
	}	
	if(idx==5){
		data = finalList5;
	}	
	if(idx==6){
		data = finalList6;
	}	
	if(idx==7){
		data = finalList7;
	}	
	if(idx==8){
		data = finalList8;
	}		
	finalSelect.innerHTML = "";
	for(i=0;i<data.length;i++){
		var optionEl = document.createElement("option");
		optionEl.value = data[i];
		optionEl.appendChild(document.createTextNode(data[i]));
		finalSelect.appendChild(optionEl);
	}
	finalSelect.style.display = "";
}

// 메뉴 정보 - 가격 정보
$(document).ready(function(){
	$('#checkPrice').click(function(){
		if($(this).is(':checked')){
			$('input[name=owRecommandMenuPrice]').attr('disabled',true);
		}else{
			$('input[name=owRecommandMenuPrice]').attr('disabled',false);
		}
	});
});

