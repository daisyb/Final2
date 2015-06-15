
void keyPressed() {
  switch (stateOfGame) {
  case statePlay:
//  int x;
//  int y;
  int directionx = 1;
  int directiony = 0;
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

