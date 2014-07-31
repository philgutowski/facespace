$(function(){
  var errorCallback = function(e) {
    console.log('Reeeejected!', e);
  };
  var message = $(".message-button");
  var video = $("video.video");
  var canvas = document.getElementById("video-canvas");
  var context = canvas.getContext('2d');

  navigator.webkitGetUserMedia({video: true}, function(stream) {
    video.prop("src", window.URL.createObjectURL(stream));
    snapshot();
  }, errorCallback);

  function snapshot() {
    context.drawImage(video[0], 0, 0);
    $("#message_image").val(canvas.toDataURL());
  }

  message.click(snapshot);
});
