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
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square> validMoves = new ArrayList<Square>();
    int currX = position.getX();
    int currY = position.getY();
    
    for (int i = 0; i < board.length; i++){
      if (i != currY){
        Square square = board[currX][i];
        if (!square.isFull() || square.getPiece().getColor() != this.c){
          validMoves.add(square);
        }
        if (square.isFull()){
          break;
        }
      }
    }
    
    for (int i = 0; i < board.length; i++){
      if (i != currX){
        Square square = board[i][currY];
        if (!square.isFull() || square.getPiece().getColor() != this.c){
          validMoves.add(square);
        }
        if (square.isFull()){
          break;
        }
      }
    }
    return validMoves;
  }
}
