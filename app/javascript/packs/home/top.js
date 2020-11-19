import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";

$(function(){
  if ($("#userTargetSaveBtnWrapper")[0]) {
    $("#sidebar").html("");
    $("#navbarToggler").html("");
    $("#bottomNavBar").html("");
    $("#pageTitle").html("<i class='fab fa-font-awesome-flag text-primary'></i> 目標設定をしよう！");
    $("#topNavBar").removeClass("col-lg-7");
    $("#mainContainer").removeClass("col-lg-7");
    $("#topNavBar").addClass("col-lg-6 border-right");
    $("#mainContainer").addClass("col-lg-6 border-right border-bottom");

    $('input:radio[name="user[target]"]').on('change', function(){
      $("body, html").animate({ scrollTop: $("body").get(0).scrollHeight }, 400);
      $("#userTargetSaveBtnWrapper").html("<input type='submit' name='commit' value='登録' class='btn btn-primary w-25' data-disable-with='登録'>");
    });
    } else {
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {layout: ""},
      dataType: "script"
    });
  };

  calculateStudyTime();

  $(".postBtnWrapper").on("click", ".postBtn", function(){
    dateTimePicker();
  });
})