import Modal from 'bootstrap/js/src/modal';
import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function(){
  navbarCollapse();
  
  $("#newBtnWrapper").on("click", "#newBtn", function(){
    $("#bookNewModal").modal("show");
  });
})