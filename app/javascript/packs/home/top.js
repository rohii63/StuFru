import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";

$(function(){
  if ($("#targetCreateBtn")[0]) {
    $("header").html("");
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