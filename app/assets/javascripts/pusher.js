$(function(){
  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe('chat_channel');
  $("html, body").scrollTop(9999);

  channel.bind('chat-event', function(data) {
    $(".messages").append(data.message);
    $("html, body").scrollTop(99000);
  });

  $("#new_message").submit(function() {
    $.post(
      $(this).prop("action"),
      $(this).serialize()
    ).done(function(data){
      $("#message_body, #message_image").val("");
    });
    return false;
  });
});
