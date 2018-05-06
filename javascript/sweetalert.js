swal({
    title: 'Success!',
    text: "Order Saved!",
    type: 'success',
    html: '<a href="#"><b>Print Reciept</b></a> ' +
      ' | ' +
      '<a href="#"><b>Print Inovoice</b></a> ',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#28a745',
    confirmButtonText: 'Close!',
    cancelButtonText: 'Continue!'
  }).then((result) => {
      if (result.value) {
        $('#cancel-button').click();
        /*
       window.location = encodeURI('<?php echo $cancel; ?>');
  return false;
      */
      }
