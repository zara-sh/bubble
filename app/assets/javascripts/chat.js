// $(document).ready(function (){
  // var working = false;
  // let valid_message = false;
  // $('#new_message').on('submit', function(e) {
  //   e.preventDefault();
  //   if (valid_message === true) {
  //     if (working) return;
  //     working = true;
  //     navigator.geolocation.getCurrentPosition(function(location) {
  //       var latitude  = location.coords.latitude;
  //       var longitude  = location.coords.longitude;
  //       document.querySelector('#lati').value=latitude
  //       document.querySelector('#long').value=longitude
  //     });
  //     setTimeout(function() {
  //       $('form').submit()
  //       setTimeout(function() {
  //       working = false;
  //       }, 2200);
  //     }, 1000);
  //   }
  // });

  $('#new_message').on('keyup', function (event) {
         if ((event.keyCode > 47 && event.keyCode < 58) ||
        (event.keyCode > 64 && event.keyCode < 91)   ||
        (event.keyCode > 95 && event.keyCode < 112)  ||
        (event.keyCode > 185 && event.keyCode < 193) ||
        (event.keyCode > 218 && event.keyCode < 223)){
          valid_message = true;
         } else if (event.keyCode == 13 && event.shiftKey) {
             var content = this.value;
             var caret = getCaret(this);
             this.value = content.substring(0,caret)+"\n"+content.substring(carent,content.length-1);
             event.stopPropagation();
        } else if(event.keyCode == 13 )
        {
            $('#new_message').submit();
        }
  });

  function getCaret(el) {
    if (el.selectionStart) {
      return el.selectionStart;
    } else if (document.selection) {
      el.focus();

      var r = document.selection.createRange();
      if (r == null) {
        return 0;
      }

      var re = el.createTextRange(),
          rc = re.duplicate();
      re.moveToBookmark(r.getBookmark());
      rc.setEndPoint('EndToStart', re);

      return rc.text.length;
    }
    return 0;
  }
// });

// function executeQuery() {
//   $.ajax({
//     url: '/index',
//     success: function(data) {
//       $('#mydiv').html(data)
//     }
//   });
//   setTimeout(executeQuery, 500);
// }

// $(document).ready(function() {
//   setTimeout(executeQuery, 500);
// });
