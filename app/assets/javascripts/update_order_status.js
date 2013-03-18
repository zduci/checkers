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

$(document).ready(function(){
  var Tracker = function(){
    var canvas = document.getElementById("canvas_status");
    var context = canvas.getContext("2d");

    context.fillStyle = "rgb(176, 196, 222)";
    context.fillRect(0, 0, 1000, 200);
  }

  var tracker = new Tracker();
});
