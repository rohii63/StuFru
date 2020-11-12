import Tooltip from "bootstrap/js/src/tooltip";

$(function() {
  $.ajax({
    url: location.href,
    type: "GET", 
    data: {chart: ""},
    dataType: "script"
  });
  
  $("#fixedTop").on("mouseover", "#topNavLink", function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

  $("#weekTargetHeader").on("click", "#weekTargetNewBtn", function() {
    if ($("#whenWeekTargetAreaBlank")[0]) {
      $("<div id='btnWrap' class='col-4 mt-3 mb-5 mx-auto'><a id='bookSelectBtn' class='col btn btn-primary' data-toggle='modal' data-target='#bookSelectModal'>教材選択</a></div>").replaceAll("#whenWeekTargetAreaBlank");
      $(this).remove();
      
    } else {
      $("<a id='bookSelectBtn' class='btn btn-primary' data-toggle='modal' data-target='#bookSelectModal'>教材選択</a>").replaceAll(this);
    }
  });

  $("#v-pills-report").on("click", "#weekTargetNewCloseBtn", function() {
    $("#weekTargetForm").remove();
  });
});