var Tracker = function(){
  var canvas = document.getElementById("canvas_status");
  var context = canvas.getContext("2d");

  this.fillBackground = function(fillStyle){
    context.fillStyle = fillStyle;
    context.fillRect(0, 0, 1000, 200);
  }

  this.fillSquare = function(number, fillStyle){
    context.fillStyle = fillStyle;
    context.fillRect(startingX(number), 0, 200, 200);
  }

  this.strokeSquare = function(number){
    context.fillStyle = "rgb(0, 0, 0)";
    context.lineWidth = 10;
    context.strokeRect(startingX(number) + 4, 4, 196, 193);
  }

  this.draw = function(currentStage){
    if (currentStage == 6){
      this.itemDelivered();
    } else {
      this.fillBackground("rgb(176, 196, 222)");
      for (var i = 1; i <= 5; i++){
        if (i <= currentStage){
          this.fillSquare(i, "rgb(100, 149, 237)");
          fillText(i, true);
        } else {
          fillText(i, false);
        }
      }
      this.strokeSquare(currentStage);
    }
  }

  function fillText(squareNumber, reached){
    if (!reached){
      context.fillStyle = "rgb(0, 0, 0)";
    } else {
      context.fillStyle = "rgb(255, 255, 255)";
    }
    text = statusText(squareNumber);
    context.font = 'bold 40px Calibri';
    context.fillText(text, startingX(squareNumber)+ 13, 184);
  }

  function statusText(squareNumber){
    return ["Placed", "Preparing", "Baking", "Q Control", "Delivering"][squareNumber - 1];
  }

  function startingX(squareNumber){
    return (squareNumber - 1) * 200;
  }

  this.itemDelivered = function(){
    this.fillBackground("rgb(100, 149, 237)");
    context.font = 'bold 60px Calibri';
    context.fillStyle = "rgb(255, 255, 255)";
    context.fillText("Your order has been delivered. Enjoy", 10, 180); 
  }
}
