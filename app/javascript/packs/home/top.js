import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";
import Collapse from 'bootstrap/js/src/collapse';

$(function(){
  if ($("#userTargetSaveBtnWrapper")[0]) {
    $("#sidebar").html("");
    $("#navbarToggler").html("");
    $("#bottomNavBar").remove();
    $("#pageTitle").html("<i class='fab fa-font-awesome-flag text-primary'></i> 目標設定をしよう！");
    $("#topNavBar").removeClass("offset-lg-4 offset-md-3 col-lg-5 col-md-7");
    $("#topNavBar").addClass("offset-lg-3 col-lg-6 border-right");
    $("#mainContainer").removeClass("offset-lg-4 offset-md-3 col-lg-5 col-md-7");
    $("#mainContainer").addClass("offset-lg-3 col-lg-6 border-right border-bottom");

    $('input:radio[name="user[target]"]').on('change', function(){
      $("body, html").animate({ scrollTop: $("body").get(0).scrollHeight }, 400);
      $("#userTargetSaveBtnWrapper").html("<input type='submit' name='commit' value='登録' class='btn btn-primary w-25' data-disable-with='登録'>");
    });

    $('.collapse').collapse({
      toggle: false
    });

    for (let i = 1; i < 9; i++) {
      $("#mainContainer").on("click", "#targetNavbarToggler" + i, function(){
        $("#targetNavbar" + i).collapse("toggle");
      });
    };
    
    } else {
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {layout: ""},
      dataType: "script"
    });
  };

  calculateStudyTime();

  $("#bottomNavBar, #sideNavList, #postBtnWrapper").on("click", ".postBtn", function(){
    dateTimePicker();
  });
})