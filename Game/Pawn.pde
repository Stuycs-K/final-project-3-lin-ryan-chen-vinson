import java.util.ArrayList;

class Pawn extends Piece {
    public Pawn(Square position, color c) {
        super(position, c);
    }

  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square>list = new ArrayList<Square>();
    int x = this.position.getX();
    int y = this.position.getY();
  }
}
