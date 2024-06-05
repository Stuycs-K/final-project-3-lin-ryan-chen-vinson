static final int SQUARE_SIZE = 100;
Board board;
PImage kingW, kingB, queenW, queenB, rookW, rookB, bishopW, bishopB, knightW, knightB, pawnW, pawnB;
Piece selected = null;
ArrayList<Square> list = new ArrayList<Square>();
boolean isWhiteTurn = true;
boolean isPromoting = false;
Square promoSq = null;
Piece promoP = null;


void setup(){
  size(800,800);
  board = new Board();
  loadImages();
  noLoop();
}

void draw(){
  grid();
  drawPieces();
  if (isPromoting){
    drawPromoScreen();
  }
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
      }
      else {
        selected = null;
      }
    }
  }else{
    Square dSquare = board.getSquare(x, y);
    if(dSquare != null && list.contains(dSquare)){
      makeMove(selected, dSquare);
      if (selected.getClass() == Pawn.class){
        if (isPawnPromotion( (Pawn) selected)){
          isPromoting = true;
          promoSq = dSquare;
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
        println("White is in checkmate"); // temporary msg
      } 
      else{
        println("Black is in checkmate"); //temporary msg
      }
    }
    else{
      if(isWhiteTurn){
        println("White is in check");
      }
      else{
        println("Black is in check");
      }
    }
  }
  redraw();
}
  
      

void makeMove(Piece piece, Square dSquare){
  Square current = piece.getPosition();
  current.removePiece();
  dSquare.setPiece(piece);
  piece.setPosition(dSquare);
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
}

void resetGame(){
  isWhiteTurn = true;
  board = new Board();
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
    System.out.println("Queen selected");
  } else if (x >= 325 && x <= 400 && y >= 370 && y <= 445){
    promote(new Knight(promoSq, promoP.getColor()));
    System.out.println("Knight selected");
  } else if (x >= 400 && x <= 475 && y >= 370 && y <= 445){
    promote(new Rook(promoSq, promoP.getColor()));
    System.out.println("Rook selected");
  } else if (x >= 475 && x <= 550 && y >= 370 && y <= 445){
    promote(new Bishop(promoSq, promoP.getColor()));
    System.out.println("Bishop selected");
  }
}
