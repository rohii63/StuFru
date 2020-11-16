import Modal from 'bootstrap/js/src/modal';
import Collapse from 'bootstrap/js/src/collapse';
import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import * as lib from "../lib";

$(function() {
  lib.calculateStudyTime();
  lib.navbarCollapse();

  $("#editLink").click(function(){
    lib.dateTimePicker();
  });

  $("#deleteBtn").click(function(){
    $("#deleteConfirmModal").modal('show');
  });
})