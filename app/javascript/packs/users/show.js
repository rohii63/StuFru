$(function () {
  btnProp = new Object();
  btnProp.type = "submit";
  btnProp.name = "commit";
  btnProp.value = "保存";
  btnProp.class = "btn btn-primary";

  $("#avatarEditModal").on(
    "change", 
    "#user_avatar", 
    function() {
      var val = $('#user_avatar').val();

      if (val == "") {
        $("#avatarUpdateBtn").html("");

      } else {
        $("#avatarUpdateBtn").html("<input></input>");
        $("#avatarUpdateBtn>input").prop(btnProp);
        
      };
    }
  );
});