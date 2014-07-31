$(function(){
  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe('chat_channel');

  scroll_to_bottom();
  channel.bind('chat-event', function(data) {
    $(".messages").prepend(data.message);
  });

  channel.bind('online-users-event', function(data) {
    $(".online-users ul").html(data.message);
  });

  $("#new_message").submit(function() {
    $.post(
      $(this).prop("action"),
      $(this).serialize()
    ).done(function(data){
        $("#message_body, #message_image").val("");
        scroll_to_bottom();
      });
    return false;
  });
});
