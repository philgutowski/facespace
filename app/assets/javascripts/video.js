$(function(){
  if (window.location.pathname == '/') {

    var errorCallback = function(e) {
      console.log('You need to allow your camera if you want to send a message!', e);
    };
    var message = $(".message-button");
    var video = $("video.video");
    var canvas = document.getElementById("video-canvas");
    var context = canvas.getContext('2d');

    function snapshot() {
    context.drawImage(video[0], 0, 0);
    $("#message_image").val(canvas.toDataURL());
    }

    navigator.webkitGetUserMedia({video: true}, function(stream) {
      video.prop("src", window.URL.createObjectURL(stream));
      snapshot();
    }, errorCallback);

    message.click(snapshot);
  }
 });
