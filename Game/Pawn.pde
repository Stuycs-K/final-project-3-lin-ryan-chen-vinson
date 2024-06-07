import java.util.ArrayList;

class Pawn extends Piece {
  public boolean justMovedTwo;
  
  
  public Pawn(Square position, color c){
    super(position, c);
    this.firstTurn = true;
    this.justMovedTwo = false;
  }
  
  public boolean hasJustMovedTwo(){
    return justMovedTwo;
  }
  
  public void setJustMovedTwo(boolean boo){
    this.justMovedTwo = boo;
  }
  
  public boolean isValidMove(Square[][] board, int x, int y){
    return x >= 0 && y >= 0 && x < 8 && y < 8;
  }

  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square>list = new ArrayList<Square>();
    int x = this.position.getX();
    int y = this.position.getY();
    
    int direction;
    if(c == 255){
      direction = -1;
    }else{
      direction = 1;
    }
    
    if(isValidMove(board, x + direction, y) && !board[x+direction][y].isFull()){
      list.add(board[x + direction][y]);
    }
    
    if(firstTurn && isValidMove(board, x + (2 * direction), y) && ! board[x + direction][y].isFull() && ! board[x + (2* direction)][y].isFull()){
      list.add(board[x + (2 * direction)][y]);
    }
    
    if(isValidMove(board, x + direction, y - 1) && board[x + direction][y - 1].isFull() &&
      board[x + direction][y - 1].getPiece().getColor() != this.c){
        list.add(board[x + direction][y - 1]);
      }
    if(isValidMove(board, x + direction, y + 1) && board[x + direction][y + 1].isFull() &&
      board[x + direction][y + 1].getPiece().getColor() != this.c){
        list.add(board[x + direction][y + 1]);
    }
    return list;
  }
}
