abstract class Piece{
  color c;
  Square position;
  //int x, y;
  
  public Piece(Square position, color c){
    this.position = position;
    this.c = c; 
    
  }
  
  //public abstract boolean isValidMove(int newX, int newY);
  
  public abstract ArrayList<Square> getValidMoves(Square[][] board);
  
  public color getColor(){
    return c;
  }
  
  public Square getPosition(){
    return position;
  }
  
  public void setPosition(Square position){
    this.position = position;
  }
  
  /*
  public boolean isValid(int newX, int newY){
    if (newX < 0 || newX >= boardSize || newY < 0 || newY >= boardSize) {
      return false;
    }
    if (newX == x && newY == y) {
      return false;
    }
  }
  */
}
