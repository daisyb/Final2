/*
  class to store the coordinates
  of the player ellipse
  */

class player{
    PVector coords; //coordinates in grid[][]
    PVector position; //pixel coordinates
    int radius;
    player(PVector c){
      coords = c;
      fill(10,140,40);
      radius = cellSize-wallSize-2;
      position = new PVector();
      update();
      ellipse(position.x,position.y,radius,radius);
    }
    
    //white ellipse for clearing old image
    void fillEllipse(){
      fill(255);
      ellipse(position.x,position.y,radius+1,radius+1);
    }
    
    //modifies position based on coords
    void update(){
      position.set(coords.x*cellSize-wallSize,coords.y*cellSize-wallSize);
    }
    
}
