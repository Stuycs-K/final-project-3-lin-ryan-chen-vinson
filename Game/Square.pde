public class Square{
  int xCoord, yCoord;
  Piece piece;
  
  public Square(int x, int y){
    xCoord = x;
    yCoord = y;
    this.piece = null;
  }
  public Square(int x, int y, Piece piece){
    Square(x, y);
    this.piece = piece;
}
