static final int SQUARE_SIZE = 100;
boolean win = false;
String winner = "";

void setup(){
  size(800,800);
}

void grid() {
  int horSquares = width / SQUARE_SIZE;
  int vertSquares = height / SQUARE_SIZE;
  for(int i = 0; i < horSquares; i++) {
    for (int x = 0; x < vertSquares; x++) {
      if ((i+x) % 2 == 0){
        fill(255);
      }
      else{
        fill(0);
      }
      square(SQUARE_SIZE * x, SQUARE_SIZE * i, SQUARE_SIZE);
    }
  }
}

void draw(){
  if (win){
    winScreen(winner);
  }
  else{
    grid();
    checkWinCond();
  }
}

void checkWinCond(){
  if (win == false){
    win = true;
    winner = "White";
    redraw();
  }
}

void winScreen(String winner){
  background(0);
  textAlign(CENTER);
  textSize(64);
  fill(255);
  text(winner + " won!", width / 2, height / 2);
}

void keyPressed(){
  if (win && key == 'n'){
    reset();
  }
}

void reset(){
  win = false;
  winner = "";
  redraw();
}
