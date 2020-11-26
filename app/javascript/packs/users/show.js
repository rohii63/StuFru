import Collapse from 'bootstrap/js/src/collapse';

$(function () {
  $('.collapse').collapse({
    toggle: false
  });

  $("#topNavBar").on("click", "#navbarToggler", function(){
    $("#navbarCollapse").collapse("toggle");
  });

  for (let i = 1; i < 9; i++) {
    $("#target_area").on("click", "#targetNavbarToggler" + i, function(){
      $("#targetNavbar" + i).collapse("toggle");
    });
  };

  $("#avatar_area").on("change", "#user_avatar", function() {
    var val = $('#user_avatar').val();

    if (val == "") {
      $("#avatarUpdateBtn").html("");
    } else {
      $("#avatarUpdateBtn").html("<input type='submit' name='commit' class='btn btn-primary' value='保存'></input>");
    };
  });
});