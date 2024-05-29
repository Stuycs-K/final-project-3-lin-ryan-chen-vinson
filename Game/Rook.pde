import java.util.ArrayList;

public class Rook extends Piece{
  public Rook(Square position, color c){
    super(position, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int currentX = position.getX();
    int currentY = position.getY();
    
    if (newX == currentX || newY == currentY){
      return true;
    }
    return false;
  }
}
