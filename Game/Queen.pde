import java.util.*;

public class Queen extends Piece{
  public Queen(Square position, color c){
    super(position, c);
  }
  
  public boolean isValidMove(int newX, int newY){
    int currX = position.getX();
    int currY = position.getY();
    
    if (newX == currX || newY == currY || Math.abs(newX - currX) == Math.abs(newY - currY)){
      return true;
    }
    return false;
  }
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square> list = new ArrayList<Square>();
    int currX = position.getX();
    int currY = position.getY();
    
    for(int i = currY - 1; i >= 0; i--){
      Square square = board[currX][i];
      if(square.isFull()){
        if(square.getPiece().getColor() != this.c){
          list.add(square);
        }
        break;
      }else{
        list.add(square);
      }
    }
    
    for(int i = currY + 1; i < board.length; i++){
      Square square = board[currX][i];
      if(square.isFull()){
        if(square.getPiece().getColor() != this.c){
          list.add(square);
        }
        break;
      }else{
        list.add(square);
      }
    }
    
    for(int i = currX - 1; i >= 0; i--){
      Square square = board[i][currY];
      if(square.isFull()){
        if(square.getPiece().getColor() != this.c){
          list.add(square);
        }
        break;
      }else{
        list.add(square);
      }
    }
    
    for(int i = currX + 1; i < board.length; i++){
      Square square = board[i][currY];
      if(square.isFull()){
        if(square.getPiece().getColor() != this.c){
          list.add(square);
        }
        break;
      }else{
        list.add(square);
      }
    }
    
    int x = this.position.getX();
    int y = this.position.getY();
    
    int[][] directions = {{-1,1}, {1,1}, {-1, -1}, {1, -1}};
    
    for(int i = 0; i < 4; i++){
      int[] direction = directions[i];
      int dX = x + direction[0];
      int dY = y + direction[1];
      
      while(dX >= 0 && dY >= 0 && dX < 8 && dY < 8){
        Square dSquare = board[dX][dY];
        if(dSquare.isFull()){
          if(dSquare.getPiece().getColor() != this.c){
            list.add(dSquare);
          }
          break;
        } else{
          list.add(dSquare);
        }
        dX += direction[0];
        dY += direction[1];
      }
    }
    return list;
  }
}
