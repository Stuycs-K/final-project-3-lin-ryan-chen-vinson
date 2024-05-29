import java.util.*;

class King extends Piece{
  public King(Square position, color c){
    super(position, c);
    
    if (c == color(0)){
      PImage p = loadImage("kingW.png");
    }
    else{
      PImage p = loadImage("kingB.png");
    }
  }
  
  public boolean isValidMove(int newX, int newY){
    int i = this.position.getX;
    int j = Math.abs(newY - y);
    return (i <= 1 && j <=1);
  }
  
  public ArrayList<Square> getValidMoves(int destinationX, int destinationY){
    ArrayList<Square>list = new ArrayList<Square>();
    if(board.getSquare(x - 1, y)
  }
}
