# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', -> 
	$('.orgName').on "click", ->
		orgId = $(this).attr('class').match(/org\d/)[0]
		for member in ($('.followerList li'))
			if $(member).hasClass(orgId) or orgId is 'org0'
				$(member).show()
			else
				$(member).hide()


