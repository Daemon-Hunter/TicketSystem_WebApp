/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    $('.logoImage').click(function() {
        window.location.href="/register.jsp/";
    });
    

    $(document).on("click", "#loadMoreButton", function() {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
    $.get("loadMore.do", function(responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
         $(".moreData").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
    });
});
  
     
     // Date range filter
   $(function() {
    $('input[name="dater"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    }, 
    function(start, end, label) {
        var years = moment().diff(start, 'years');
        alert("You are " + years + " years old.");
    });
});

 
  
});