import java.util.*;

class King extends Piece{
  public King(int x, int y, color c){
    super(x, y, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int i = Math.abs(newX - x);
    int j = Math.abs(newY - y);
    return (i <= 1 && j <=1);
  }
  
  public ArrayList<Square> getValidMoves(int destinationX, int destinationY){
    ArrayList<Square>list = new ArrayList<Square>();
    if(board.getSquare(x - 1, y)
  }
}
