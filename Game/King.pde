import java.util.*;

class King extends Piece{
  public King(Square position, color c){
    super(position, c);
    this.hasMoved = false;
  }
  
  public boolean isValidMove(int newX, int newY){
    int x = this.position.getX();
    int y = this.position.getY();
    int i = Math.abs(newX - x);
    int j = Math.abs(newY - y);
    
    return(i <= 1 && j <=1);
  }
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square>list = new ArrayList<Square>();
    int x = this.position.getX();
    int y = this.position.getY();
    
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
        if(!(i==0 && j==0)){
          int destinationX = x + i;
          int destinationY = y + j;
          if(isValidMove(destinationX, destinationY)){
            if(destinationX >= 0 && destinationY >= 0 && destinationX < 8 && destinationY < 8){
              Square dSquare = board[destinationX][destinationY];
              if(!dSquare.isFull() || dSquare.getPiece().getColor() != this.c){
                list.add(dSquare);
              }
            }
          }
        }
      }
    }
    return list;
  }
}
