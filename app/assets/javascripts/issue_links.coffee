# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

filter_by_year = (year) ->
  jquery.ajax
    url: '/issue_links'
    type: 'GET'
    data: 'year': year
    dataType: 'html'
    success: (data) ->
      return data
  return
