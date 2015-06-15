void keyPressed() {
  switch (stateOfGame) {
  case play:
  int x, y, step;
  step= 1;
  x=x+(step*directionx);
  int directionx = 1;
  int directiony = 0;
  x=x+(step*directionx);
  y=y+(step*directiony);
    keys();
    break;
  } 
} 

void keyz() {
  if (key == CODED) {
    if (keyCode == UP) {
      directiony = 1;
      directionx = 0;
    }
    else if (keyCode == DOWN) {
      directiony = -1;
      directionx = 0;
    }
    else if (keyCode == RIGHT) {
      directiony = 0;
      directionx = 1;
    }
    else if (keyCode == LEFT) {
      directiony = 0;
      directionx = -1;
    }
    else {
    println ("move")
    }
      }
      } 
    } 
  } 

