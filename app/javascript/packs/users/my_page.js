$(function() {
  $("#weekTargetNewBtn").click(function() {
    $("#selectBook").html("<a data-toggle='modal' data-target='#bookSelectModal'>教材選択</a>");
    $(this).remove();
  });
});