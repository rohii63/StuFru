import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function() {
  navbarCollapse();
  
  var elem =  $("#my_choice_university_create_confirm_modal");

  if (elem[0]) {
    $("header").html("");
    $("#university_search").before("<p><h4>志望校を選択しよう！</h4></p>");
  };

  $("#university_search").on("keyup", function() {
    var keyword = $(this).val()
    
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {keyword: keyword},
      dataType: "script"
    })
  });
})
