var hours
var minutes
$(function() {
  hours = $('#micropost_how_many_studied_hours').val() * 60
  console.log(hours);
  minutes = $('#micropost_how_many_studied_minutes').val()
  console.log(minutes);
  $('#micropost_how_many_studied_hours').change(function() {
    hours = $(this).val() * 60
    console.log(hours);
  });
  $('#micropost_how_many_studied_minutes').change(function() {
    minutes = $(this).val();
    console.log(minutes);
  });
  $('input[name="commit"]').click(function() {
    var total = parseInt(hours) + parseInt(minutes)
    console.log(total)
    $("#micropost_studied_time_in_minutes").attr("value", total)
  })
});

// $("#user_my_choice_university").attr("value", selectedValue)