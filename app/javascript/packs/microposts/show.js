import 'bootstrap/js/src/modal';
import 'bootstrap/js/src/collapse';
import 'moment/locale/ja';
import '../../src/bootstrap-datetimepicker.min';
import * as lib from "../../src/lib";

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