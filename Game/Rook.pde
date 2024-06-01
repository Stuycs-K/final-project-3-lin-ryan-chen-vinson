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
    
    return list;
  }
}
