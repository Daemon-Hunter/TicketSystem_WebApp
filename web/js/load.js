/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    var btnMore = $("#loadMoreButton");
    btnMore.click(function () {
        alert("Trying to call servlet...");
        $.get("loadMore.do", function(responseXml){
            alert("The response was: " + responseXml);
            $('#moreData').html(responseXml);
        });
        
//        $.get("loadMore.do", function(responseXml) {                
//         $("#moreData").append($(responseXml).find("data").html()); 
//        });
    });
});