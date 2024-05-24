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
