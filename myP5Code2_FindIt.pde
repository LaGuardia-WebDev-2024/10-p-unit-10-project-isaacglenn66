var starXPos = [];
var starYPos = [];
var star = "⭐️";
var starTotal = 150;
//added asteroid and changed planet to ship(millenium falcon)
var shipXPos = [];
var shipYPos = [];
var ship = "🛸";
var shipTotal = 3;
var shipsFound = 0;

var asteroidXPos = [];
var asteroidYPos = [];
var asteroid = "☄️";
var asteroidTotal = 25;

setup = function() {
   size(600, 450); 

   reset();
}

draw = function(){   

   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){
  for(var i = 0; i < shipXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, shipXPos[i], shipYPos[i])<15){
      shipXPos.splice(i, 1);
      shipYPos.splice(i, 1);
      shipsFound++;
    }
  }
}

var display = function(){
  background(5,5,30);
//changing the color to a deeper blue yay
  fill(200,200,0);
  textSize(35);

  for(var i = 0; i < shipXPos.length; i ++){
    text(ship, shipXPos[i], shipYPos[i]);
  }
textSize(20);
//now the ships stick out more but for some reason when i click i i have to click in a far away spot for it to register
  for(var i = 0; i < asteroidXPos.length; i ++){
    text(asteroid, asteroidXPos[i], asteroidYPos[i]);
  }
  
  for(var i = 0; i < starXPos.length; i ++){
    text(star, starXPos[i], starYPos[i]);
  }

  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,215,0);
  //star wars colored text :))
  text("Find The " + ship + "s   |   " + ship + " " + shipsFound + "/" + shipTotal, 0, 440);

  if(shipsFound == shipTotal){
    fill(0, 200, 200);
    textSize(20);
    text("Press 'r' to restart \nthe game", 195, 220);
    textSize(35);
    text("You found them all, young Padawan!", 30, 180)
  }
}

var reset = function(){
  starXPos = [];
  starYPos = [];
  shipXPos = [];
  shipYPos = [];
  shipsFound = 0;
//adding the asteroids now too
asteroidXPos = [];
asteroidYPos = [];
  shipsFound = 0;

var a = 0;
while(a < asteroidTotal){
  asteroidXPos.push(random(0, 600));
  asteroidYPos.push(random(0, 400));
  a++;
}

  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(0,600));
    starYPos.push(random(0,400));
  }

  for(var i = 0; i < shipTotal; i++){
    shipXPos.push(random(0,600));
    shipYPos.push(random(0,400));
  }
}