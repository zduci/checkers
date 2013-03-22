function update_status(new_status){
  $('#order_status').text(new_status);
}

function session_id(){
  return $('#order_status').data('sessionId');
}

$(document).ready(function(){
  tracker = new Tracker();
  get_status();
  setInterval(get_status, 30000);
});

function get_status(){
  $.ajax({
    url:  "/track/status/" + session_id(),
    type: "GET",
  }).done(function(data){
    update_canvas_status(data.status);
  });
}


function update_canvas_status(status){
  tracker.draw(status_number(status));
}

function status_number(status){
  return ["placed", "preparing", "baking", "quality control", "delivering", "delivered"].indexOf(status) + 1;
}
