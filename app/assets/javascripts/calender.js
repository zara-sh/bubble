$('#calendar').fullCalendar({
    events: '/profile'

   eventClick: function(event) {
        if ( event.url ) {
            window.open(event.url);
            return false;
        }
    }

});
