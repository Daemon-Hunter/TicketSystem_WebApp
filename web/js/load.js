/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    var btnMore = $("#loadMoreButton");
    btnMore.click(function () {
        
        $.get("loadMore.do", function(responseXml){
            
            $('#moreData').html(responseXml);
        });
    });
    
});
