final int play=0;
final int end=1;
final int start=2
final int newlvl=3;
int lvl = 1;
final int maxlvls = 5;
int stateOfGame = start;
Player player = new Player();
Maze maze = new Maze();
void setup () {
  starting();
}
void starting() {
  stateOfGame = start;
  maze.defineMaze() ;
}
void draw () {
  switch (stateOfGame) {
  case start:
    maze.drawMaze() ;
    stateOfGame=play;
    break;
  case play:
    maze.drawMaze() ;
    player.drawPlayer();
    player.collision();
    break;
  case newlvl:
    maze.drawMaze() ;
    player.addX=0;
    player.addY=0;
    player.drawPlayer();
    starting();
    break;
  case end:
    maze.drawMaze() ;
    player.drawPlayer();
    starting();
    break;
    default:
    exit();
  } 
} 
