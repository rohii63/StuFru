import {calculateStudyTime} from "../lib";

$(function(){
  if ($("#targetCreateBtn")[0]) {
    $("header").html("");
    $("<h4>目標ジャンルを設定しよう！</h4>").replaceAll("#headWord");
  };

  $('input:radio[name="user[target]"]').on('change', function(){
    $("#targetCreateBtn").prop("disabled", false);
  });

  calculateStudyTime();
})