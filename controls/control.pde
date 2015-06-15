
void keyPressed() {
  switch (stateOfGame) {
  case statePlay:
  int x;
  int y;
    keys();
    break;
  } 
} 

void keyz() {
  if (key == CODED) {
    if (keyCode == UP) {
      if(color==maze.white){
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

