/**
 * 
 */


	function editShow(showPId,inputId)
	{
		if(inputId.style.display=="none")
		{
			showPId.style.display="none";
			inputId.style.display="inline";
		}
		else{
			showPId.style.display="inline";
			inputId.style.display = "none";
		}
	}
	
	function storeInfoTapBtn(currentTap, tapType)
	{
		var storeDivArr = document.getElementsByClassName("store-info-div");
		for(var i = 0; i<storeDivArr.length;i++)
		{
			if(currentTap==i){
				storeDivArr[i].style.display = "block";
			}
			else storeDivArr[i].style.display="none";
		}
		$('#storeInfoTapBtn').val(tapType);
	}
	function deleteHeadPhoto(photoIndex)
	{
		var route = photoIndex + "_route"
		var photoRoute = $('#'+route).val();
		
		var name = photoIndex + "_name";
		var photoRemakeName = $('#'+name).val();
		
		var detail = photoIndex + "_detailPk";
		var detailPk = $('#' + detail).val();
		
		var headList = photoIndex + "_headList";
		var headPhotoList = $('#' + headList).val();
		
		$.ajax({
			url:"/storeHeadPhotoDelete.do",
			data : {
					photoIndex:photoIndex,
					photoRoute:photoRoute,
					photoRemakeName:photoRemakeName,
					detailPk:detailPk,
					headPhotoList:headPhotoList
				   },
			type : "post",
			success : function(data){	
				if(data=="delSuccess"){
					alert("사진을 삭제했습니다.");
					$('#'+route).remove();
					$('#'+name).remove();
					$('#' + detail).remove();
					$('#' + headList).remove();
					$('#' + photoIndex).remove();
				}else{
					alert("사진 삭제에 실패했습니다.");
				}
			},
			error : function(){
				console.log("실패");	
			}
		});
		
	}

	var sel_files=[];
	var html;
	function reviewFilesUpload(){
		$("#mainImage").trigger('click');
		$("#menuImage").trigger('click');
	}

	function reviewPhotoSelect(e){
		
//			$(".imgs_wrap").empty();
		
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
	
	function deleteImageAction(index){
		sel_files.splice(index,1);
		var img_id="#img_id_"+index;
		$(img_id).remove();
		
	}
	
	function menuInfoAdd(){
		var menuInfo = "";
		menuInfo = menuInfo + "<div class='menuInfo' id='menu-info-text'>"+
		            $('#menu-info-text').html()+"<button id='delButton' type='button' onclick='menuInfoDel();'>삭제</button></div>";
		$('#menuPriceInfo').append(menuInfo);
	}
	function menuInfoDel(){
		$('.menuInfo:last').remove();
	}
	function addMenuCategory()
	{
		if($('input[name=owMenuType]').val().length>0)
		{
			var menuSelect = document.getElementsByClassName("menuCategory");
			//menuSelectMain.add(option);
			for(var i = 0; i<menuSelect.length;i++){
				var option = document.createElement("option");
				option.selected = true;
				option.value =  $('input[name=owMenuType]').val();
				option.text = $('input[name=owMenuType]').val();
				menuSelect[i].add(option);
			} 
		}
		else
		{
			alert("메뉴 항목을 입력해주세요.");
		}
		
		$('input[name=owMenuType]').val("");
	}
	function removeMenuCategory()
	{
		var menuSelect = document.getElementsByClassName("menuCategory");
		for(var i = 0; i<menuSelect.length;i++){
			if(menuSelect[i].length>1){
				menuSelect[i].remove(menuSelect[i].selectedIndex);
			}
		}
	}
	
	function menuChangeMode(menuTapId)
	{
		var menuTapArr = document.getElementsByClassName("menuTapClass");
		for(var i = 0; i<menuTapArr.length;i++)
		{
			if(menuTapArr[i].id==menuTapId)
			{
				menuTapArr[i].style.display = "block";
			}else{
				menuTapArr[i].style.display = "none";
			}
		}
	}
	
	function newMenuAdd(storeIndex)
	{
		var menuCate = $("#menuCategoryTitle").val();
		var menu = 		$("#owRecommandMenu").val();
		var menuPrice = $("#owRecommandMenuPrice").val();
		var menuExplain = $("#menuDesc").val();
		var storeIndexValue =storeIndex;
		
		$.ajax({
			url:"/menuTextNewAdd.do",
			data : {
					menuCate:menuCate,
					menu:menu,
					menuPrice:menuPrice,
					menuExplain:menuExplain,
					storeIndex:storeIndexValue
				   },
			type : "post",
			success : function(data){
				var resultData = data;
				if(data.result=="success"){
					var resultTag =	'<div class="menuTapClass" id="menu_title_'+data.menuCate+'" name="menu_title_'+data.storeIndex+'" style="border:1px solid lightgray;">'
						+'<input type="hidden" name="menuIndex" value='+data.storeIndex+'>'
						+'메뉴 이름 : <input type="text" class="menu_edit_'+data.storeIndex+'" name="menuTitle" value="'+data.menuTitle+'" > <br>'
						+'메뉴 설명 : <input type="text" class="menu_edit_'+data.storeIndex+'" name="menuExplain" value="'+data.menuExplain+'" > <br>'
						+'메뉴 가격 : <input type="text" class="menu_edit_'+data.storeIndex+'" name="menuCost" value="'+data.menuCost+'" "><br>'
						+'<button type="button" id="menu_'+data.storeIndex+'" onclick="menuEditMode("menu_'+data.storeIndex+'","menu_edit_'+data.storeIndex+'")">메뉴 수정</button>'
						+'<button type="button" id="menu_'+data.storeIndex+'" onclick="menuTextDelete("menu_title_'+data.storeIndex+'", "'+data.storeIndex+'")">메뉴 삭제</button>'
						+'<button type="button" id="menu_edit_'+data.storeIndex+'" onclick="textMenuUpdate("'+data.storeIndex+'","menu_edit_'+data.storeIndex+'");" >수정 완료</button>'
						+'</div>';
					$('#enrollMenuList').append(resultTag);
					$("#owRecommandMenu").val("");
					$("#owRecommandMenuPrice").val("");
					$("#menuDesc").val("");
				}
				else{
					alert("메뉴 등록에 실패했습니다.");
				}
			},
			error : function(){
				console.log("실패");	
			}
		});
	}
	
	function menuEditMode(openGroup, closeGroup)
	{
		var openArr = document.getElementsByClassName(openGroup);
		var closeArr =document.getElementsByClassName(closeGroup);
		console.log(openArr.length + " " + closeArr.length);
		$('#'+openGroup).css('display','block');
		for(var i = 0; openArr.length;i++)
		{
			
			//openArr[i].setAttribute("display","block");
			//openArr[i].style.display = "block";
		}
		for(var i = 0; closeArr.length;i++)
		{
			closeArr[i].style.display = "none";
		}
		
	}
	
	function textMenuUpdate(menuIndex, updateInputClass)
	{
		var inputArr = document.getElementsByClassName(updateInputClass);
		var menuSubTitle = inputArr[0].value;
		var menuExplain = inputArr[1].value; 
		var menuCost = inputArr[2].value;
		
		$.ajax({
			url:"/textMenuUpdate.do",
			data : {
						menuIndex:menuIndex,
						menuSubTitle:menuSubTitle,
						menuExplain:menuExplain,
						menuCost:menuCost,
				   },
			type : "post",
			success : function(data){
				if(data==1)
				{
					alert("메뉴 업데이트 성공");
				}else{
					alert("메뉴 업데이트 실패");
				}
			},
			error : function(){
				console.log("실패");	
			}
		});
	}
	
	function menuTextDelete(menuTitle, menuTextIndex)
	{
		$.ajax({
			url:"/textMenuDelete.do",
			data : {
						menuIndex:menuTextIndex,
				   },
			type : "post",
			success : function(data){
				if(data=="success")
				{
					alert("메뉴 삭제 성공");
					document.getElementsByName(menuTitle)[0].remove();
				}else{
					alert("메뉴 삭제 실패");
				}
			},
			error : function(){
				console.log("실패");	
			}
		});
	}
	