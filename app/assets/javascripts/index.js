// var working = false;
// $('form').one('submit', function(e) {
//   e.preventDefault();
//   if (working) return;
//   working = true;
//   var $this = $(this),
//     $state = $this.find('button > .state');
//   $this.addClass('loading');
//   $state.html('Authenticating');
//   setTimeout(function() {
//     $('form').submit()
//     $this.addClass('ok');
//     $state.html('Securing your profile');
//     setTimeout(function() {
//       $state.html('Log in');
//       $this.removeClass('ok loading');
//       working = false;
//     }, 500);
//   }, 1000);
// });

