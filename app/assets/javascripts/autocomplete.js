var placeSearch, autocomplete;
function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(document.getElementById('gmaps-input-address')),
      {types: ['geocode']});

  google.maps.event.addDomListener(window, 'load', initAutocomplete);

  autocomplete.addListener('place_changed', fillInAddress);
}


function fillInAddress() {
  var place = autocomplete.getPlace();
  var address = gatherAddressInfo(place)
  for (var key in address) {
  	if(address.hasOwnProperty(key)) {
  		$('input[name="follower['+key+']"]').val(address[key])
  	}
  }
}

function gatherAddressInfo(place) {
  var address = {}
  address["latitude"] = place.geometry.location.lat()
  address["longitude"] = place.geometry.location.lng()
  address_length = place.address_components.length
  if (address_length >= 8) { //proper address
	  address["street_number"] = place.address_components[0].long_name
	  address["street_name"] = place.address_components[1].long_name
	  address["neighborhood"] = place.address_components[2].long_name
	  address["city"] = place.address_components[3].long_name
	  address["county"] = place.address_components[4].long_name
	  address["state"] = place.address_components[5].long_name
	  address["zip"] = place.address_components[7].long_name
	} else if (address_length == 6) { //intersection
		address["neighborhood"] = place.address_components[1].long_name
		address["city"] = place.address_components[2].long_name
		address["county"] = place.address_components[3].long_name
		place["state"] = place.address_components[4].long_name
		address["zip"] = place.address_components[5].long_name
	}	else if ((address_length == 5) && (place.address_components[0].types[0] == 'neighborhood')) { //neighborhood
	  address["neighborhood"] = place.address_components[0].long_name
	  address["city"] = place.address_components[1].long_name
	  address["county"] = place.address_components[2].long_name
	  place["state"] = place.address_components[3].long_name
	} else if (address_length == 5) {
		address["neighborhood"] = place.address_components[0].long_name
	  address["city"] = place.address_components[1].long_name
	  address["county"] = place.address_components[2].long_name
	  place["state"] = place.address_components[3].long_name
	} else {
		console.log("insufficient data")
	}
	return address
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
