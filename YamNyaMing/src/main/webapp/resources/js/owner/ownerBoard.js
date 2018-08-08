/**
 * 
 */

var boardTap;
$(document).ready(function() {
	console.log("새로고침");
	boardTap = document.getElementsByClassName("board-area");
	console.log(boardTap);
	boardTap[0].style.display = "block";
	boardTap[1].style.display = "none";
	$(function() {
		$('.summernote').summernote({
			height: 200,
			tabsize: 2,
			toolbarContainer : "#toolbar",
			callbacks: {
				onImageUpload: function(files) {
					for(var i = 0; i<files.length; i++)
					{
						sendFile(files[i]);
					}

				}
			}

		});
		function sendFile(file) {
			var data = new FormData($('#summernote-form'));
			data.append("file", file);
			console.log(data);
			$.ajax({
				url: "/adminPhoto.do",
				data: data,
				cache: false,
				type: "POST",
				contentType: false,
				processData: false,
				success: function(callBack) {
					console.log(callBack.result);
					if(callBack.result=="successPhoto"){
						$('.summernote').summernote('insertImage', callBack.src);//"https://pbs.twimg.com/media/DYG7gLDVoAAAig8.jpg");
					}
				},error:function(){
					console.log("실패");
				}
			});

		}

	});
});

function boardWrite()
{
	boardTap[0].style.display = "none";
	boardTap[1].style.display = "block";
}