export function calculateStudyTime() {
  $("#micropostModal").on("click", "#btnPrimary",function() {
    var hours = $('#micropost_how_many_studied_hours').val() * 60;
    var minutes = $('#micropost_how_many_studied_minutes').val();
    var total = parseInt(hours) + parseInt(minutes);

    $("#micropost_studied_time_in_minutes").attr("value", total);
  });
}