# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on 'turbolinks:load', ->
#     $("#jumpRecord").on "click", ->
#         window.location.href = "/record/index"

# $(document).ready ->
# $(document).on 'turbolinks:load', ->
#     $(".del-data").on "click", ->
#         if (confirm("このデータを削除しますか？"))
#             document.location = "/home/delete/" + $(this).context.attributes.val.value
#             return false;

$(document).ready ->
    $(document).on 'click', '.del-data', (e)->
        if (confirm("このデータを削除しますか？"))
            document.location = "/posts/" + $(this).context.attributes.val.value + "/destroy"
            return false;

    $(document).on 'click', '.edit-data', (e)->
        window.location = "/posts/" + $(this).context.attributes.val.value + "/edit"
        return false;

$(document).on 'turbolinks:load', ->
    $(".update-cancel").on "click", ->
        window.location = "/history"
        return false;
