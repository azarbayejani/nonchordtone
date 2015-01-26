# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#showText').click ->
    $.ajax({
      url: window.location,
      type: "DELETE",
      success: (result) ->
        $("#warning-message").hide().remove();
        $actualMessage = $("#actual-message");
        $actualMessage.find("#message").text(result.text);
        $actualMessage.find("input").val(window.location.origin + window.location.pathname.split("/").slice(0,-1).join("/") + "/" + result.new_uid);
        $actualMessage.show().removeClass("hidden");
    });

$(document).ready(ready)
$(document).on('page:load', ready)
