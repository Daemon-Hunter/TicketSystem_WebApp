/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    
     $(document).on("click", "#loadMoreButton", function() { 
        window.location.reload("debug.jsp");
    //$.get("loadMore.do", function(responseXml) {                
        // $(".moreData").html($(responseXml).find("data").html()); 
    //});
});
    
    $('.logoImage').click(function() {
        window.location.href="/register.jsp/";
    });
    

 
     // Date range filter
   $(function() {
    $('input[name="dater"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    }, 
    
});

 
  
});