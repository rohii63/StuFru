import Modal from 'bootstrap/js/src/modal';

$(function(){
  $("#newBtnWrapper").on("click", "#newBtn", function(){
    $("#bookNewModal").modal("show");
  });
})