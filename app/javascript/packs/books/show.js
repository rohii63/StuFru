import Modal from 'bootstrap/js/src/modal';
import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function(){
  navbarCollapse();

  $("#editBtnWrapper").on("click", "#editBtn", function(){
    $("#bookEditModal").modal("show");
  });

  $("#registerBtnWrapper").on("click", "#registerBtn", function(){
    $("#bookRegisterModal").modal("show");
  });
})