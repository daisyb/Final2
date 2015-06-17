/*
	equivalent of node class
	stores data for black walls on either side
	the fill commands will change the colors of
	those walls, usually to white
*/

class wall{
  boolean left,right,above,below;
  boolean exit,entrance;
  boolean visited;
  int xcor,ycor;
  wall(int xcor, int ycor){
    this.xcor = xcor;
    this.ycor = ycor;
   left=false;
   right=false;
   above=false;
   below=false;
    fill(0);
    rect(xcor*cellSize,(ycor)*cellSize,wallSize,cellSize+wallSize);
    rect(xcor*cellSize,(ycor)*cellSize,wallSize+cellSize,wallSize);
    
      if(ycor<=1) above = true;
      if(xcor<=1) left = true;
      if(ycor>=rows-1)below=true;
      if(xcor>=cols-1)right=true;
  }

/*
	the get functions return adjacent cells
*/  

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


/* 	
	fills the center of each cell, 
	mostly for testing purposes
  */

    void fillSquare(int f){
      fill(f);
      rect((xcor-1)*cellSize+wallSize,(ycor-1)*cellSize+wallSize,cellSize-rows+1,cellSize-cols+1);
    }
	
	/* 
	fills the left and right walls colors other than black grey or white
	*/

    void fillLeft(int f1,int f2,int f3){
      fill(f1,f2,f3);
      rect((xcor-1)*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
      left = true;
      if(getLeft() != null) getLeft().right=true;
    }
    
    void fillRight(int f1,int f2,int f3){
     fill(f1,f2,f3);
      rect(xcor*cellSize,ycor*cellSize,wallSize,wallSize-cellSize);
      right=true;
      if(getRight() != null) getRight().left=true;
    }
      

	/* 
	the remaining fill functions modify the color of all adjacent walls
	usually to white
*/
    void fillRight(int f){
      right=true;
      getRight().fillLeft(0);
    }
    
    void fillAbove(int f){
      above = true;
      getAbove().fillBelow(0);
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
    
   /* 
	checks to see if there are any remaining surrounding walls up
	*/
    boolean hasNeighbors(){
      int falseCount=0;
      if(!right)falseCount++;
      if(!left)falseCount++;
      if(!above)falseCount++;
      if(!below)falseCount++;
      return falseCount>0;
    }
    
/*
	picks out a random neighboring node
*/
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
      } else if(n==getLeft()){
        fillLeft(255);
      } else if(n==getAbove()){
        fillAbove(255);
      } else if(n==getBelow()){
        fillBelow(255);
      }
      //println(a + " a " + n +" n");
      return n;
    }
      
    
    String toString(){
      return xcor + " " + ycor;
    }
  }

