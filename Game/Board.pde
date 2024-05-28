class Board{
  Square[][] board = new Square[8][8];

  public Board(){
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        board[i][j] = new Square(i, j);
      }
    }
  }

  public Square getSquare(int x, int y){
    if((x >= 0) && (x < 8) && (y >= 0) && (y < 8)){
      return board[x][y];
    }else{
      return null;
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
