/**
 * 
 */
var calendar;
var events = [];
$(document).ready(function() {
	bookListLoad();
});

function bookListLoad()
{
	var bookList="";
	$.ajax({
		url:"/bookListInStore.do",
		data : {
				storeIndex:'1',
				currentYear:'2018',
				currentMonth:'8'
		   },
		type : "post",
		success : function(data){
			for(var i = 0; i<data.length;i++)
			{
				events.push({
		            title:  data[i].title,
		            start: new Date(data[i].year,data[i].month,data[i].day,data[i].hour,data[i].minute),//data[i].start,
		            allDay: false
		          }); 
				console.log(data[i].hour);
			}
			
			calendar = $('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
			     // time formats
			    titleFormat: {
					month: 'yyyy년 MMMM',
					week: "yyyy년 MMMM d[ yyyy]{'일 ~'[ MMM] dd일 }",
					day: 'yyyy년 MMM d dddd'
			    },
			    columnFormat: {
					month: 'ddd',
					week: 'M/d ddd ',
					day: 'M월d일 dddd '
			    },
			    timeFormat: { // for event elements
					'': 'HH:mm', // 월간
					agenda: 'HH:mm{ - HH:mm}' // 주간,일간
			    },
			   
			    allDayText: '시간', // 주간,월간
			    axisFormat: 'tt hh', // 주간,월간
			    allDay : false,
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    buttonText: {
					prev: '&nbsp;<&nbsp;',
					next: '&nbsp;>&nbsp;',
					prevYear: '&nbsp;&lt;&lt;&nbsp;',
					nextYear: '&nbsp;&gt;&gt;&nbsp;',
					today: '오늘',
					month: '월간',
					week: '주간',
					day: '일간'
			    },
				selectable: true,
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
		            element.append( "<span class='closeon' style=' background-color: black; color: white;border-radius: 7px;'>예약 삭제</span>" );
		            element.find(".closeon").click(function() {
		               $('#calendar').fullCalendar('removeEvents',event._id);
		            });
		        },
				editable: true,
				events:events
			});
		},
		error : function(){
			console.log("실패");	
		}
	});
		
}