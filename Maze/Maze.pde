import java.util.LinkedList;
import java.util.Random;



wall[][] grid;


int rows, cols, cellSize, wallSize, windowSize;
int totalCells;
LinkedList<wall> stack;
color black = (0);
color white = (255);
Random rnd = new Random();

void setup(){
  windowSize = 538;
  wallSize = 10;
  rows = 10;
  cols = rows;
  noStroke();
  cellSize = windowSize/rows;
  size(windowSize,windowSize);
  background(0);
  grid = new wall[rows][cols];
  totalCells= rows*cols;
  stack = new LinkedList<wall>();
  for(int r=0;r<rows;r++){
    for(int c=0;c<cols;c++){   
       grid[r][c] = new wall(r,c);
    }
  }
  /*
  grid[10][10].fillSquare(200);
  grid[10][10].fillLeft(255);
  grid[10][10].fillAbove(255);
  grid[10][10].fillBelow(255);
  grid[10][10].fillRight(255);
  grid[3][3].fillRight(255);
  println(grid[10][9].below);
  println(black);
  //grid[10][10].fillSquare(200);
 */
 makeMaze();
}

void makeMaze(){
  wall current = grid[rnd.nextInt(rows)][rnd.nextInt(cols)];
  int visitedCells=1;
  stack.push(current);
  while (visitedCells<totalCells){
    if(current.hasNeighbors()){
      stack.push(current);
      current = current.ranNeighbor();
      //println("oc"+current+"oc");
      visitedCells++;
    } else {
      current = stack.pop();
    }
  }
}
        
        



class node{
  int xcor,ycor;
  
  node(int xcor, int ycor){
    this.xcor = xcor;
    this.ycor = ycor;
    fill(255);
    rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
    fill(0);
    rect(xcor*cellSize,ycor*cellSize,wallSize,cellSize+wallSize);
    rect(xcor*cellSize,ycor*cellSize,wallSize+cellSize,wallSize);
  }
  
  wall getLeft(){
    if(xcor>1){
      return grid[xcor-1][ycor];
    } 
    return null;
  }
  
  wall getRight(){
    if(xcor<10){
      return grid[xcor+1][ycor];
    }
    return null;
  }
  
  wall getBelow(){
    if(ycor<10){
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
  
  wall(int xcor, int ycor){
    super(xcor,ycor);
    left=false;
    right=false;
    above=false;
    below=false;
    if(xcor>=rows-2){
      right=true;
    }
    if(xcor<=2){
      left=true;
    }
    if(ycor>=cols-2){
      below=true;
    }
    if(ycor<=2){
      above=true;
    }
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
    return !right || !left || !above || !below;
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


