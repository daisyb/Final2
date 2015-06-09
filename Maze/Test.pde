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
  grid[1][2].leftWhite();
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
    fill(0);
     makeBlack(false);
    makeBlack(true);
   
  }
  
  void makeBlack(boolean side){
    fill(0);
    if(!side){
       rect(xcor*cellSize,ycor*cellSize,cellSize+wallSize,wallSize);
    } else if(xcor != 5); {
      rect(xcor*cellSize,ycor*cellSize,wallSize,cellSize+wallSize);
    }
  }
  
  void makeWhite(boolean side){
      fill(255);
      if(!side){
         rect(xcor*cellSize,ycor*cellSize,cellSize,wallSize);
      } else {
        rect(xcor*cellSize,ycor*cellSize,wallSize-cellSize,cellSize);
      }
  }
  void leftWhite(){
    fill(255);
    rect(xcor*cellSize,ycor*cellSize,cellSize,wallSize-cellSize);
  }
  
  void bottomWhite(){
    fill(255);
    rect(xcor*cellSize,ycor*cellSize,wallSize-cellSize,cellSize);
  }
  String toString(){
    return xcor + " " + ycor;
  }
}


