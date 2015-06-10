import java.util.LinkedList;
import java.util.Random;



wall[][] grid;


int rows, cols, cellSize, wallSize, windowSize;

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
  for(int r=0;r<rows;r++){
    for(int c=0;c<cols;c++){   
       grid[r][c] = new wall(r,c);
    }
  }
  grid[1][2].fillRight(255);
}

class node{
  int xcor,ycor;
  
  node(int ycor, int xcor){
    this.xcor = xcor;
    this.ycor = ycor;
    fill(255);
    rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
  }
}

class wall extends node{
  wall(int xcor, int ycor){
    super(xcor,ycor);
   fillRights(0);
   fillAboves(0);
  }
  void fillSquare(int f){
    fill(f);
    rect(xcor*cellSize+wallSize,ycor*cellSize+wallSize,cellSize-rows+1,cellSize-cols+1);
  }
  void fillRights(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize,cellSize+wallSize);
  }
  
  void fillAboves(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize+cellSize,wallSize);
  }
  
  void fillRight(int f){
    fill(f);
    rect((xcor-1)*cellSize,ycor*cellSize,cellSize,wallSize-cellSize);
  }
  
  void fillAbove(int f){
    fill(f);
    rect(xcor*cellSize,(ycor-1)*cellSize,wallSize-cellSize,cellSize);
  }
  
  void fillLeft(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,cellSize,wallSize-cellSize);
  }
  
  void fillBelow(int f){
    fill(f);
    rect(xcor*cellSize,ycor*cellSize,wallSize-cellSize,cellSize);
  }

    
  String toString(){
    return xcor + " " + ycor;
  }
}


