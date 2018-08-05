/**
 * 
 */
$(document).ready(function() {
	console.log("시작");
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
				url: "/uploadBoardPhoto.do",
				data: data,
				cache: false,
				type: "POST",
				contentType: false,
				processData: false,
				success: function(url) {
					$('.summernote').summernote('insertImage', "https://pbs.twimg.com/media/DYG7gLDVoAAAig8.jpg");
				},error:function(){
					console.log("실패");
				}
			});

		}

	});
});