var hours
var minutes
$(function() {
  $('#micropost_how_many_studied_hours').change(function() {
    hours = $(this).val() * 60
    console.log(hours);
  });
  $('#micropost_how_many_studied_minutes').change(function() {
    minutes = $(this).val();
    console.log(minutes);
  });
  $('input[name="commit"]').click(function() {
    if(hours == null){
      hours = 0
      $("#micropost_how_many_studied_hours").attr("value", hours)
    }
    if(minutes == null){
      minutes = 0
      $("#micropost_how_many_studied_minutes").attr("value", minutes)
    }
    var total = parseInt(hours) + parseInt(minutes)
    console.log(total)
    $("#micropost_studied_time_in_minutes").attr("value", total)
  })
});

// $("#user_my_choice_university").attr("value", selectedValue)