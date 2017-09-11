# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
    $('.visible-md.featured-articles ul li').last().css 'border', 'none'
    $('.latest-articles ul li').last().css 'border', 'none'
    $('.article-list li').last().css 'border', 'none'

jQuery ready
