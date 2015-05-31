import java.util.LinkedList;

/*
  so I googled stuff and found this:
  http://en.wikipedia.org/wiki/Maze_generation_algorithm
  I was thinking of doing the Recursive Backtracker:
  
    1.Make the initial cell the current cell and mark it as visited
    2.While there are unvisited cells
      1.If the current cell has any neighbours which have not been visited
        1.Choose randomly one of the unvisited neighbours
        2.Push the current cell to the stack
        3.Remove the wall between the current cell and the chosen cell
        4.Make the chosen cell the current cell and mark it as visited
      2.Else if stack is not empty
        1.Pop a cell from the stack
        2.Make it the current cell
      3.Else
        1.Pick a random unvisited cell, make it the current cell and mark it as visited

  I mean probably any algorithm would work and we have the ability to code all of them,
  this one was just sort of similar to what we did in class + effective
  for the "stack" I just made a built in LinkedList called frontier like in class
  
  what I've done so far:
    - made a 20X20 grid of 26X26(px?) white squares (numbers aren't perminate I just did what ever)
    - made a node class
      - stores x,y cords in grid
      - has functions to change square color to black, white, pink
        - black and white are for maze purposes, pink is just for testing
      - has boolean variables for whether it's been visited and whether it is white or black
      - arrayList which stores neighbors for 2.1 in the algorithm
        - idk if this is the most efficient way of doing it, it's just what I came up with first
      - toString
    - That's about it
    - do you think we should store classes in separate files(ie node class)? I was gonna do that but then I didn't
      know how to work processing so I just put it all in one.
    - This is all just preliminary stuff you can change whatever the hell you feel like.
    */


node[][] grid; //grid of nodes which corresponds to squares on the grid
LinkedList<node> frontier; //frontier for maze algorithm part

/*
  rows = # of rows in node grid
  cols = # of collumns in node grid
  cellSize = pixel height/width of the square cells in the grid
  windowSize = size of actual processing window
*/
int rows,cols,cellSize,windowSize; 


/*
  sets the variables
  initiates all the nodes in grid
 */
void setup(){
  windowSize = 520;
  rows = 20;
  cols = rows;
  cellSize = windowSize/rows;
  size(windowSize,windowSize);
  background(0);
  frontier = new LinkedList<node>();
  grid = new node[rows][cols];
  for(int r=0;r<rows;r++){
    for(int c=0;c<cols;c++){
      grid[r][c] = new node(r,c);
    }
  }
  grid[3][3].makeBlack();//test
  createMaze();

}



/*
  where the maze creation function will be
  you can change the name if you like
*/
void createMaze(){
  node current;
  /*
 while(current.visited == false){
   frontier.add(current);
   //if(
 }
 */
}


void draw(){
}



/*
  node class!
  copy/paste of what I wrote at the top:
     - stores x,y cords in grid
      - has functions to change square color to black, white, pink
        - black and white are for maze purposes, pink is just for testing
      - has boolean variables for whether it's been visited and whether it is white or black
      - arrayList which stores neighbors for 2.1 in the algorithm
        - idk if this is the most efficient way of doing it, it's just what I came up with first
      - toString
      
*/
class node{
  boolean visited; //true if visited, false if no
  boolean white;   //true if white, false otherwise
  int xcor,ycor;   //x,y coordinates in grid[][], but not in terms of pixels
  ArrayList<node> neighbors; //stores neighbors to the right,left,up,down
  //^have to call fillNeighbors before you can use
  
  
  /*
    sets x,y coordinates
    visited defaults to false
    color defaults to white
   */
  node(int xcor,int ycor) {
    visited = false;
    this.xcor = xcor;
    this.ycor = ycor;
    makeWhite();
    neighbors = new ArrayList<node>();
   
  }
  
  /*
    sets the color of the square corresponding to node coordinares
    black
    cellSize is used to convert our grid to the pixels that processing uses
  */
  void makeBlack(){
      fill(0);
      rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
      white = false;
  } 
  
  /*
    sets color to white
  */
  void makeWhite(){
    fill(255);
    rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
    white = true;
  }
    
  /*
    sets color to pink
   */
  void makePink(){
    fill(255,0,154);
    rect(xcor*cellSize,ycor*cellSize,cellSize,cellSize);
    white = false;
  }
  
  /*
    sets visited variable
  */
  void setVisited(boolean b){
    visited = b;
  }
  
  boolean getVisited(){
    return visited;
  }
  
  /*
    if neighbors hasn't been filled yet:
      adds nodes to neighbors depending on 
      wether thay are within the grid boundaries or not
    calls checkNeighbors
  */
  void fillNeighbors(){
    if(neighbors.size() == 0){
      if((xcor - 1) > 0){
        neighbors.add(grid[xcor-1][ycor]);
      } 
      if ((ycor -1)>0){
        neighbors.add(grid[xcor][ycor-1]);
      } 
      if ((xcor +1)< rows){
        
        neighbors.add(grid[xcor+1][ycor]);
      }
      if ((ycor+1) < cols){
        neighbors.add(grid[xcor][ycor+1]);
      }
    }
    
    checkNeighbors();
    
  }
  
  /*
    removes nodes that have been visited for 2.1.1
  */
  void checkNeighbors(){
    for(int i = 0;i<neighbors.size();i++){
      if(neighbors.get(i).visited){
        neighbors.remove(i);
      }
    }
  }
  
  String toString(){
    return "x:" + xcor + " y:" + ycor + " white?:" + white;
  } 
  
  /*
    one last thing:
    from what I understand processing likes to keep the variables public
    should we still use get/set variables or 
      just refer to the variables directly since they are public
  */
  
  
}
