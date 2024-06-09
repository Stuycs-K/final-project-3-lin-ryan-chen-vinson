static final int SQUARE_SIZE = 100;
Board board;
PImage kingW, kingB, queenW, queenB, rookW, rookB, bishopW, bishopB, knightW, knightB, pawnW, pawnB;
Piece selected = null;
ArrayList<Square> list = new ArrayList<Square>();
boolean isWhiteTurn = true;
boolean isPromoting = false;
Square promoSq = null;
Piece promoP = null;
int[] prevPosition = new int[]{1000000, 1000000};
int[] currPosition = new int[]{1000000, 1000000};
Piece potentialRook = null;
boolean castlingAttempt = false;
boolean isGameOver = false;
String winner = "";
int wbChecked = 3;

void setup(){
  size(800,850);
  board = new Board();
  loadImages();
  noLoop();
}

void draw(){
  grid();
  drawNotation();
  drawValidMoves();
  drawPreviousMove();
  drawPieces();
  if (isPromoting){
    drawPromoScreen();
  }
  if (isGameOver){
    drawWinScreen();
  }
  drawCheckScreen();
}

void grid() {
  int horSquares = width / SQUARE_SIZE;
  int vertSquares = height / SQUARE_SIZE;
  for(int i = 0; i < horSquares; i++) {
    for (int x = 0; x < vertSquares; x++) {
      if ((i+x) % 2 == 0){
        fill(238,238,210);
        stroke(238,238,210);
      }
      else{  
        fill(118,150,86);
        stroke(118,150,86);
      }
      square(SQUARE_SIZE * x, SQUARE_SIZE * i, SQUARE_SIZE);      
    }
  }
  fill(255);
  rect(0, 801, 800, 50);
}

void drawNotation(){
  char[] lets = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
  int[] nums = new int[]{8, 7, 6, 5, 4, 3, 2, 1};
  for (int x = 0; x < 8; x++){
    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(lets[x], SQUARE_SIZE * x + 50, 793);
  }
  for (int y = 0; y < 8; y++){
    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(nums[y], 10, SQUARE_SIZE * y + 50);
  }
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

void mousePressed(){
  if (isPromoting){
    promoPressed();
    return;
  }
  
  if (isGameOver){
    return;
  }
  
  int x = mouseY/SQUARE_SIZE;
  int y = mouseX/SQUARE_SIZE;
  
  
  if(selected == null){
    Square square = board.getSquare(x,y);
    if(square != null && square.isFull()){
      selected = square.getPiece();
      if (isWhiteTurn && selected.getColor() == 255 || !isWhiteTurn && selected.getColor() == 0){
        list = selected.getValidMoves(board.board);
        ArrayList<Square> validMoves = new ArrayList<Square>();
        for(int i = 0; i < list.size(); i++){
          Square move = list.get(i);
          if(!selected.causesCheck(board, move)){
            validMoves.add(move);
          }
        }
        list = validMoves;
        if(selected.getClass() == King.class && !selected.hasMoved){
          highlightCastling((King) selected);
        }
      }
      else {
        selected = null;
      }
    }
  } 
  else{
    Square square = board.getSquare(x,y);
    if(selected.getClass() == King.class && square != null && square.isFull() && square.getPiece().getClass() == Rook.class){
      potentialRook = square.getPiece();
      if(isValidCastling((King) selected, (Rook) potentialRook)){
        castlingAttempt = true;
        makeMove(selected, potentialRook.getPosition());
      }
    } else if(!castlingAttempt && square != null && list.contains(square)){
        makeMove(selected, square);
        if (selected.getClass() == Pawn.class){
        if (isPawnPromotion((Pawn) selected)){
          isPromoting = true;
          promoSq = square;
          promoP = selected;
        } else{
          selected.setFirstTurn();
        }
      }
      if (!isPromoting){
        isWhiteTurn = !isWhiteTurn;
      }
    }
    selected = null;
    list.clear();
  }
  
  color c = 0;
  if(isWhiteTurn){
    c = 255;
  }
  if(board.isInCheck(c)){
    if(board.isCheckmate(c)){
      if(isWhiteTurn){
        winner = "Black";
      } 
      else{
        winner = "White";
      }
      isGameOver = true;
    }
    else{
      if(isWhiteTurn){
        wbChecked = 0;
      }
      else{
        wbChecked = 1;
      }
    }
  }
  redraw();
}
      
void makeMove(Piece piece, Square dSquare){
  prevPosition[0] = piece.getPosition().getX();
  prevPosition[1] = piece.getPosition().getY();
  currPosition[0] = dSquare.getX();
  currPosition[1] = dSquare.getY();
  
  Square current = piece.getPosition();
  current.removePiece();
  
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      Piece p = board.getSquare(i, j).getPiece();
      if(p != null && p.getClass() == Pawn.class && p.getColor() == piece.getColor()){
        ((Pawn) p).setJustMovedTwo(false);
      }
    }
  }
  
  if(piece.getClass() == Pawn.class && Math.abs(currPosition[0] - prevPosition[0]) == 2){
    ((Pawn) piece).setJustMovedTwo(true);
  }
  
  if(piece.getClass() == Pawn.class && Math.abs(currPosition[1] - prevPosition[1]) == 1 && !dSquare.isFull() && 
  board.getSquare(prevPosition[0], currPosition[1]).isFull()){
    Square captured = board.getSquare(prevPosition[0], currPosition[1]);
    captured.removePiece();
  }
  
  dSquare.setPiece(piece);
  piece.setPosition(dSquare);
  piece.hasMoved = true;
  
  if(piece.getClass() == King.class && Math.abs(prevPosition[1] - currPosition[1]) == 2){
    handleCastling();
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
  else if (piece.getClass() == Queen.class){
    if (piece.getColor() == 255){
      return queenW;
    }
    else{
      return queenB;
    }
  }
  else if (piece.getClass() == Bishop.class){
    if (piece.getColor() == 255){
      return bishopW;
    }
    else{
      return bishopB;
    }
  }
  else if (piece.getClass() == Rook.class){
    if (piece.getColor() == 255){
      return rookW;
    }
    else{
      return rookB;
    }
  }
  else if (piece.getClass() == Knight.class){
    if (piece.getColor() == 255){
      return knightW;
    }
    else{
      return knightB;
    }
  }
  else if (piece.getClass() == Pawn.class){
    if (piece.getColor() == 255){
      return pawnW;
    }
    else{
      return pawnB;
    }
  }
  else {
    return null;
  }
}

void loadImages(){
  kingW = loadImage("kingW.png");
  kingB = loadImage("kingB.png");
  queenW = loadImage("queenW.png");
  queenB = loadImage("queenB.png");
  rookW = loadImage("rookW.png");
  rookB = loadImage("rookB.png");
  pawnW = loadImage("pawnW.png");
  pawnB = loadImage("pawnB.png");
  bishopW = loadImage("bishopW.png");
  bishopB = loadImage("bishopB.png");
  knightW = loadImage("knightW.png");
  knightB = loadImage("knightB.png");
}

void keyPressed(){
  if (key == 'r'){
    resetGame();
    redraw();
  }
  if (key == 'c'){
    castleInitialization();
    redraw();
  }
  if (key == 'p') {
    pawnPromoInitialization();
    redraw();
  }
  if (key == 'e'){
    enPassantInitialization();
    redraw();
  }
  if (key == '1'){
    checkInitialization();
    redraw();
  }
  if (key == '2'){
    checkmateInitialization();
    redraw();
  }
}

void resetGame(){
  isWhiteTurn = true;
  isGameOver = false;
  wbChecked = 3;
  board = new Board();
  prevPosition = new int[]{1000000, 1000000};
  currPosition = new int[]{1000000, 1000000};
  winner = "";
}

boolean isPawnPromotion(Pawn pawn){
  int r = pawn.getPosition().getX();
  return (pawn.getColor() == 255 && r == 0) || (pawn.getColor() == 0 && r == 7);
}

void promote(Piece piece){
  promoSq.setPiece(piece);
  isPromoting = false;
  promoSq = null;
  promoP = null;
  isWhiteTurn = !isWhiteTurn;
  redraw();
}

void drawPromoScreen(){
  fill(255);
  rect(225, 312.5, 350, 175, 15);
  textSize(24);
  fill(0);
  text("PROMOTE TO: ", 330, 345);
  if (isWhiteTurn){
    image(queenW, 250, 370, 75, 75);
    image(knightW, 325, 370, 75, 75);
    image(rookW, 400, 370, 75, 75);
    image(bishopW, 475, 370, 75, 75);
  } else {
    image(queenB, 250, 370, 75, 75);
    image(knightB, 325, 370, 75, 75);
    image(rookB, 400, 370, 75, 75);
    image(bishopB, 475, 370, 75, 75);
  }
}

void promoPressed(){
  int x = mouseX;
  int y = mouseY;
  if (x >= 250 && x <= 325 && y >= 370 && y <= 445){
    promote(new Queen(promoSq, promoP.getColor()));
  } else if (x >= 325 && x <= 400 && y >= 370 && y <= 445){
    promote(new Knight(promoSq, promoP.getColor()));
  } else if (x >= 400 && x <= 475 && y >= 370 && y <= 445){
    promote(new Rook(promoSq, promoP.getColor()));
  } else if (x >= 475 && x <= 550 && y >= 370 && y <= 445){
    promote(new Bishop(promoSq, promoP.getColor()));
  }
}

void drawValidMoves() {
  fill(255, 0, 0, 100);
  noStroke();
  for (Square s : list) {
    square(s.getY() * SQUARE_SIZE, s.getX() * SQUARE_SIZE, SQUARE_SIZE);
  }
  if (selected != null){
    fill(189, 255, 211, 100);
    noStroke();
    square(selected.getPosition().getY() * SQUARE_SIZE, selected.getPosition().getX() * SQUARE_SIZE, SQUARE_SIZE);
  }
}

boolean canCastle(King king, boolean kingside){
  int x = king.getPosition().getX();
  int y = king.getPosition().getY();
  int rookCoord;
  int a;
  
  if(kingside){
    rookCoord = 7;
    a = 1;
  }
  else{
    rookCoord = 0;
    a = -1;
  }
  
  for(int i = 1; i <= 2; i ++){
    if(board.getSquare(x, y + (i * a)).isFull()){
      return false;
    }
  }
  if(!kingside){
    if(board.getSquare(x, y - 3).isFull()){
      return false;
    }
  }
  Piece rook = board.getSquare(x, rookCoord).getPiece();
  return(rook != null && rook.getClass() == Rook.class && !rook.hasMoved);
}

boolean isValidCastling(King king, Rook rook){
  if(king.hasMoved || rook.hasMoved){
    return false;
  }
  int x = king.getPosition().getX();
  int kingY = king.getPosition().getY();
  int rookY = rook.getPosition().getY();
  int a;
  
  if(kingY < rookY){
    a = 1;
  }
  else{
    a = -1;
  }
  
  for(int i = 1; i < Math.abs(kingY - rookY); i++){
    Square square = board.getSquare(x, kingY + i * a);
    if(square.isFull() || king.causesCheck(board, square)){
      return false;
    }
  }
  return true;
}

void handleCastling(){
  int rookSY;
  int rookDY;
  if(currPosition[1] > prevPosition[1]){
    rookSY = 7;
    rookDY = currPosition[1] -1;
  } 
  else{
    rookSY = 0;
    rookDY = currPosition[1] + 1;
  }
  
  Square rookSSquare = board.getSquare(currPosition[0], rookSY);
  Square rookDSquare = board.getSquare(currPosition[0], rookDY);
  Piece rook = rookSSquare.getPiece();
  
  rookSSquare.removePiece();
  rookDSquare.setPiece(rook);
  rook.setPosition(rookDSquare);
  rook.hasMoved = true;
}

void highlightCastling(King king){
  int x = king.getPosition().getX();
  int y = king.getPosition().getY();
  if(canCastle(king, true)){
    list.add(board.getSquare(x, y + 2));
  }
  if(canCastle(king, false)){
    list.add(board.getSquare(x, y - 2));
  }
}

void drawPreviousMove(){
  fill(189, 255, 211, 100);
  noStroke();
  square(prevPosition[1] * SQUARE_SIZE, prevPosition[0] * SQUARE_SIZE, SQUARE_SIZE);
  square(currPosition[1] * SQUARE_SIZE, currPosition[0] * SQUARE_SIZE, SQUARE_SIZE);
}

void drawWinScreen(){
  fill(0, 0, 0, 100);
  rect(0, 0, width, height);
  textSize(64);
  if (isWhiteTurn){
    fill(0);
  } else {
    fill(255);
  }
  textAlign(CENTER, CENTER);
  text(winner + " won!", width / 2, height / 2);
  textSize(32);
  text("Press 'r' to restart", width / 2, height / 2 + 50);
}

void drawCheckScreen(){
  if (wbChecked == 0){
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("White is in check",  width / 2, 825);
  }
  if (wbChecked == 1){
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Black is in check",  width / 2, 825);
  }
  else if (wbChecked == 3){
    String p;
    if (isWhiteTurn){
      p = "White's";
    } else {
      p = "Black's";
    }
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(p + " turn",  width / 2, 825);
  }
  wbChecked = 3;
}

void castleInitialization(){
  resetGame();
  board.getSquare(7, 2).removePiece();
  board.getSquare(7, 3).removePiece();
  board.getSquare(0, 5).removePiece();
}

void pawnPromoInitialization(){
  resetGame();
  board.getSquare(1, 6).setPiece(new Pawn(board.board[1][6], 255));
  board.getSquare(6, 6).setPiece(new Pawn(board.board[6][6], 0));
}

void enPassantInitialization(){
  resetGame();
  board.getSquare(6, 3).removePiece();
  board.getSquare(3, 3).setPiece(new Pawn(board.board[3][3], 255));
}

void checkInitialization(){
  resetGame();
  board.getSquare(6, 4).removePiece();
  board.getSquare(1, 4).removePiece();
  board.getSquare(1, 5).removePiece();
}
  
void checkmateInitialization(){
  resetGame();
  board.getSquare(6, 4).removePiece();
  board.getSquare(1, 6).removePiece();
  board.getSquare(1, 5).removePiece();
}
