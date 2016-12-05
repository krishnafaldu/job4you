# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:error", "form", (evt, xhr, status, error) ->
   errors = xhr.responseJSON.error
   for message of errors
      $('#errors ul').append '<li>' + errors[message] + '</li>'