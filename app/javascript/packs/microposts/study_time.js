var hours
var minutes
$(function() {
  hours = $('#micropost_how_many_studied_hours').val() * 60
  minutes = $('#micropost_how_many_studied_minutes').val()

  $('#micropost_how_many_studied_hours').change(function() {
    hours = $(this).val() * 60
  });
  $('#micropost_how_many_studied_minutes').change(function() {
    minutes = $(this).val();
  });
  $('#calculate_trigger').click(function() {
    var total = parseInt(hours) + parseInt(minutes)
    $("#micropost_studied_time_in_minutes").attr("value", total)
  })
});

// $("#user_my_choice_university").attr("value", selectedValue)