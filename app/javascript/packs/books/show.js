import Modal from 'bootstrap/js/src/modal';

$(function(){
  $("#editBtnWrapper").on("click", "#editBtn", function(){
    $("#bookEditModal").modal("show");
  });

  $("#registerBtnWrapper").on("click", "#registerBtn", function(){
    $("#bookRegisterModal").modal("show");
  });
})