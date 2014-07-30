$(function(){
  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe('chat_channel');
  $(".chatroom").scrollTop(99000);

  channel.bind('chat-event', function(data) {
    $("#messages").append(data.message);
    $(".chatroom").scrollTop(99000);
  });

  $("#new_message").submit(function() {
    $.post(
      $(this).prop("action"),
      $(this).serialize()
    ).done(function(data){
<<<<<<< HEAD
      $("#message_body, #message_image").val("");
=======
      $("#message_body").val("");
>>>>>>> Make header fixed
    });
    return false;
  });
});
