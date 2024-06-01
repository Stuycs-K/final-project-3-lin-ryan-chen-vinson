import java.util.ArrayList;

class Pawn extends Piece {
  private boolean firstTurn;
  
  public Pawn(Square position, color c){
    super(position, c);
    this.firstTurn = true;
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
    
    
    
    
  }
}
