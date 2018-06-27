require 'singleton'
require_relative 'chess_module'
require_relative 'board'
require 'byebug'

class Piece
  attr_reader :color, :board, :pos
  def initialize(color,board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def moves
    
  end
  
  def letter
    "♖"
  end
  
  def inspect
    "♖"  
  end
  
end

class NullPiece < Piece
  include Singleton
  
  def initialize
  end
  
  def inspect
    "_"
  end
  
  def letter
    "_"
  end
  
  def moves_diffs
    
  end
  
end

class Bishop < Piece
  include SlidingPiece
  
  def moves_diffs
    diagonal_dirs(@pos, @board)
  end
  
  def letter
    "♗"
  end
  
end

class Rook < Piece
  include SlidingPiece
  
  def moves_diffs
    horizontal_dirs(@position, @board)
  end
  
  def letter
    "♖"
  end
end

class Queen < Piece
  include SlidingPiece
  
  def moves_diffs
    diagonal_dirs(@pos, @board) + horizontal_dirs(@pos, @board)
  end
  
  def letter
    "♕"
  end
end

class Knight < Piece
  include SteppingPiece
  attr_reader :knight_moves
  
  
  def moves_diffs
    @knight_moves = [
      [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1]
    ]
    moves(@pos, @board, @knight_moves)
  end
  
  def valid_moves?(position)
    moves_diffs.include?(position)
  end
  
  def letter
    "♘"
  end
  
end

class King < Piece
  include SteppingPiece
  attr_reader :pos
  
  
  def moves_diffs
    @kings_moves = HORIZONTAL_DIRS + DIAGONAL_DIRS
    moves(@pos, @board, @kings_moves)
  end
  
  def valid_moves?(position)
    moves_diffs.include?(position)
  end
  
  def letter
    "♔"  
  end
  
end

class Pawn < Piece
  include SteppingPiece
  
  def moves
    
  end
end

if $PROGRAM_NAME == __FILE__
  # bis = Bishop.new(:b,Board.new,[0,0])
  # king = King.new(:blue, Board.new, [2, 3])
  # p king.moves_diffs
end