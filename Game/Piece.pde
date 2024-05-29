abstract class Piece{
  color c;
  Square position;
  //int x, y;
  
  public Piece(Square position, color c){
    this.position = position;
    this.c = c; 
    
  }
  
  public abstract boolean isValidMove(int newX, int newY);
  
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
