import java.util.*;

public class Queen extends Piece{
  public Queen(Square position, color c){
    super(position, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int currX = position.getX();
    int currY = position.getY();
    
    if (newX == currX || newY == currY || Math.abs(newX - currentX) == Math.abs(newY - currentY)){
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
    
    for (int i = 1; currX + i < board.length && currY + i < board.length; i++){
      Square square  = board[currX + i][currY + i];
      if (!square.isFull() || square.getPiece().getColor() != this.c){
        validMoves.add(square);
      }
      if(square.isFull()){
        break;
      }
    }
    return validMoves;
  }
}
