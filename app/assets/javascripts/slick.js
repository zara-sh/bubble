    $(document).ready(function(){
 $('.slider-for').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.slider-nav'
});

$('.slider-nav').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  asNavFor: '.slider-for',
  dots: true,
  centerMode: true,
  focusOnSelect: true,
    arrows: true
});

 $('.slider-for-less').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.slider-nav-less'
});

$('.slider-nav-less').slick({
  slidesToShow: 2,
  slidesToScroll: 1,
  asNavFor: '.slider-for-less',
  dots: true,
  centerMode: true,
  focusOnSelect: true,
    arrows: true
});

    });



   $(window).on('resize load', function () {
          if ( $(window).width() < 739) {
    $('.center').slick({
  centerMode: true,
  centerPadding: '40px',
  slidesToShow: 1,
  responsive: [
    {
      breakpoint: 319,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '30px',
        slidesToShow: 1
      }
    },
    {
      breakpoint: 300,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '30px',
        slidesToShow: 1
      }
    }
  ]
});
    } else {
          $('.center').slick({
  centerMode: true,
  centerPadding: '60px',
  slidesToShow: 2,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});
      }


   });


