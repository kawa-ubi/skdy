# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ()->
  $("[data-js-menu-click]").on('click', (e)->
    $el = $ e.currentTarget
    id = $el.attr "data-js-menu-id"
    $tgt = $ "[data-js-bind-menu-id]"
    $tgt.val id
  )
