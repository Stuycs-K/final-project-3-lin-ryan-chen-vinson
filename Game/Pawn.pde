public class Pawn extends Piece{
  public Pawn(Square position, color c){
    super(position, c);
    
    if (c == color(0)){
      PImage p = loadImage("pawnW.png");
    }
    else{
      PImage p = loadImage("pawnB.png");
    }
  }
}
