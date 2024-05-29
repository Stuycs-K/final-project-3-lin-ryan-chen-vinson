import java.util.*;

class Bishop extends Piece{
  public Bishop(Square position, color c){
    super(position, c);
    if (c == color(255)){
      PImage p = loadImage("bishopW.png");
    }
    else{
      PImage p = loadImage("bishopB.png");
    }
  }
}
