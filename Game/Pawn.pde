public class Pawn extends Piece{
  public Pawn(Square position, color c){
    super(position, c);
    
    if (c == color(255)){
      PImage p = loadImage("pawnW.png");
    }
    else{
      PImage p = loadImage("pawnB.png");
    }
  }
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square> validMoves = new ArrayList<Square>();
    int currX = position.getX();
    int currY = position.getY();
    int dir;
    int r;
    
    if (this.c == color(255)){
      dir = 1;
      r = 6;
    }
    else {
      dir = -1;
      r = 1;
    }
    
    if (!board[currX][currY + dir].isFull()) {
      validMoves.add(board[currX][currY + dir]);
    }

    if (currY == r && !board[currX][currY + dir].isFull() && !board[currX][currY + 2 * dir].isFull()) {
      validMoves.add(board[currX][currY + 2 * dir]);
    }

    if (currX > 0 && board[currX - 1][currY + dir].isFull() && board[currX - 1][currY + dir].getPiece().getColor() != this.c) {
      validMoves.add(board[currX - 1][currY + dir]);
    }
   
    if (currX < 7 && board[currX + 1][currY + dir].isFull() && board[currX + 1][currY + dir].getPiece().getColor() != this.c) {
      validMoves.add(board[currX + 1][currY + dir]);
    }

    return validMoves;
  }
}
