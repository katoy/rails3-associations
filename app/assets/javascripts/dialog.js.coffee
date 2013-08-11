
# See
#  - http://thehungrycoder.com/ruby-on-rails/replace-rails-confirm-dialog-with-bootboxjs.html
#    > Replace Rails confirm dialog with Bootboxjs
#

window.myCustomConfirmBox = (message, callback) ->
  options = [
    {
      'label': '取消'
      'class': 'btn-success'
    }
    {
      'label': 'ＯＫ'
      'class': 'btn-danger'
      'callback': ->
        if typeof callback == 'function'
          callback()
    }
  ]

  bootbox.dialog message, options
  # bootbox.confirm message

$.rails.allowAction = (element) ->
  message = element.data("confirm")
  return true  unless message

  answer = false
  callback = undefined

  if $.rails.fire(element, "confirm")
    myCustomConfirmBox message, ->
      callback = $.rails.fire(element, "confirm:complete", [answer])
      if callback
        oldAllowAction = $.rails.allowAction
        $.rails.allowAction = ->
          true

        element.trigger "click"
        $.rails.allowAction = oldAllowAction

  false
