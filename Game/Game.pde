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
