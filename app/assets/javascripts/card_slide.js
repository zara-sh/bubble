// $(document).ready(function(){
//   $(".card-container").mouseover(function(){
//    $(".card-slide").stop().slideDown("slow");
//   });
//   $(".card-container").mouseout(function(){
//    $(".card-slide").slideUp("slow");
//   });
//  });

window.addEventListener('load', function () {
    $('.card-footer').slideDown(1);
    $('.booked_dates').slideUp(1);
}, false);
// window.onload("load", function(){


$('.card-footer-content').hover(function(e){
    // console.log($('.card-slide'), e);
    $(e.currentTarget).find('.booked_dates').slideDown(400);
    $(e.currentTarget).find('.card-footer').slideUp(400);
    // $('.card').slideUp(200);
},
function(e){
    $(e.currentTarget).find('.card-footer').slideDown(400);
    $(e.currentTarget).find('.booked_dates').slideUp(400);
});
