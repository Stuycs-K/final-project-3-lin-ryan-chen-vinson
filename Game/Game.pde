static final int SQUARE_SIZE = 100;
Board board;
PImage kingW, kingB, queenW, queenB, rookW, rookB, bishopW, bishopB, knightW, knightB, pawnW, pawnB;

void setup(){
  size(800,800);
  board = new Board();
}

void grid() {
  int horSquares = width / SQUARE_SIZE;
  int vertSquares = height / SQUARE_SIZE;
  for(int i = 0; i < horSquares; i++) {
    for (int x = 0; x < vertSquares; x++) {
      if ((i+x) % 2 == 0){
        fill(118,150,86);
        stroke(118,150,86);
      }
      else{
        fill(238,238,210);
        stroke(238,238,210);
      }
      square(SQUARE_SIZE * x, SQUARE_SIZE * i, SQUARE_SIZE);
    }
  }
}

void draw(){
  grid();
}

void drawPieces(){
  for (int i = 0; i < 8; i++){
    for (int j = 0; j < 8; j++){
      Square square = board.getSquare(i, j);
      if (square.isFull()){
        Piece piece = square.getPiece();
        PImage img = getPieceImage(piece);
        if (img != null){
          image(img, SQUARE_SIZE * j, SQUARE_SIZE * i, SQUARE_SIZE, SQUARE_SIZE);
        }
      }
    }
  }
}

PImage getPieceImage(Piece piece){
  if (piece.getClass() == King.class){
    if (piece.getColor() == 255){
      return kingW;
    }
    else{
      return kingB;
    }
  }
  return null;
}
