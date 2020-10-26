export function calculateStudyTime() {
  var hours = $('#micropost_how_many_studied_hours').val() * 60;
  var minutes = $('#micropost_how_many_studied_minutes').val();
  
  $('#micropost_how_many_studied_hours').on("change", function() {
    hours = $(this).val() * 60;
  });

  $('#micropost_how_many_studied_minutes').on("change", function() {
    minutes = $(this).val();
  });

  $('#btnPrimary').on("click", function() {
    var total = parseInt(hours) + parseInt(minutes);
    $("#micropost_studied_time_in_minutes").attr("value", total);
  });
}