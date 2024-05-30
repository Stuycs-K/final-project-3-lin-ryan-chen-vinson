class Square{
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
  public boolean isFull(){
    return piece != null;
  }
  
  public int getX(){
    return xCoord;
  }
  
  public int getY(){
    return yCoord;
  }
  
  public void removePiece(){
    this.piece = null;
  }
}
