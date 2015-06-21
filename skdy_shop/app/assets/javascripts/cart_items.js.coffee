# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  jump_to_target = ($tgt)->
    console.log $tgt.data()
    wh = $(window).height() - 0  # - nav height
    oh = 55
    top = $tgt.offset().top
    bot = $tgt.offset().top + oh
    wtop = $(window).scrollTop()
    wbot = $(window).scrollTop() + $(window).height()
    if wtop < top and top && bot < wbot
      console.log "isVisible"
    else
      console.log "out of the window"
      $(window).scrollTop ($tgt.offset().top - 55)
    return

  $el = $("#flash")
  notice = $el.attr("data-notice")
  id = $el.attr("data-id")
  type = $el.attr("data-type")
  $alert = $('<div id="notice" class="notice arrow_box" data-alert="alert"></div>')
  $alert.html notice
  console.log "", notice, id, type
  sel = ""
  switch type
    when "created"
      sel = "[data-notice-id='" +id + "']"
      $tgt = $(sel)
      jump_to_target $tgt
    when "updated"
      sel = "[data-notice-id='" +id + "']"
      $tgt = $(sel)
      jump_to_target $tgt
    when "deleted"
      sel = "[data-notice-deleted]"
      $tgt = $(sel)

  if $tgt
    $tgt.append $alert
    $alert.fadeIn(500).delay(2000).fadeOut(500)
