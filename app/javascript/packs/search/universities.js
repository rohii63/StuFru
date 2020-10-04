$(function() {
  $("#university_search").on("keyup", function() {
    var keyword = $(this).val()
    
    $.ajax({
      url: location.href,
      type: "GET", 
      data: {keyword: keyword},
      dataType: "script"
    })
  });
})
