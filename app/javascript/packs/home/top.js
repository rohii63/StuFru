import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";

$(function(){
  if ($("#targetCreateBtn")[0]) {
    $("#sidebar").html("");
    $("#navbarToggler").html("");
    $("#bottomNavBar").html("");
    $("#pageTitle").html("<i class='fab fa-font-awesome-flag text-primary'></i> 目標設定をしよう！");
    $("#topNavBar").removeClass("col-lg-7");
    $("#mainContainer").removeClass("col-lg-7");
    $("#topNavBar").addClass("col-lg-6 border-right");
    $("#mainContainer").addClass("col-lg-6 border-right border-bottom");
  } else {
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {layout: ""},
      dataType: "script"
    });
  };

  calculateStudyTime();

  $("body").on("click", ".postBtn", function(){
    dateTimePicker();
  });

  $('input:radio[name="user[target]"]').on('change', function(){
    $("#targetCreateBtn").prop("disabled", false);
  });
})