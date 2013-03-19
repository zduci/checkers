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

  this.fillSquare = function(number, fillStyle){
    context.fillStyle = fillStyle;
    context.fillRect((number - 1) * 200, 0, 200, 200);
  }

}

$(document).ready(function(){

  var tracker = new Tracker();
  tracker.fillBackground("rgb(176, 196, 222)");
  tracker.fillSquare(1, "rgb(176, 80, 222)");
  tracker.fillSquare(2, "rgb(176, 0, 70)");
  tracker.fillSquare(3, "rgb(30, 0, 222)");
  tracker.fillSquare(4, "rgb(176, 0, 222)");
  tracker.fillSquare(5, "rgb(176, 0, 0)");
});
