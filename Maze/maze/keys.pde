
void keyPressed() {
  switch (state) {
  case play:
    keyz();
    break;
  default:
    break;
  } 
} 

//
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
      initGame();
    }
    else if (key == 'R') {
      levelCount = 0;
      initGame();
    }
    else if (key == '#') {
      player.PlayerX=410;
      player.PlayerY=160;
      player.addX=0;
      player.addY=-1;
    }
  } 
}
