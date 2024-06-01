class Board{
  Square[][] board = new Square[8][8];

  public Board(){
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        board[i][j] = new Square(i, j);
      }
    }
    initializePieces();
  }

  public Square getSquare(int x, int y){
    if((x >= 0) && (x < 8) && (y >= 0) && (y < 8)){
      return board[x][y];
    }else{
      return null;
    }
  }
  public void initializePieces(){
    board[0][0].setPiece(new Rook(board[0][0], 0));
    board[0][1].setPiece(new Knight(board[0][1], 0));
    board[0][2].setPiece(new Bishop(board[0][2], 0));
    board[0][3].setPiece(new Queen(board[0][3], 0));
    board[4][4].setPiece(new King(board[4][4], 0));
    board[0][5].setPiece(new Bishop(board[0][5], 0));
    board[0][6].setPiece(new Knight(board[0][6], 0));
    board[0][7].setPiece(new Rook(board[0][7], 0));
    for(int i = 0; i < 8; i++){
      board[1][i].setPiece(new Pawn(board[1][i], 0));
    }
    board[7][0].setPiece(new Rook(board[7][0], 255));
    board[7][1].setPiece(new Knight(board[7][1], 255));
    board[7][2].setPiece(new Bishop(board[7][2], 255));
    board[7][3].setPiece(new Queen(board[7][3], 255));
    board[7][4].setPiece(new King(board[7][4], 255));
    board[7][5].setPiece(new Bishop(board[7][5], 255));
    board[7][6].setPiece(new Knight(board[7][6], 255));
    board[7][7].setPiece(new Rook(board[7][7], 255));
    for(int i = 0; i < 8; i++){
      board[6][i].setPiece(new Pawn(board[6][i], 255));
    }
  }
/*
  public boolean isCheckmate(int player, King white, King black){
    if(player == 1){
      return white.getValidMoves().size() == 0;
    }else if(player == 2){
      return black.getValidMoves().size() == 0;
    }
    return false;
  }
  */
}
