/**
 * 
 */

 

function resultStyleChk(resultChk,chk)
{
	if(!chk)resultChk.css('color','red');
	else resultChk.css('color','lightgreen');
}

function owStoreBizCheck()
{
	var insertStore = $('input[name=owStoreBizNum]').val();
	var resultP = $("#owStoreBizNumResult");
	var result = true;
	
	var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
    var tmpBizID, i, chkSum=0, c2, remander;
     
    insertStore = insertStore.replace(/-/gi,'');
 
    for (i=0; i<=7; i++) {
        chkSum += checkID[i] * insertStore.charAt(i);
    }
 
    c2 = "0" + (checkID[8] * insertStore.charAt(8));
    c2 = c2.substring(c2.length - 2, c2.length);
    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
    remander = (10 - (chkSum % 10)) % 10 ;
 
    if (Math.floor(insertStore.charAt(9)) == remander) {
    	resultP.html("유효한 사업자 등록 번호입니다.");
        result = true ; // OK!
    } else {
    	resultP.html("유효하지 않은 사업자 등록 번호입니다.");
        result = false;
    }

    if(insertStore.length==0)
	{
    	resultP.html("사업자 번호를 입력해주세요");
        result = false;
	}
    
    resultStyleChk(resultP, result);
   
    return result;
}

function owStoreNameCheck()
{
	var insertStoreName = $('input[name=owStoreName]').val();
	var resultP = $("#owStoreNameResult");
	var result = true;
	
	if(insertStoreName.length==0)
	{
    	resultP.html("상호명을 입력해주세요");
        result = false;
	}
	else
	{
		resultP.html("완료");
	}
	resultStyleChk(resultP, result);	   
    return result;
}

function telCheck()
{
	var telList = "02,051,053,032,062,042,052,044,031,033,041,043,061,063,054,055,064";
	var telRegion = "서울,부산,대구,인천,광주,대전,울산,세종,경기,강원,충남,충북,전남,전북,경북,경남,제주";
	
	var selectRegionTel = $('select[name=regionTel]').val();
	var insertStoreName = $('input[name=owTel]').val();
	var resultP = $("#owStoreTel");
	
	var regNumber = /^[0-9]*$/;
	var result = true;
	  
	if(!regNumber.test(selectRegionTel + insertStoreName)) {
		resultP.html("숫자만 입력해주세요");
		result = false;
	}
	else{
		resultP.html("확인");
	}
	if(insertStoreName.length<4)
	{
		resultP.html("전화번호 뒷자리를 입력해주세요");
		result = false;
	}
	
	resultStyleChk(resultP, result);
	return result;
}

function storeAddress() {
	  var ownerResult = $('#addressOwner');
	  $('#storePostCode').blur();
	  var result = true;
      var daumAddr = new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
              var extraRoadAddr = ''; // 도로명 조합형 주소 변수

              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraRoadAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraRoadAddr !== ''){
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
              }
              // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
              if(fullRoadAddr !== ''){
                  fullRoadAddr += extraRoadAddr;
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('storePostCode').value = data.zonecode; //5자리 새우편번호 사용
              document.getElementById('storeRoadAddr').value = fullRoadAddr;
              document.getElementById('storeJibunAddr').value = data.jibunAddress;

              // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
              if(data.autoRoadAddress) {
                  //예상되는 도로명 주소에 조합형 주소를 추가한다.
                  var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

              } else if(data.autoJibunAddress) {
                  var expJibunAddr = data.autoJibunAddress;
                  document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

              } else {
                  document.getElementById('guide').innerHTML = '';
              }
          	  if( document.getElementById('storePostCode').length==0 ||
          		document.getElementById('storeRoadAddr').length==0 ||
          		document.getElementById('storeJibunAddr').length==0)
			  {
				result = false;	
			  }
	          ownerResult.html("주소입력");
	          $('#storePostCode').blur();
          }
      }).open();
  }

function keyWord()
{
	var tipArr = document.getElementsByName("owStoreTip");
	var resultTip = $("#tipResult");
	var result = false;
	for(var i = 0; i<tipArr.length;i++)
	{
		if(tipArr[i].value.lengh>0){
			result=true;
			break;
		}
	}
}

var sel_files=[];
var html;
$(document).ready(function(){
	$("#mainImage").on("change",reviewPhotoSelect);
	$("#menuImage").on("change",menuPhotoSelect);
});

function reviewFilesUpload(){
	$("#mainImage").trigger('click');
	$("#menuImage").trigger('click');
}

function reviewPhotoSelect(e){
	
//	$(".imgs_wrap").empty();
	
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	var index=sel_files.length;
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		if(sel_files.length<30){
			sel_files.push(f);
			
			var reader=new FileReader();
			reader.onload=function(e){
				html="<a href=\"javascript:void(0);\"  onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img style='width:120px; height:120px;' src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
				$(".imgs_wrap").append(html);
				index++;
			}
			reader.readAsDataURL(f);
		}else
		{
			alert("대표 사진은 30개 이하만 등록할수 있습니다.");
		}
	});
}
function menuPhotoSelect(e){
	
//	$(".imgs_wrap").empty();
	
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	var index=sel_files.length;
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		if(sel_files.length<30){
			sel_files.push(f);
			
			var reader=new FileReader();
			reader.onload=function(e){
				html="<a href=\"javascript:void(0);\"  onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img style='width:120px; height:120px;' src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
				$(".imgs_wrap_menu").append(html);
				index++;
			}
			reader.readAsDataURL(f);
		}else
		{
			alert("대표 사진은 30개 이하만 등록할수 있습니다.");
		}
	});
}
function deleteImageAction(index){
	sel_files.splice(index,1);
	var img_id="#img_id_"+index;
	$(img_id).remove();
	
}


function menuTypeChange(menuType)
{
	var menuArr = document.getElementsByClassName('menu-type');
	var menuTypeArr = document.getElementsByClassName('menuInfo');
	

	for(var j = 0; j<menuTypeArr.length;j++)
	{
		menuTypeArr[j].style.display = 'none';
		if(menuType==menuArr[0])// 이미지 메뉴 등록 눌렀을때 
		{
			$('#storeMenuTypeId').val("1");
			menuTypeArr[0].style.display = 'block';
		}else{  // 직접 메뉴 등록 눌렀을때
			$('#storeMenuTypeId').val("2");
			if(j>0) menuTypeArr[j].style.display = 'block';
		}
	}
	
	for(var i = 0; i<menuArr.length;i++)
	{
		if(menuType==menuArr[i]){
			menuType.id='menu-info-type-click';
		}
		else
		{
			menuArr[i].id="menu-info-type";
		}
	}
}


