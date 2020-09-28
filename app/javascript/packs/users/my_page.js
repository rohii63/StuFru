$(function() {
  $.ajax({
    url: location.href,
    type: "GET", 
    data: {chart: "view"},
    dataType: "script"
  })

  $("[aria-labelledby='v-pills-report-tab']").on("click", "#weekTargetNewBtn", function() {
    $("#selectBook").html("<a data-toggle='modal' data-target='#bookSelectModal'>教材選択</a>");
    $("#whenWeekTargetAreaBlank").remove();
    $(this).remove();
  });

  $("#weekTargetArea").on("click", "a", function() {
    $(this).empty();
  })
});