
import 'select2'
import 'select2/dist/css/select2.css'

$(function () {
  $('#university').select2();
});

window.sendValue = function() {
  var selectedValue = $("#university").val();
  console.log(selectedValue)
  $("#user_my_choice_university").attr("value", selectedValue)
}

// $(function() {
//   $("#btn-a").click(
//     function () {
//       var btn = $('#btn-a').val();
//       console.log( btn );
//     }
//   )
// })
