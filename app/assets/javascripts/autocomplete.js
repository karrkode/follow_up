var placeSearch, autocomplete;
 
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};


function initAutocomplete() {

	
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(document.getElementById('gmaps-input-address')),
      {types: ['geocode']});

  google.maps.event.addDomListener(window, 'load', initAutocomplete);
  // Create the autocomplete object, restricting the search to geographical
  // location types.



  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', fillInAddress);
}


function fillInAddress() {
	console.log("fill in adddress change")
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

  var address = {}
  debugger
  address["lat"] = place.geometry.location.lat()
  address["lng"] = place.geometry.location.lng()
  address_length = place.address_components.length
  if (address_length == 8) {
	  address["street_number"] = place.address_components[0].long_name
	  address["street_name"] = place.address_components[1].long_name
	  address["neighborhood"] = place.address_components[2].long_name
	  address["city"] = place.address_components[3].long_name
	  address["county"] = place.address_components[4].long_name
	  address["state"] = place.address_components[5].long_name
	  address["zip"] = place.address_components[6].long_name
	} else if (address_lengh == 6) {
		adddress["neighborhood"] = place.address_components[1].long_name
		address["city"] = place.address_components[2].long_name
		address["county"] = place.address_components[3].long_name
		place["state"] = place.address_components[4].long_name
		adddress["zip"] = place.address_components[5].long_name
	}	else if (address_length == 5) {
	  adddress["neighborhood"] = place.address_components[0].long_name
	  address["city"] = place.address_components[1].long_name
	  address["county"] = place.address_components[2].long_name
	  place["state"] = place.address_components[3].long_name
	} else {
		console.log('Insufficient locationd data')
	}

  // console.log(address)

  // debugger
  // console.log(place)

  // for (var component in componentForm) {
  //   document.getElementById(component).value = '';
  //   document.getElementById(component).disabled = false;
  // }

  // // Get each component of the address from the place details
  // // and fill the corresponding field on the form.
  // for (var i = 0; i < place.address_components.length; i++) {
  //   var addressType = place.address_components[i].types[0];
  //   if (componentForm[addressType]) {
  //     var val = place.address_components[i][componentForm[addressType]];
  //     document.getElementById(addressType).value = val;
  //   }
  // }
}

// function geolocate() {
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var geolocation = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };
//       var circle = new google.maps.Circle({
//         center: geolocation,
//         radius: position.coords.accuracy
//       });
//       autocomplete.setBounds(circle.getBounds());
//     });
//   }
// }
