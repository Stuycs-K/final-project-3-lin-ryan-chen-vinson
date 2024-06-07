abstract class Piece{
  color c;
  Square position;
  boolean firstTurn;
  boolean hasMoved;
  
  public Piece(Square position, color c){
    this.position = position;
    this.c = c; 
  }
  
  public void setFirstTurn(){
    this.firstTurn = false;
  }
  
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
  
  public boolean causesCheck(Board board, Square dSquare){
    Square original = this.position;
    Piece captured = dSquare.getPiece();
    original.removePiece();
    dSquare.setPiece(this);
    this.setPosition(dSquare);
    
    boolean isInCheck = board.isInCheck(this.c);
    dSquare.setPiece(captured);
    original.setPiece(this);
    this.setPosition(original);
    
    return isInCheck;
  }
}
