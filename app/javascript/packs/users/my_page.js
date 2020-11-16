import Tooltip from "bootstrap/js/src/tooltip";
import Modal from "bootstrap/js/src/modal";

$(function() {
  $.ajax({
    url: location.href,
    type: "GET", 
    data: {chart: ""},
    dataType: "script"
  });
  
  $("#topNavBar").on("mouseover", "#topNavLink", function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

  $("#weekTargetHeader").on("click", "#createBtn", function() {
    if ($("#whenWeekTargetAreaBlank")[0]) {
      $("<div id='bookSelectBtnWrapper' class='col-4 mt-3 mb-5 mx-auto'><div id='bookSelectBtn' class='col btn btn-primary'>教材選択</div></div>").replaceAll("#whenWeekTargetAreaBlank");
      $(this).remove();
      
    } else {
      $("<div id='bookSelectBtn' class='btn btn-primary'>教材選択</div>").replaceAll(this);
    }
  });

  $("#v-pills-report").on("click", "#bookSelectBtn", function(){
    $("#bookSelectModal").modal("show");

    $("#book_select_modal").on("click", "#weekTargetNewBtn", function(){
      $("#bookSelectModal").modal("hide");
    });
  });
});