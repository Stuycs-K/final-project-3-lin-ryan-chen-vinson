public abstract class Piece{
  color c;
  //Square position;
  int x, y;
  
  public Piece(int x, int y, color c){
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  public abstract boolean isValidMove(int newX, int newY);
}
