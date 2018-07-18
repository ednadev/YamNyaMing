$(document).ready(function() {
   $('table.sortable').each(function() {
     var $table = $(this);
	 
     $('th', $table).each(function(column) {
       var $header = $(this);
       if ($header.is('.sorting')) {
         $header.addClass('clickable').click(function() {
			
			var sortDirection = 1;			 
           var rows = $table.find('tbody > tr').get();
           rows.sort(function(a, b) {
             var keyA = $(a).children('td').eq(column).text().toUpperCase();
             var keyB = $(b).children('td').eq(column).text().toUpperCase();
             if (keyA < keyB) return sortDirection;
             return 0;
           });
           $.each(rows, function(index, row) {
             $table.children('tbody').append(row);
           });
		
		$table.find('th').removeClass('sorted-desc');
           if (sortDirection == 1) {
             $$header.addClass('sorted-desc');
           }
         });
       }
     });
   });
 });