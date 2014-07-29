$(function(){
  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe('chat_channel');

  channel.bind('chat-event', function(data) {
    console.log('An event was triggered with message: ' + data.message);
    $("#messages").append(data.message);
  });

  $("#new_message").submit(function() {
    $.post(
      $(this).prop("action"),
      $(this).serialize()
    ).done(function(data){
      $("#message_body").val("");
    });
    return false;
  });
});
