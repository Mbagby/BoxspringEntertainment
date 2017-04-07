var createSlick  = function(){
  $(".category-slick").slick({
    dots:true,
    infinite: true,
    slidesToShow:3,
    slidesToScroll: 1,
      responsive: [{
          breakpoint: 500,
          settings: {
              dots: false,
              arrows: true,
              infinite: false,
              slidesToShow: 2,
              slidesToScroll: 2
          }
      }]
  });
}

var createEpisodeSlick  = function(){
  $(".episode-slick").slick({
    dots:true,
    infinite: true,
    slidesToShow:4,
    slidesToScroll: 1,
      responsive: [{
          breakpoint: 500,
          settings: {
              dots: false,
              arrows: true,
              infinite: false,
              slidesToShow: 2,
              slidesToScroll: 2
          }
      }]
  });
}

$(document).ready(function(){
  createSlick();
  createEpisodeSlick();
  var clickOnVideoModal = function(){
     $('body').on('click', '.episode-video-modal-link', function(){
       $('#episode_video').modal('show');
     });
   }
   clickOnVideoModal();

});
