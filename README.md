[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
## Group Info
Ryan Lin & Vinson Chen

Cooked Not Cooking
## Overview
Our project is a recreation of classical chess using Processing. The game will be played between two human players. Players will not be able to play against an AI bot. The board has the size of a normal chess board (8x8 squares), and the game will start with all normal pieces in their expected positions. The normal movements of these pieces will follow the expected rules. For instance, the Knight will be the only piece that can jump over other pieces to get to a new position, and moves in an L shape. Special movements/features are also included, which only occur when their respective requirements are fulfilled, such as pawn promotion, castling, and en passant.

A turn system is also implemented, with White receiving the first turn in every match. Players will be able to select and move pieces to a new square by clicking on the respective squares. They can view the allowed movements through highlighted squares that appear when a piece is clicked. A message bar on the bottom of the screen can be used to view the player who has the current turn, as well as when a player is in check. Lastly, a win screen will appear when one of the players is checkmated.
## Instructions
Run 'Game'

Click 'r' (lowercase) to reset board to pieces with normal positions or to restart game once there is a winner.

Click on a piece and the new position (any highlighted square) to move it. 

Click on the selected piece or any tile that the piece can't move to to cancel current selection. 

For the following positions, you may need to move extra pieces to alternate turns to view features:

- Click on 'e' (lowercase) to turn the board into en passant position. Move any white piece except D5 Pawn to switch to black's turn. Move the black pawn at E7 to E5. Move the pawn at D5 to E6 (behind the black pawn you just moved) to do an en passant.

- Click on 'p' (lowercase) to turn the board into pawn promotion position. Move the white pawn on the black side to capture the black rook. Click on the piece you want to promote your pawn to. The same can be done for the black pawn on the white side.

- Click on 'c' (lowercase) to turn the board into castling position. To perform queenside castling, which is set up on white side, the Knight must be moved out of the way first. Move a random black piece. Then, click on the white king and the square two to the left of the king. To perform kingside castling, which is set up on the black side, follow the same procedure, except it will be to the right of the black king.

- Click on '1' to turn the board into a check position. To perform the check, move the white queen to H5. If you click on any black piece except for the black king or the black pawn at G7, you will realize that none of the pieces have valid moves because they don't cause black to be out of check. The only valid moves will be to move the black King to E7 to avoid the check or to move to the black pawn to G6 to block the check.

- Click on '2' to turn the board into a checkmate position. In order to perform the checkmate, move the white queen to H5. Because there is a pawn in front of the king, the king cannot move anywhere to get ouf of check. There is also no longer a pawn on G7 so nothing can block the queen from taking the king.

## Presentation Link

## Major Bugs