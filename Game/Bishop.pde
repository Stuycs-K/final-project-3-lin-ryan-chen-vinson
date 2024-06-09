import java.util.*;

class Bishop extends Piece{
  public Bishop(Square position, color c){
    super(position, c);
  }
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square>list = new ArrayList<Square>();
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
