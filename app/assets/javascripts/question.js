$(document).ready(function(){
  $(document).on('click', ".option_is_true", function(){
    $(".option_is_true").prop('checked', false);
    $(this).prop('checked', true);
  });
});