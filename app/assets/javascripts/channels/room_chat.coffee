App.room_chat = App.cable.subscriptions.create "RoomChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('.message-table').append '<div class="row">' +
          '<div class="col-md-4">' + data.email + ":" + '</div>' +
          '<div class="col-md-8">' + data.content + '</div>' + '</div>'
    # Called when there's incoming data on the websocket for this channel
