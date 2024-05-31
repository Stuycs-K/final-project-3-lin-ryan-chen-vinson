/*
class Move{
   Square start;
   Square end;
   Piece piece;
   boolean canCastle;
   
   public Move(Square start, Square end, Piece piece){
     this.start = start;
     this.end = end;
     this.piece = piece;
   }
   
   public boolean isValid(){
     return true;
   }
   
   public boolean makeMove(){
     if(isValid()){
       end.setPiece(piece);
       start.setPiece(null);
       piece.position = end;
       return true;
     }
     return false;
   }
}
*/
