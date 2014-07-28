$(function(){
  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe('chatspace');
});

channel.bind('chat-event', function(data) {
  console.log('An event was triggered with message: ' + data.message);
});
