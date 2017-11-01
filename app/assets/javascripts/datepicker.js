
// $("#dates_field").multiDatesPicker()

// $(function() {
//   $( ".datepicker" ).datepicker({ dateFormat: "yyyy-mm-dd" });
// });
// $("#dates_field").multiDatesPicker()
$('.date1').datepicker({
  format: 'dd/mm/yyyy',
    multidate: true
});
// $("#dates_field").multiDatesPicker({
//   pickableRange: 7
  // adjustRangeToDisabled: true,
  // addDisabledDates: [date.setDate(10), date.setDate(15)]
// });;
// $(function()
// {
//   $('.date-pick')
//     .datePicker(
//       {
//         createButton:false,
//         displayClose:true,
//         closeOnSelect:false,
//         selectMultiple:true
//       }
//     )
//     .bind(
//       'click',
//       function()
//       {
//         $(this).dpDisplay();
//         this.blur();
//         return false;
//       }
//     )
//     .bind(
//       'dateSelected',
//       function(e, selectedDate, $td, state)
//       {
//         console.log('You ' + (state ? '' : 'un') // wrap
//           + 'selected ' + selectedDate);

//       }
//     )
//     .bind(
//       'dpClosed',
//       function(e, selectedDates)
//       {
//         console.log('You closed the date picker and the ' // wrap
//           + 'currently selected dates are:');
//         console.log(selectedDates);
//       }
//     );
// });

