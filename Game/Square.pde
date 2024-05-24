public class Square{
  private int xCoord, yCoord;
  private Piece piece;
  
  public Square(int x, int y){
    xCoord = x;
    yCoord = y;
    this.piece = null;
  }
  public Square(int x, int y, Piece piece){
    xCoord = x;
    yCoord = y;
    this.piece = piece;
  }
  public Piece getPiece(){
    return piece;
  }
  public void setPiece(Piece newPiece){
    this.piece = newPiece;
  }
}
