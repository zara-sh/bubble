

$('#calendar').fullCalendar({
    events: '/calendar',

   eventClick: function(event) {
        if ( event.url ) {
            window.open(event.url);
            return false;
        }
    }

});


// $('#calendar').fullCalendar({
//     events: [
//         {
//             title: 'My Event',
//             start: '2010-01-01',
//             url: 'http://google.com/'
//         }
//         // other events here
//     ],
//     eventClick: function(event) {
//         if (event.url) {
//             window.open(event.url);
//             return false;
//         }
//     }
// });
