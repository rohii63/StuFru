import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function () {
  navbarCollapse();

  $("#avatarEditModal").on("change", "#user_avatar", function() {
    var val = $('#user_avatar').val();

    if (val == "") {
      $("#avatarUpdateBtn").html("");
    } else {
      $("#avatarUpdateBtn").html("<input type='submit' name='commit' class='btn btn-primary' value='保存'></input>");
    };
  });
});