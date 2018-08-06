var calendar;
var events = [];
var bookMap;
$(document).ready(function() {
	bookMap = new Map();
	watingListLoad();
	bookListLoad();
});

function watingListLoad()
{
	$.ajax({
		url:"/bookListInStore.do",
		data : {
				bookType:'s',
				currentYear:'2018',
				currentMonth:'8'
		   },
		type : "post",
		success : function(data){
			$('#waitingList').html("");
			for(var i = 0; i<data.length;i++)
			{
				bookMap.set(i, data);
				var tempWating ="";
				if(i>0)tempWating+='<a href="#" class="bookCard"><ul id="bookInfo">';
				else tempWating +='<a href="#" id="bookCard-first"><ul id="bookInfo">'
				tempWating +=
				'<li style="width:10%;"><h3>대기 번호 : '+ data[i].myOrder+'</h3></li>'+
				'<li style="width:45%;"><h3>'+ data[i].title.split("-")[0]+'</h3></li>'+
				'<li style="width:15%;"><button class="watinInnerBtn" onclick="callNext();"><h2>'+data[i].bookState+'</h2></button></li>'+
				'<li style="width:15%;"><button class="watinInnerBtn" id="'+i+'_ready"><h2>입장 대기로 전환</h2></button></li>'+
				'<li style="width:15%;"><button class="watinInnerBtn" id="'+i+'"><h2>예약 취소</h2></button></li>'+
				'</ul></a>';
				$('#waitingList').append(tempWating);
				
				var titleTemp = bookMap.get(i)[i].title.split("-")[0];
				var indexTemp = bookMap.get(i)[i].id;
				
				$('#'+i).click(function(){
					var deleteConfirm = confirm(titleTemp + "을 취소 하시겠습니까?");
			    	if(deleteConfirm)
					{
			    		$.ajax({
			    			url:"/bookCancelOwner.do",
			    			data : {
			    					bookIndex:indexTemp,
			    					bookState:'f',
			    					bookOption:"점주가 취소했습니다."
			    			   },
			    			type : "post",
			    			success : function(data){
			    				if(data==1){
			    					$('#calendar').fullCalendar('removeEvents',event._id);
			    					watingListLoad();
			    				}
			    				else{
			    					alert("예약 삭제에 실패했습니다.");
			    				} 
			    			},
			        		error : function(){
			        			console.log("실패");	
			        		}
			        	});
					}
				});
				$('#'+i +'_ready').click(function(){
					console.log("예약대기상태");
		    		$.ajax({
		    			url:"/bookCancelOwner.do",
		    			data : {
		    					bookIndex:indexTemp,
		    					bookState:'r',
		    					bookOption:"입장 대기 상태입니다."
		    			   },
		    			type : "post",
		    			success : function(data){
		    				if(data==1){
		    					$('#calendar').fullCalendar('removeEvents',event._id);
		    					watingListLoad();
		    				}
		    				else{
		    					alert("예약 삭제에 실패했습니다.");
		    				} 
		    			},
		        		error : function(){
		        			console.log("실패");	
		        		}
		        	});
				});
//				var nowDate = new Date();
//				setTimeout(function(){
//						$.ajax({
//			    			url:"/bookWaitTimerSet.do",
//			    			data : {
//			    					bookIndex:indexTemp,
//			    					bookState:'w',
//			    					bookOption:"점주가 취소했습니다."
//			    			   },
//			    			type : "post",
//			    			success : function(data){
//			    				if(data==1){
//			    					watingListLoad();
//			    				}
//			    				else{
//			    					alert("예약 상태 변경에 실패했습니다.");
//			    				} 
//			    			},
//			        		error : function(){
//			        			console.log("실패");	
//			        		}
//			        	});
//					}, new Date(data[i].start).getTime() - nowDate.getTime()
//				);
			}
			console.log(bookMap.get(0));
		},
		error : function(){
			console.log("실패");	
		}
	});
}

function bookListLoad()
{
	var bookList="";
	$.ajax({
		url:"/bookListInStore.do",
		data : {
				bookType:'g',
				currentYear:'2018',
				currentMonth:'8'
		   },
		type : "post",
		success : function(data){
			for(var i = 0; i<data.length;i++)
			{
				events.push({
					id:data[i].id,
		            title:  data[i].title,
		            start: new Date(data[i].start),//.year,data[i].month,data[i].day,data[i].hour,data[i].minute),//data[i].start,
		            allDay: false
		          }); 
			}
			
			 $('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
			    allDayText: '시간', // 주간,월간
			    axisFormat: 'tt hh', // 주간,월간
			    allDay : false,
			    eventLimit: true, 
			    navLinks: true, // can click day/week names to navigate views
			    selectable: true,
			    selectHelper: true,
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    buttonText: {
					prev: '이전달',
					next: '다음달',
					prevYear: '&nbsp;&lt;&lt;&nbsp;',
					nextYear: '&nbsp;&gt;&gt;&nbsp;',
					today: '오늘',
					month: '월간',
					week: '주간',
					day: '일간'
			    },
				selectable: false,
				selectHelper: true,
				select: function(start, end) {
					var title = prompt('Event Title:');
					if (title) {
						calendar.fullCalendar('renderEvent',
							{
								title: title,
								start: start,
								end: end, 
								allday:false
							},
							true // make the event "stick"
						);
					}
					calendar.fullCalendar('unselect');
				},
		         eventRender: function(event, element) {
		            element.append( "<div class='fc-content'><span class='fc-title' style=' background-color: #cecece; color: white;border-radius: 7px; width:100%;'>예약 삭제</span></div>" );
		            element.find(".fc-title").click(function() {
		            	var bookIndex =element[0].children[0].children[1].children[0].children[0].innerHTML;
		            	var bookTitle = bookIndex.split("-")[0];
		            	bookIndex = bookIndex.split("-")[1];
		            	
		            	var deleteConfirm = confirm(bookTitle + "을 취소 하시겠습니까?");
		            	if(deleteConfirm)
		        		{
		            		$.ajax({
		            			url:"/bookCancelOwner.do",
		            			data : {
		            					bookIndex:bookIndex
		            			   },
		            			type : "post",
		            			success : function(data){
		            				if(data==1){
		            					$('#calendar').fullCalendar('removeEvents',event._id);
		            					bookListLoad();
		            				}
		            				else{
		            					alert("예약 삭제에 실패했습니다.");
		            				} 
		            			},
		                		error : function(){
		                			console.log("실패");	
		                		}
		                	});
		        		}
		            });
		        },
				editable: false,
				events:events
			});
		},
		error : function(){
			console.log("실패");	
		}
	});
	
	
	function deleteBook(bookTitle, bookIndex, delType )
	{
		var deleteConfirm = confirm(bookTitle + "을 취소 하시겠습니까?");
    	if(deleteConfirm)
		{
    		$.ajax({
    			url:"/bookCancelOwner.do",
    			data : {
    					bookIndex:bookIndex
    			   },
    			type : "post",
    			success : function(data){
    				if(data==1){
    					$('#calendar').fullCalendar('removeEvents',event._id);
    					if(delType==0) watingListLoad();
    					else bookListLoad();
    				}
    				else{
    					alert("예약 삭제에 실패했습니다.");
    				} 
    			},
        		error : function(){
        			console.log("실패");	
        		}
        	});
		}
	}
}