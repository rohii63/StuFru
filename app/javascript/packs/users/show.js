
import 'select2'
import 'select2/dist/css/select2.css'

$(function () {
  $('#university').select2();
});

$(function() {
  $('#university').change(function() {
    var val = $(this).val();
    console.log(val);
    $("#user_my_choice_university").attr("value", val)
  });
});
// window.sendValue = function(){
//   var selectedValue = $("#university").val();
//   console.log(selectedValue)
//   $("#user_my_choice_university").attr("value", selectedValue)
// }