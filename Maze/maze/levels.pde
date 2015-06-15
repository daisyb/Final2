final int play=0;
final int win=1;
final int start=2;
final int newlvl=3;

int state = start;
int lvlCount = 0;
final int maxLvl = 3; 
 
Player player = new Player();
 

Maze maze = new Maze();

final int emptyCell =0;
final int wallCell  =1;
final int startCell =2;
final int goalCell  =3;
 

void draw () {
  background(0);
  switch (state) {
  case start:
    //draw maze and show level
    if (!(millis ()-3000<=getTime)) {
      state=play;
    }
    break;
  case play:
    //draw maze
    player.drawPlayer();
    player.collision();
    break;
  case newlvl:
    //draw maze
    player.addX=0;
    player.addY=0;
    player.drawPlayer();
    //show level number
    if (!(millis ()-3000<=getTime)) {
      //start over
    }
    break;
  case win:
    //draw maze
    player.addX=0;
    player.addY=0;
    player.drawPlayer();
    //you win
    if (!(millis ()-3000<=getTime)) {
    //something
    }
    break;
  default:
    exit();
    break;
  } 
} 
