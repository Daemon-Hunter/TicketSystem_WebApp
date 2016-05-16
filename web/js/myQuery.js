/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    $(function () {
       
        alert("entering jquery");
        var buttonMore = $("#loadMoreSearchButton");
        buttonMore.click(function () {
            alert("We are now inside the click function");
            $.get("loadMoreSearch.do", function (responseXml) {
                alert(responseXml.toString());
                $('#moreData').html(responseXml);
            });
        });
//            $.get("loadMoreSearch.do", function (responseXml) {
//
//                $('.moreData').html(responseXml);
//            });
        
    });


    // Date range filter
    $(function () {
       
        $('input[name="dater"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    });


});