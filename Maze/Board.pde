import java.util.LinkedList;

class Board{
 
  LinkedList<wall> stack;
  
  Board(){
   
    grid = new wall[rows][cols];
    stack = new LinkedList<wall>();
    for(int r=0;r<rows;r++){
      for(int c=0;c<cols;c++){   
         grid[r][c] = new wall(r,c);
      }
    }
  }
  
  
  void makeMaze(){
    wall current = grid[1][rows/2];
    int visitedCells=1;
    while (visitedCells<(rows-1)*(cols-1)){

      if(current.hasNeighbors()){
        stack.push(current);
        current = current.ranNeighbor();
        if(!current.visited){
            visitedCells++;
            current.visited = true;
        }
      } else if (!stack.isEmpty()){
        current = stack.pop();
      } 
    }
    
    exit=null;
   for(int i=0;i<rows;i++){
     wall cell = grid[cols-1][i];
     if(cell.left ==true && exit==null){
       exit=cell;
       cell.fillRight(9,232,83);
       grid[cols-2][i].fillLeft(255);
       grid[cols-3][i].fillLeft(255);
     } else {
       cell.fillLeft(0);
     }
   }
   
   entrance = grid[1][rows/2];
   entrance.fillLeft(9,158,232);
   entrance.fillLeft(255);
   grid[2][rows/2].fillLeft(255);
   for(wall cell : grid[1]){
     if(cell.left == true && entrance != cell){
       cell.fillRight(0);
     }
   }
   
  }
 
  
}
