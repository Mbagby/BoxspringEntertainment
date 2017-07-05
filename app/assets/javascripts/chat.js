$(document).on('click', '.panel-heading span.icon_minim', function (e) {
  var $this = $(this);
  if (!$this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideUp();
    $this.addClass('panel-collapsed');
    $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
  } else {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
  }
});
$(document).on('focus', '.panel-footer input.chat_input', function (e) {
  var $this = $(this);
  if ($('#minim_chat_window').hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideDown();
    $('#minim_chat_window').removeClass('panel-collapsed');
    $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
  }
});
$(document).on('click', '#new_chat', function (e) {
  var size = $( ".chat-window:last-child" ).css("margin-left");
  size_total = parseInt(size) + 400;
  alert(size_total);
  var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
  clone.css("margin-left", size_total);
});

$(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
  $( "#chat_window_1" ).remove();
});

$(document).on('click', '#btn-chat', function(){
  var message = $('.chat_input').val();
  var message_length = message.length;
  if(message_length > 0){
    var clone = $('.msg_container_base').children('.base_sent').last().clone();
    $('.msg_p',clone).html(message);
    $('.msg_container_base').append(clone); 
    $('.chat_input').val(''); 
    $.ajax({
      url: '/dashboard/send_message',
      type: 'POST',
      dataType: 'script',
      data: {message: message},
      success: function(response){

      },
      error: function(response){

      }
    })
  }
  else{
    alert('Please enter text to chat');
  }
});