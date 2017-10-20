$(document).on 'turbolinks:load', ->
	$('#submit-f-note').on "click", (event) ->
		event.preventDefault()
		noteJson = getFormData($('form'))

		$.post '/notes/new'
		dataType: 'json'
		data: noteJson
		error: () ->
			console.log('fail :(')
		success: (data) ->
			$('#follower-notes').append(resp.data)
			$('#new_note').find('textarea').val('')

		getFormData = (form) ->
		  serialized = $(form).serializeArray()
		  json = {}
		  $.map serialized, (n, i) ->
		    json[n['name']] = n['value']
		    return
		  json

