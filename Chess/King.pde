class King extends Piece{
  public King(int x, int y, color c){
    super(x, y, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int i = Math.abs(newX - x);
    int j = Math.abs(newY - y);
    return (i <= 1 && j <=1);
  }
}
