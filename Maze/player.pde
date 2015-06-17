class player{
    PVector coords;
    PVector position;
    int radius;
    player(PVector c){
      coords = c;
      fill(10,140,40);
      radius = cellSize-wallSize-2;
      position = new PVector();
      update();
      ellipse(position.x,position.y,radius,radius);
    }
    
    void fillEllipse(){
      fill(255);
      ellipse(position.x,position.y,radius+1,radius+1);
    }
    void update(){
      position.set(coords.x*cellSize-wallSize,coords.y*cellSize-wallSize);
    }
    
}
