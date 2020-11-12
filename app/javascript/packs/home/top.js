import Tooltip from "bootstrap/js/src/tooltip";
import {calculateStudyTime} from "../lib";

$(function(){
  if ($("#targetCreateBtn")[0]) {
    $("header").html("");
  } else {
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {navbar: ""},
      dataType: "script"
    });
  };

  $("#fixedTop").on("mouseover", "#topNavLink", function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

  $('input:radio[name="user[target]"]').on('change', function(){
    $("#targetCreateBtn").prop("disabled", false);
  });

  calculateStudyTime();
})