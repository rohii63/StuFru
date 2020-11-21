import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function() {
  navbarCollapse();

  if ($("#my_choice_university_create_modal")[0]) {
    $("#sidebar").html("");
    $("#navbarToggler").html("");
    $("#bottomNavBar").html("");
    $("#pageTitle").html("<i class='fas fa-university text-primary'></i></i> 志望校を選択しよう！");
    $("#topNavBar").removeClass("offset-lg-4 offset-md-3 col-lg-5 col-md-7");
    $("#mainContainer").removeClass("offset-lg-4 offset-md-3 col-lg-5 col-md-7");
    $("#topNavBar").addClass("offset-sm-3 col-sm-6 border-right");
    $("#mainContainer").addClass("offset-sm-3 col-sm-6 border-right border-bottom");
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
