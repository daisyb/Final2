
void keyPressed() {
  switch (stateOfGame) {
  case statePlay:
    keys();
    break;
  } 
} 

void keyz() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.addX=0;
      player.addY=-1;
    }
    else if (keyCode == DOWN) {
      player.addX=0;
      player.addY=1;
    }
    else if (keyCode == RIGHT) {
      player.addX=1;
      player.addY=0;
    }
    else if (keyCode == LEFT) {
      player.addX=-1;
      player.addY=0;
    }
    else {
    }
  }
  else { 
    if (key == 'r') {
      starting();
      //just to reset to test
    else {
        stateOfGame = play;
      } 
    } 
  } 

