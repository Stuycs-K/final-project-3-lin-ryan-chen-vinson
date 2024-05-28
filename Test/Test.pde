static final int SQUARE_SIZE = 100;

void setup(){
  size(800,800);
}

void grid() {
  int horSquares = width / SQUARE_SIZE;
  int vertSquares = height / SQUARE_SIZE;
  for(int i = 0; i < horSquares; i++) {
    for (int x = 0; x < vertSquares; x++) {
      fill(0, 0, 0);
      stroke(255, 255, 255);
      square(SQUARE_SIZE * i, SQUARE_SIZE * x, SQUARE_SIZE);
    }
  }
}

void draw(){
  grid();
}
