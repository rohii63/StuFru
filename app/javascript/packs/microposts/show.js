import bootstrap from "bootstrap/dist/js/bootstrap";
import 'moment/locale/ja';
import '../bootstrap-datetimepicker.min';
import {calculateStudyTime, dateTimePicker} from "../lib";

$(function() {
  calculateStudyTime();

  $("#editLink").click(function(){
    dateTimePicker();
  });
});