# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

try_to_create_new_user = (username) ->
  console.log "Sending request"
  $.ajax
    url: "/users/create",
    method: "POST",
    data: {
      username: username
    }
    success: (data) ->
      console.log "success"
    failure: (errMsg) ->
      console.log "not success"
      alert errMsg

$ ->
  username_field = $('#username')
  username_field.keypress (e) ->
    if e.which == 13
      try_to_create_new_user username_field.val()
      return false
