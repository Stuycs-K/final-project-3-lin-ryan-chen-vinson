public class Board{
  Square[][] board = new Square[8][8];
  
  public Board(){
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        board[i][j] = new Square[i][j];
      }
    }
  }
}
