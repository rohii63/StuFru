import Modal from 'bootstrap/js/src/modal';
import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";

$(function() {
  calculateStudyTime();

  $("#editLink").click(function(){
    dateTimePicker();
  });

  $("#deleteBtn").click(function(){
    $("#deleteConfirmModal").modal('show');
  });
});