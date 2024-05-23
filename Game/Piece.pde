import java.util.*;

public abstract class Piece{
  color c;
  Square position;
  abstract ArrayList getValidMoves(board Board);
}
