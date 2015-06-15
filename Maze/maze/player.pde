
class Player {
  
  float PlayerX;
  float PlayerY;
  float addX;
  float addY;
  
  void drawPlayer () {
    fill (255, 0, 0);
    ellipse(PlayerX, PlayerY, 10, 10);
    if (stateOfGame!=statePause) {
      PlayerX+=addX;
      PlayerY+=addY;
    }
  }
 
  void collision() {
    for (int i = 0; i < maze.rows; i++) {
      if ( PlayerX >= i*maze.cols+maze.windowsize &&
        PlayerX <= i*maze.w+maze.windowsize+maze.w ) {
        for (int j = 0; j < maze.cols; j++) {
          // check column
          if (PlayerY >= j*maze.cols+maze.windowsize &&
            PlayerY <= j*maze.cols+maze.windowsize+maze.cols) {
            switch(maze.cells[i][j]) {
            case emptyCell:
              break;
            case wallCell:
            //staystill
              }  
              break;
            case startCell:
              break;       
            case goalCell:
              stateOfGame=newlvl;
              levelCount++;
              maze.colorz = color (255, 255, 0 );
              if (levelCount>=maxLevel)
              {
                state = win;
                lvlCount=0;
                maze.colorz = color (0, 255, 0 );
              }
              break;       
            default;
              break;
            } 
          } 
        }
      }
    }
  }
