// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require semantic-ui
//= require jquery.slick
//= require_tree .
// Loads all Semantic javascripts

var createSlick  = function(){
  $(".category-slick").slick({
    dots:true,
    infinite: true,
    slidesToShow:3,
    slidesToScroll: 1,
      responsive: [{
          breakpoint: 300,
          settings: {
              dots: false,
              arrows: false,
              infinite: false,
              slidesToShow: 2,
              slidesToScroll: 2
          }
      }]
  });
}

$(document).ready(function(){

  $('.ui.radio.checkbox')
    .checkbox()
  ;

  $('#preview').click(function(){
  	$('#clicky').modal('show');
  });

  $('.SocMe').click(function(){
  	$('#tool1').modal('show');
  });

  $('.LinkedIn').click(function(){
  	$('#tool2').modal('show');
  });

  $('.LowCQ').click(function(){
  	$('#tool3').modal('show');
  });

  $('.HighCQ').click(function(){
  	$('#tool4').modal('show');
  });


  $('#snapshot').each(function(){
  	var smallImage = 'url("../assets/'+($('#snapshot').attr('class')) + '")';
  	$('#snapshot').css('background-image', smallImage);
  });

  $('#sideMenu').hide();

  $('#browse').click(function(){
  	if ($('#sideMenu').css('display') == 'none'){
  	$('#sideMenu').show();
  	$('.banner').bind('click', false);
  	}else{
  	$('#sideMenu').hide();
  	$('.banner').unbind('click', false);
  	}
  });

  $('#content').click(function(){
  	if ($('#sideMenu').css('display') !== 'none'){
  	$('#sideMenu').hide();
  	$('.banner').unbind('click', false);
  	}else{
  	}
  });

  $('.banner').click(function(){
  	if ($('#sideMenu').css('display') !== 'none'){
  	$('#sideMenu').hide();
  	$('.banner').unbind('click', false);
  	}else{
  	}
  });
  $(document).scroll(function(){
  	$(".following.bar").attr('id','scrolled');

  	if ($(window).scrollTop() == 0) {
  	$(".following.bar").removeAttr('id');

  	}else{}

  });


});


$(document).ready(function(){
  createSlick();

  var clickOnVideoModal = function(){
     $('body').on('click', '.episode-video-modal-link', function(){
       $('#episode_video').modal('show');
     });
   }
   clickOnVideoModal();

});
