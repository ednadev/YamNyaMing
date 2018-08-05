/**
 * 
 */
var calendar;
var waitingList;
var events = [];

$(document).ready(function() {
	bookListLoad();

});



function bookListLoad()
{
	waitingList = $('#waitingList');
	var bookList="";
	$.ajax({
		url:"/bookListInStore.do",
		data : {
				currentYear:'2018',
				currentMonth:'8'
		   },
		type : "post",
		success : function(data){
			for(var i = 0; i<data.length;i++)
			{
				if(data[i].bookType=='s'){
					events.push({
						id:data[i].id,
			            title:  data[i].title,
			            start: new Date(data[i].start),//.year,data[i].month,data[i].day,data[i].hour,data[i].minute),//data[i].start,
			            allDay: false
			          }); 
				}else
				{
					var tempWating = '<ul>'+
					'<li><a href="/ownerInfo.do">정보 관리</a></li>'+
					'<li><a href="/ownerInfo.do">정보 관리</a></li>'+
					'<li><a href="/ownerInfo.do">정보 관리</a></li>'+
					'<li><a href="/analysisOwner.do">통계 관리</a></li>';
					watingList.append(tempWating);
				</ul>
				}
			}
			
			calendar = $('#calendar').fullCalendar({
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
		
}