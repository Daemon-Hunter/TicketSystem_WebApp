/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    $('.logoImage').click(function() {
        window.location.href="/register.jsp/";
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