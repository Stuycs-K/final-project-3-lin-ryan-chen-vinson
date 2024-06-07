# Work Log

## GROUP MEMBER 1

### 5/23/24

- Set up Piece abstract class and classes for all the specific pieces (king, queen, rook, etc.)
- Worked on Piece class, king class, and knight class, and attempted to fix errors that occurred (not fixed yet)

### 5/24/24 + weekend

- Created another file to test board design/pattern
- Created boundary method for piece movement that applies to all pieces

### 5/28/24
- Worked on Piece class (testing approaches) and Pawn class
- Found and uploaded PNGs of chess pieces that would fit with the board

### 5/29/24
- Worked on and finished Pawn, Queen, and Rook classes
- Fixed errors in a few of the classes (var names and logic issues)

### 5/30/24
- Worked on Game class (loadImage() and drawPieces() methods)
- Attempted to do movement for pieces (added remove and setPosition)

### 5/31/24 + weekend
- Created win screen (not implemented yet)
- Created reset method to reset state of the board
- Attempted to create demo keys for each piece to show off movement
- Worked on checkmate methods (not implemented yet)
- Created turn system
- added first move of pawn (special case) and fixed/confirmed movement for queen, bishop, and king

### 6/3/24
- Fully completed and implemented pawn promotion

### 6/4/24
- added highlighting feature (red for possible squares, green for selected square)

### 6/5/24 + 6/6/24
- added highlighting original position and new position
- began working on castling

## GROUP MEMBER 2

### 5/23/24

- Set up the Board, Game, Square, and Move class for all the basic game logic component of the program.
- Finished the constructors, accessors, and mutators for Board, Game, Square, and Move
- Finished simple "is" methods for a few of the classes where applicable

### 5/24/24 + weekend
- started is checkmate, need king class to be finished
- added more necessary accessors
- finished makeMove

### 5/28/24
- fixed constructor for King to match the new Piece abstract requirements
- added more necessary accessors to Piece class
- wrote and completed isValidMove and getValidMoves for King

### 5/29/24
- finished the bishop class
- finished the knight class
- fixed minor errors in several classes

### 5/30/24
- finsihed initializeboard with white and black pieces
- finished makeMoves method in game
- temporarily removed Move class (see if we need later because it's kind of useless)

### 5/31/24 + weekend
- finished makMove for game to swap the pieces in board array
- finished mousepressed so it's able to move pieces on screen to valid squares when clicking
- fixed the board initialization issue that was breaking all the white pieces
- fixed rook getValidMoves so all rooks can move correctly
- finally figured out how to fix pawn getValidMoves so all pawns can move correctly

### 6/3/24 + 6/4/24
- discussed how to fix check and checkmate system
- fixed findKing to find king for both colors
- fixed isInCheck to determine if king of color is in check
- wrote causesCheck to determine if a piece causes a check to see the validmoves for that piece

### 6/5/24 + 6/6/24
- fixed mousepressed to accomodate for new checkmate knowledge
- finished and tested checkmate
- started en passant