// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap
//= require credit_card_validator
//= require cc_number_validator

$(document).on("ready page:change", function() {
	$.datepicker.regional['es'] = {
  closeText: 'Cerrar', 
  prevText: 'Previo', 
  nextText: 'Próximo',
  
  monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
  'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
  monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
  'Jul','Ago','Sep','Oct','Nov','Dic'],
  monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
  dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
  dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sáb'],
  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
  dateFormat: 'dd/mm/yy', firstDay: 0, minDate:0,
  initStatus: 'Selecciona la fecha', isRTL: false};
		$.datepicker.setDefaults($.datepicker.regional['es']);
	  $('.datepicker').datepicker();
    $('#first_date').datepicker({ 
      beforeShow: function(input, inst) {
       var maxDate = $('#last_date').datepicker('getDate');
       $(this).datepicker('option', 'maxDate', maxDate);
       $(this).datepicker('option', 'minDate', new Date(2014, 1 - 1, 1));
      }
    });
    $('#last_date').datepicker({
      beforeShow: function(input, inst) {
       var mindate = $('#first_date').datepicker('getDate');
       $(this).datepicker('option', 'minDate', mindate);
      }
    });
});

$(document).on("ready page:change", function() {
  
  function valid_cc(result) {
    var valid = (result.lenght_valid == true) && (result.luhn_valid==true);
    console.log(valid);
    return true;
  }

  $('#cc_number').payment('formatCardNumber');
  $('#expiration').payment('formatCardExpiry');
  $('#security_code').payment('formatCardCVC');
  $('#cc_number').validateCreditCard(function(result) { 
        var cardType = $.payment.cardType($('#cc_number').val());
        $('#cc_type').val(cardType.toUpperCase());
    });

  $( "#paybutton" ).click(function() {
    $.post( "publications/" + window.idToPay + "/pay", function( data ) {
      $('#modal').modal('hide');
      location.reload();
    });
  });
});

 $(document).on("ready page:change", function() {
    var marker;
    var geocoder;
    var expectedCity = 'Ciudad Autónoma de Buenos Aires';
    var invalidAddress = 'La ubicación que ha seleccionado es inválida, o no pertenece a Ciudad Autónoma de Buenos Aires';

    function placeMarker(location, map) {
      if ( marker ) {
        marker.setPosition(location);
      } else {
        marker = new google.maps.Marker({
          position: location,
          map: map
        });
        marker.setMap(map);
      }
    }

    function getAddress(results) {
      return results[0].address_components[1].short_name + " "+ results[0].address_components[0].short_name;
    }

    function getCity (results) {
      return results[0].address_components[4].short_name;
    }

    function set_latlng(marker) {
      $("#lat").val(marker.getPosition().lat());
      $("#lng").val(marker.getPosition().lng());
    }

    function init_map() {
        var myLocation = new google.maps.LatLng(-34.6158526,-58.4332985);
        var mapOptions = {
            center: myLocation,
            streetViewControl: false,
            zoom: 12
        };

        geocoder = new google.maps.Geocoder();
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        google.maps.event.addListener(map, 'click', function(e) {
        geocoder.geocode({'latLng':e.latLng}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
              if (getCity(results) == expectedCity) {
                placeMarker(e.latLng, map);
                $('#publication_address').val(getAddress(results));
                $('#publication_zone').val(results[0].address_components[2].long_name);
                set_latlng(marker);
              } else 
              alert(invalidAddress);
            }
          }
          });
        });
    }
    google.maps.event.addDomListener(window, 'load', init_map);
    google.maps.event.addDomListener(window, 'page:load', init_map);
  });
