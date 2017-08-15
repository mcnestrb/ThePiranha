# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#filter_by_year', (evt) ->
    $.ajax 'issue_links',
      type: 'GET'
      data: {
        year: $("#filter_by_year option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        result = $('<div />').append(data).find('#issue_links').html()
        $('#issue_links').html result
