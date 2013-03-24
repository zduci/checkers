function updateStatus(newStatus){
  $('#order_status').text(newStatus);
}

function sessionId(){
  return $('#order_status').data('sessionId');
}

$(document).ready(function(){
  tracker = new Tracker();
  getStatus();
  setInterval(getStatus, 30000);
});

function getStatus(){
  $.ajax({
    url:  "/track/status/" + sessionId(),
    type: "GET",
  }).done(function(data){
    updateCanvasStatus(data.status);
  });
}


function updateCanvasStatus(status){
  tracker.draw(statusNumber(status));
}

function statusNumber(status){
  return ["placed", "preparing", "baking", "quality control", "delivering", "delivered"].indexOf(status) + 1;
}
