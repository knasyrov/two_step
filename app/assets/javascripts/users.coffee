# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  return unless $(".users.edit").length > 0

Dropzone.options.avatarForm =
  paramName: 'user[avatar]'
  success: (e,v) ->
    window.location.href = v.url
