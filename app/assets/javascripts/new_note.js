$(document).on('turbolinks:load', function(){
	$('#submit-f-note').click(function(e){
		e.preventDefault()
		var noteJson = getFormData($('form'))
		$.ajax({url:'/notes/new',
		 			  type:'POST',
		 			  dataType: 'json',
		 			  data:noteJson,
					}).done(function(resp){
						$('#follower-notes').append(resp.data)
						$('#new_note').find('textarea').val('')
						$('.check_boxes').attr('checked',false)
					}).fail(function(fail){
						console.log('fail :(')
						console.log(fail)
					})
	})

	function getFormData(form) {
		var serialized = $(form).serializeArray()
		var json = {}
		$.map(serialized, function(n,i){
			json[n['name']] = json[n['name']] == null ? n['value'] : json[n['name']].concat(n['value']).concat(",") //refactor so that array is created not string of ints
		});
		return json
	}


})