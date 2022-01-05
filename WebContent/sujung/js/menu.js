$( document ).ready( function() {
    var Offset = $( 'header' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > Offset.top ) {
        $( 'header' ).addClass( 'Fixed' );
      }
      else {
        $( 'header' ).removeClass( 'Fixed' );
      }
    });
  });