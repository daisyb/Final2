class Player {
  float PlayerX;
  float PlayerY;
  float addX;
  float addY;
  void Player () {
    fill (255, 0, 0);
    ellipse(PlayerX, PlayerY, 10, 10);
    }
  }
 
  void collision() {
    for (int a = 0; a < maze.rows; a++) {
      if ( PlayerX >= a*maze.rows+maze.windowSize &&
        PlayerX <= a*maze.rows+maze.windowSize+maze.rows ) {
        for (int b = 0; b < maze.cols; b++) {
          if (PlayerY >= b*maze.cols+maze.windowSize &&
            PlayerY <= b*maze.cols+maze.windosSize+maze.cols) {
            switch(maze.cells[a][b]) {
            case emptyCell:
              break;
            case wallCell:
              if (PlayerX >= a*maze.rows+maze.windowSize && PlayerY >= b*maze.cols+maze.windowSize &&
                PlayerX <= a*maze.rows+maze.windowSize+maze.cols && PlayerY <= b*maze.cols+maze.windowSize+maze.cols) {
                break;
                //dont move forward basically...
              }  
              break;
            case startCell:
              break;       
            case goalCell:
              stateOfGame=newlvl;
              lvl++;
              if (lvl>=maxlvls)
              {
                stateOfGame = end;
                lvl=0;
                starting();
              }
              break;       
            } 
          } 
        }
      }
    }
  }  
} 
