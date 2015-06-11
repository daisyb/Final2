import java.util.LinkedList;
import java.util.Random;



wall[][] grid;


int rows, cols, cellSize, wallSize, windowSize;
int totalCells;
LinkedList stack;
color black = (0);
color white = (255);
Random rnd = new Random();

void setup(){
  windowSize = 538;
  wallSize = 10;
  rows = 11;
  cols = rows;
  noStroke();
  cellSize = windowSize/rows;
  size(windowSize,windowSize);
  background(0);
  grid = new wall[rows][cols];
  totalCells= rows*cols;
  stack = new LinkedList();
  for(int r=0;r<rows;r++){
    for(int c=0;c<cols;c++){   
       grid[r][c] = new wall(r,c);
    }
  }
  grid[10][10].fillSquare(200);
  grid[10][10].fillLeft(255);
  grid[10][10].fillAbove(255);
  grid[10][10].fillBelow(255);
  grid[10][10].fillRight(255);
  grid[3][3].fillRight(255);
  println(grid[10][9].below);
  println(black);
  //grid[10][10].fillSquare(200);
 
}

void makeMaze(){
  current = grid[rnd.nextInt(rows)][rnd.nextInt(cols)];
  visitedCells=1;
  while (visitedCells<totalCells){
    //if(current.right == false || current.left == false || current.above ==false || current.below == false){
      int chance = rnd.nextInt(4);
      if(chance ==0 && current.right ==false && current.getRight()!=null){
        current.fillRight(255);
        stack.push(current);
        current = current.getRight();
        visitedCells++;
      } else if(chance ==1 && current.left ==false && current.getLeft()!=null){
        current.fillLeft(255);
        stack.push(current);
        current = current.getLeft();
        visitedCells++;
      }else if(chance ==2 && current.above ==false && current.getAbove()!=null){
        current.fillRight(255);
        stack.push(current);
        current = current.getAbove();
        visitedCells++;
      }else if (current.below ==false && current.getBelow()!=null){
        current.fillBelow(255);
        stack.push(current);
        current = current.getBelow();
        visitedCells++;
      } else {
        
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
  
  node getRight(){
    if(xcor>1){
      return grid[xcor-1][ycor];
    } 
    return null;
  }
  
  node getLeft(){
    if(xcor<10){
      return grid[xcor+1][ycor];
    }
    return null;
  }
  
  node getAbove(){
    if(ycor<10){
      return grid[xcor][ycor+1];
    }
  }
  
  node getBelow(){
    if(ycor>1){
      return grid[xcor][ycor-1];
    }
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
  }
  
  void fillSquare(int f){
    fill(f);
    rect((xcor-1)*cellSize+wallSize,(ycor-1)*cellSize+wallSize,cellSize-rows+1,cellSize-cols+1);
  }

  void fillRight(int f){
    fill(f);
    rect((xcor-1)*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    right = true;
    if(xcor<10){
      grid[xcor+1][ycor].left = true;
    }
  }
  
  void fillAbove(int f){
    fill(f);
    rect(xcor*cellSize,(ycor-1)*cellSize,wallSize-cellSize,wallSize);
    above=true;
    if(ycor>1){
      grid[xcor][ycor-1].below = true;
    }
  }
  
  void fillLeft(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
    left=true;
    if(xcor>1){
      grid[xcor-1][ycor].right =true;
    }
  }
  
  void fillBelow(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize-cellSize,wallSize);
    below=true;
    if(ycor<10){
      grid[xcor][ycor+1]=true;
    }
  }
  
  String toString(){
    return xcor + " " + ycor;
  }
}


