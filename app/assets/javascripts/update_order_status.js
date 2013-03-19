function update_status(new_status){
  $('#order_status').text(new_status);
}

function session_id(){
  return $('#order_status').data('sessionId');
}

$(document).ready(function(){
  setInterval(get_status, 30000);
});

function get_status(){
  $.ajax({
    url:  "/track/status/" + session_id(),
    type: "GET",
  }).done(function(data){
  });
}

var Tracker = function(){
  var canvas = document.getElementById("canvas_status");
  var context = canvas.getContext("2d");

  this.fillBackground = function(fillStyle){
    context.fillStyle = fillStyle;
    context.fillRect(0, 0, 1000, 200);
  }
}

$(document).ready(function(){

  var tracker = new Tracker();
  tracker.fillBackground("rgb(176, 196, 222)");
});
