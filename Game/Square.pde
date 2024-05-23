public class Square{
  private int xCoord, yCoord;
  private Piece piece;
  
  public Square(int x, int y){
    xCoord = x;
    yCoord = y;
    this.piece = null;
  }
  public Square(int x, int y, Piece piece){
    Square(x, y);
    this.piece = piece;
  }
  public getPiece(){
    return piece;
  }
  public setPiece(Piece newPiece){
    this.piece = newPiece;
  }
}
