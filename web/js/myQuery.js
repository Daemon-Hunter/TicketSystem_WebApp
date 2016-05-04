/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    $('.logoImage').click(function() {
        window.location.href="/register.jsp/";
    });
    
    
        $('#loadMoreButton').click(function(event) {  
        var $amount=6;
           $.get('loadMore.do',{loadindex:$amount},function(responseJson) {   
            var $select = $('.moreData');                           
               //Response   
                $('.moreData').append('<c:forEach end="11" items="${moreEvents}" var="event">\n\
            <div class="content"> </div> \n\
                </c:forEach>');                    
               $.each(responseJson, function(key, value) {      
                    $('.content').append('<div class="col-lg-2  newEventGallery"> \n\
                <a href="event.do?eventdata=${event.ID}">\n\
                <img class="eventImage" src="Image?type=event&id=${event.ID}">\n\
               <div class="underImageInfo">\n\
                <div class="boxName"> ${event.name} </div> \n\
                <div class="boxChildren">  </div>\n\
                </div>\n\
                  </a>\n\
                </div>  ') ;     
                  
                                        
                  // $('<option>').val(key).text(value).appendTo($select);      
                  //  });
            });
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