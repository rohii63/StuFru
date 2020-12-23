import 'bootstrap/js/src/modal';
import 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../../src/lib";

$(function(){
  navbarCollapse();
  
  $("#newBtnWrapper").on("click", "#newBtn", function(){
    $("#bookNewModal").modal("show");
  });
})