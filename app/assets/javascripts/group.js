$(document).ready(function(){
  $(".select2_search").select2({
    tags: true,
    closeOnSelect: false,
    placeholder: "Select Employees"
  });

  $('.employee_groups').click(function(){
    document.location.href=$(this).data("link");
  });
});
