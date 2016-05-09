#= require simplemde.min.js
#= require highlight.min.js

#
# Initialyze submit button
#
submit_button_init = (simplemde) ->
  $('#submit_button').click () ->
    $.ajax
      url: '/posts/create'
      type: 'POST'
      fomat: 'json'
      data:
        title: $('#post_title').val()
        body: simplemde.value()
      error: (response, status, error) ->
        errors = $.parseJSON response.responseText
        console.log errors
        errors.forEach (er) ->
          Materialize.toast 'Error: '+er, 7000, 'red darken-4'

simplemde_init = () ->
  new SimpleMDE
    element: $('editor')[0]
    renderingConfig:
      codeSyntaxHighlighting: true
    autofocus: true

$ ->
  simplemde = simplemde_init()
  submit_button_init(simplemde)
