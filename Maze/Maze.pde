
import java.util.Random;

int rows, cols, cellSize, wallSize, windowSize;
Board bd;

wall entrance, exit;    
wall[][] grid;
Random rnd = new Random();
PVector playerCoord = new PVector(1,11); 
player p1,oldp1;
PImage img;

void setup(){
    windowSize = 640;
    wallSize = 10;
    rows = 22;
    cols = rows;
    noStroke();
    cellSize = windowSize/(rows-1);
    size(windowSize,windowSize);
    background(255);
    bd = new Board();
    bd.makeMaze();
    player p1 = new player(playerCoord);
    oldp1 = p1;
    img = loadImage("victory.jpg");
}


//colors over and redraws player based on new coordinates
void draw(){
  oldp1.fillEllipse();
  player p1 = new player(playerCoord);
  oldp1 = p1;
}
	/*
		checks if wall to the right
		checkleft,below,above do the same for each respective case
		checkVictory checks if you're at the exit
	*/

     boolean checkRight(){

     PImage Image = get((int)playerCoord.x*cellSize,(int)playerCoord.y*cellSize-wallSize-wallSize,wallSize,(cellSize-wallSize));
     color c = Image.get(1,1);
     return c == -1;
    }
    
    boolean checkLeft(){
     PImage Image = get((int)playerCoord.x*cellSize-cellSize,(int)playerCoord.y*cellSize-wallSize-wallSize,wallSize,(cellSize-wallSize));
     color c = Image.get(1,1);
     return c == -1;
    }
    
    boolean checkBelow(){
     PImage Image = get((int)playerCoord.x*cellSize-wallSize-wallSize,(int)playerCoord.y*cellSize,(cellSize-wallSize),wallSize);
     color c = Image.get(1,1);
     return c == -1;
    }
    
    boolean checkAbove(){
       PImage Image = get((int)playerCoord.x*cellSize-wallSize-wallSize,(int)playerCoord.y*cellSize-cellSize,(cellSize-wallSize),wallSize);
       color c = Image.get(1,1);
       return c == -1;
    }
    
    boolean checkVictory(){
        PImage Image = get((int)playerCoord.x*cellSize,(int)playerCoord.y*cellSize-wallSize-wallSize,wallSize,(cellSize-wallSize));
       color c = Image.get(1,1);
       return c == -16127917;
    }
    
/*
	modifies the player coordinates 
	based on what keys they press
*/
void keyPressed(){
  int pX = (int)playerCoord.x;
  int pY = (int)playerCoord.y;
  if(key == CODED){
    switch(keyCode){
      case UP:
        if(checkAbove()){ 
          playerCoord.y--;
        }
        break;
      case DOWN:
      if(checkBelow()){ 
        playerCoord.y++;
      }
        break;
      case LEFT:
      if(checkLeft()){ 
        playerCoord.x--;
      }
        break;
      case RIGHT:
      if(checkRight()){ 
        playerCoord.x++;
      } else if (checkVictory()){
        noLoop();
        image(img,0,0);
      }
        break;
    }
  }
}


