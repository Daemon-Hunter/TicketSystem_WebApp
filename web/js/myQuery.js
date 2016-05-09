/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    
     $(document.body).on('click', '#loadMoreButton', function() {
        
        $.get("loadMore.do", function(responseXml) {                
         $("#moreData").append($(responseXml).find("data").html()); 
        });
    });
  

     // Date range filter
   $(function() {
    $('input[name="dater"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    });
    
    });

 
  
});