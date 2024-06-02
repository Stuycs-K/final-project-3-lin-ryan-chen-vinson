class Knight extends Piece{
  public Knight(Square position, color c){
    super(position, c);
  }
  
  public ArrayList<Square> getValidMoves(Square[][] board){
    ArrayList<Square>list = new ArrayList<Square>();
    int x = this.position.getX();
    int y = this.position.getY();
    int[][] directions = {{x - 2, y +1}, {x - 2, y -1}, {x + 2, y +1}, {x + 2, y -1},
    {x + 1, y +2}, {x + 1, y -2}, {x - 1, y +2}, {x-1, y -2}};
    for(int i = 0; i < directions.length; i++){
      int dX = directions[i][0];
      int dY = directions[i][1];
      if(dX >= 0 && dY >= 0 && dX < 8 && dY < 8){
        Square dSquare = board[dX][dY];
        if(!dSquare.isFull() || dSquare.getPiece().getColor() != this.c){
          list.add(dSquare);
        }
      }
    }
    return list;
  }
}
