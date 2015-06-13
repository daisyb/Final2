import java.util.LinkedList;
import java.util.Random;

/*
so there are cells in the grid 
and each of them has wall to the right left below and above
to make the maze I just changed some of those walls from black to white
hopefully you'll be able to find away to get the players to move only on white and not be able 
to cross over black
hopefully my code isn't too backwards
we'll see
*/



wall[][] grid;


int rows, cols, cellSize, wallSize, windowSize;
LinkedList<wall> stack;
color black = (0);
color white = (255);
Random rnd = new Random();
wall entrance;
wall exit;

void setup(){
  windowSize = 640;
  wallSize = 10;
  rows = 22;
  cols = rows;
  noStroke();
  cellSize = windowSize/(rows-1);
  size(windowSize,windowSize);
  background(255);
  grid = new wall[rows][cols];
  stack = new LinkedList<wall>();
  for(int r=0;r<rows;r++){
    for(int c=0;c<cols;c++){   
       grid[r][c] = new wall(r,c);
    }
  }
 
 makeMaze();
 
}


void makeMaze(){
  wall current = grid[1][rows/2];
  int visitedCells=1;
  while (visitedCells<rows*cols+60){
    if(current.hasNeighbors()){
      stack.push(current);
      current = current.ranNeighbor();
      visitedCells++;
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
        
        



class node{
  int xcor,ycor;
  
  node(int xcor, int ycor){
    this.xcor = xcor;
    this.ycor = ycor;
    //fill(255);
    //rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
    fill(0);
    rect(xcor*cellSize,(ycor)*cellSize,wallSize,cellSize+wallSize);
    rect(xcor*cellSize,(ycor)*cellSize,wallSize+cellSize,wallSize);
    
  }
  
  wall getLeft(){
    if(xcor>1){
      return grid[xcor-1][ycor];
    } 
    return null;
  }
  
  wall getRight(){
    if(xcor<cols-1){
      return grid[xcor+1][ycor];
    }
    return null;
  }
  
  wall getBelow(){
    if(ycor<rows-1){
      return grid[xcor][ycor+1];
    }
    return null;
  }
  
  wall getAbove(){
    if(ycor>1){
      return grid[xcor][ycor-1];
    }
    return null;
  }
}

class wall extends node{
  boolean left,right,above,below;
  boolean exit,entrance;

  wall(int xcor, int ycor){
    super(xcor,ycor);
    if(ycor<=1) above = true;
    if(xcor<=1) left = true;
    if(ycor>=rows-1)below=true;
    if(xcor>=cols-1)right=true;
  }
  
  void fillSquare(int f){
    fill(f);
    rect((xcor-1)*cellSize+wallSize,(ycor-1)*cellSize+wallSize,cellSize-rows+1,cellSize-cols+1);
  }

  void fillRight(int f){
    fill(f);
    rect((xcor-1)*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    right = true;
    if(getRight() != null) getRight().left=true;
  }
  
  void fillLeft(int f1,int f2,int f3){
    fill(f1,f2,f3);
    rect((xcor-1)*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    right = true;
    if(getRight() != null) getRight().left=true;
  }
  
  void fillRight(int f1,int f2,int f3){
   fill(f1,f2,f3);
    rect(xcor*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    left=true;
    if(getLeft() != null) getLeft().right=true;
  }
  
  void fillAbove(int f){
    fill(f);
    rect(xcor*cellSize,(ycor-1)*cellSize,wallSize-cellSize,wallSize);
    above=true;
    if(getAbove() != null) getAbove().below =true;
  }
  
  void fillLeft(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    left=true;
    if(getLeft() != null) getLeft().right=true;
  }
  
  void fillBelow(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize-cellSize,wallSize);
    below=true;
    if(getBelow() != null) getBelow().above=true;
  }
  
  boolean hasNeighbors(){
    int falseCount=0;
    if(!right)falseCount++;
    if(!left)falseCount++;
    if(!above)falseCount++;
    if(!below)falseCount++;
    return falseCount>=2;
  }
  
  wall ranNeighbor(){
    if(!hasNeighbors())return null;
    ArrayList<wall> a = new ArrayList<wall>();
    if(!right){
      if(getRight() !=null) a.add(getRight());
    }
    if(!left){
      if(getLeft()!=null) a.add(getLeft());
    }
    if(!above){
      if(getAbove()!=null) a.add(getAbove());
    }
    if(!below){
      if(getBelow()!=null) a.add(getBelow());
    }
    wall n = a.get(rnd.nextInt(a.size()));
    if(n==getRight()){
      fillRight(255);
    }
    if(n==getLeft()){
      fillLeft(255);
    }
    if(n==getAbove()){
      fillAbove(255);
    }
    if(n==getBelow()){
      fillBelow(255);
    }
    //println(a + " a " + n +" n");
    return n;
  }
    
  
  String toString(){
    return xcor + " " + ycor;
  }
}


