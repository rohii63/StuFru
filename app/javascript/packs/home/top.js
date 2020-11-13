import Tooltip from "bootstrap/js/src/tooltip";
import {calculateStudyTime} from "../lib";

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

  $("#topNavBar").on("mouseover", "#topNavLink", function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

  $("#postBtn")

  $('input:radio[name="user[target]"]').on('change', function(){
    $("#targetCreateBtn").prop("disabled", false);
  });

  calculateStudyTime();
})