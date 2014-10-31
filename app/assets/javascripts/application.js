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

$(document).on("ready", function() {
  $('#paybutton').prop('disabled', true);
  $('#cc_number').payment('formatCardNumber');
  $('#expiration').payment('formatCardExpiry');
  $('#security_code').payment('formatCardCVC');

  function validateDNI(dni) {
    var patt = /^\d{8}$/i
    return patt.test(dni);
  }

  function validateName(name) {
   var patt = /^[a-zA-Z ]+$/
   return patt.test(name);
  }

  function validateCCNumber(number) {
    return $.payment.validateCardNumber(number);
  }

  function validateExpiration(expiration) {
    return $.payment.validateCardExpiry(expiration.month, expiration.year);
  }

  function validateCVC(cvc,type) {
    return $.payment.validateCardCVC(cvc,type);
  }

  function validPayment(expiration,cvc,number,type,dni,name) {
    var validExpiration = validateExpiration(expiration);
    var validCCNumber = validateCCNumber(number)
    var validCVC = validateCVC(cvc,type);
    var validDNI = validateDNI(dni);
    var validName = validateName(name);
    return validExpiration && validCCNumber && validCVC && validDNI && validName;
  }

  //Validations
  $('#expiration').on('input', function() {
    var expiration = $.payment.cardExpiryVal($('#expiration').val());
    var cvc = $('#security_code').val();
    var number = $('#cc_number').val();
    var type = $('#cc_type').val().toLowerCase();
    var dni = $('#document_number').val();
    var name = $('#full_name').val();
    var valid = validPayment(expiration,cvc,number,type,dni,name);
    if(!validateExpiration(expiration)) {
      $('#expiration_field').addClass('has-error');
      $('#expiration_field').removeClass('has-success');
    } else {
      $('#expiration_field').addClass('has-success');
      $('#expiration_field').removeClass('has-error');
    }

    $('#paybutton').prop('disabled', !valid);
  });

  $('#security_code').on('input', function() {
    var expiration = $.payment.cardExpiryVal($('#expiration').val());
    var cvc = $('#security_code').val();
    var number = $('#cc_number').val();
    var type = $('#cc_type').val().toLowerCase();
    var dni = $('#document_number').val();
    var name = $('#full_name').val();
    var valid = validPayment(expiration,cvc,number,type,dni,name);

    if(!validateCVC(cvc,type)) {
      $('#security_code_field').addClass('has-error');
      $('#security_code_field').removeClass('has-success');
    } else {
      $('#security_code_field').addClass('has-success');
      $('#security_code_field').removeClass('has-error');
    }

    $('#paybutton').prop('disabled', !valid);
  });

  $('#cc_number').on('input', function() {
    var expiration = $.payment.cardExpiryVal($('#expiration').val());
    var cvc = $('#security_code').val();
    var number = $('#cc_number').val();
    var type = $('#cc_type').val().toLowerCase();
    var dni = $('#document_number').val();
    var name = $('#full_name').val();
    var valid = validPayment(expiration,cvc,number,type,dni,name);

    if(!validateCCNumber(number)) {
      $('#cc_field').addClass('has-error');
      $('#cc_field').removeClass('has-success');
    } else {
      $('#cc_field').removeClass('has-error');
      $('#cc_field').addClass('has-success');
    }

    $('#paybutton').prop('disabled', !valid);
  });

  $('#document_number').on('input', function() {
    var expiration = $.payment.cardExpiryVal($('#expiration').val());
    var cvc = $('#security_code').val();
    var number = $('#cc_number').val();
    var type = $('#cc_type').val().toLowerCase();
    var dni = $('#document_number').val();
    var name = $('#full_name').val();
    var valid = validPayment(expiration,cvc,number,type,dni,name);

    if(!validateDNI(dni)) {
      $('#document_field').addClass('has-error');
      $('#document_field').removeClass('has-success');
    } else {
      $('#document_field').removeClass('has-error');
      $('#document_field').addClass('has-success');
    }

    $('#paybutton').prop('disabled', !valid);
  });

  $('#full_name').on('input', function() {
    var expiration = $.payment.cardExpiryVal($('#expiration').val());
    var cvc = $('#security_code').val();
    var number = $('#cc_number').val();
    var type = $('#cc_type').val().toLowerCase();
    var dni = $('#document_number').val();
    var name = $('#full_name').val();
    var valid = validPayment(expiration,cvc,number,type,dni,name);
    
    if(!validateName(name)) {
      $('#name_field').addClass('has-error');
      $('#name_field').removeClass('has-success');
    } else {
      $('#name_field').removeClass('has-error');
      $('#name_field').addClass('has-success');
    }

    $('#paybutton').prop('disabled', !valid);
  });

  $('#cc_number').validateCreditCard(function(result) { 
        var cardType = $.payment.cardType($('#cc_number').val());
        if(cardType) {
          $('#cc_type').val(cardType.toUpperCase());         
        }
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
        if($('#editable').val() == 'true') {
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

    }
    google.maps.event.addDomListener(window, 'load', init_map);
    google.maps.event.addDomListener(window, 'page:load', init_map);
  });
