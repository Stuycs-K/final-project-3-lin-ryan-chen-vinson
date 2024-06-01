abstract class Piece{
  color c;
  Square position;
  
  public Piece(Square position, color c){
    this.position = position;
    this.c = c; 
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
}
