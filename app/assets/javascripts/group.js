$(document).ready(function(){
  $(".select2_search").select2({
    tags: true,
    closeOnSelect: false,
    placeholder: "Select Employees"
  });

  $('.employee_groups').click(function(){
    document.location.href=$(this).data("link");
  });

  $(".select2_groups").select2({
    tags: true,
    closeOnSelect: false,
    placeholder: "Select Groups"
  });

  $(".select2_employees").select2({
    tags: true,
    closeOnSelect: false,
    placeholder: "Select Employees"
  });  

  $(".select2_question_search").select2({
    tags: true,
    closeOnSelect: false,
    placeholder: "Select Employees"
  });  
});
