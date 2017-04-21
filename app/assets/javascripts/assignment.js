$(document).ready(function(){
  $(document).on("change", "#select_content_name", function(){
    var content_name = $("#select_content_name").val();
    $.ajax({
      type: "GET",
      url: "/assignments/select_content",
      data: {content_name: content_name},    
      success: function (data) {
      }
    });
  });
});