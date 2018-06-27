require 'singleton'
require_relative 'chess_module'
require_relative 'board'
require 'byebug'


module SlidingPiece
  
  def horizontal_dirs(pos,board)
    possible_moves = [] 
    
    HORIZONTAL_DIRS.each do |end_pos|
      i=1
      position = [@pos[0] + (i * end_pos[0]), @pos[1] + (i * end_pos[1])]
      # debugger
      while board.valid_pos?(position) && board[position].is_a?(NullPiece)
        position = [@pos[0] + (i * end_pos[0]), @pos[1] + (i * end_pos[1])]
        possible_moves << position
        i += 1
      end
    end
    
    possible_moves.select! do |moves| 
      board.valid_pos?(moves)
    end
    
    return possible_moves
  end
  
  def diagonal_dirs(pos, board)
    possible_moves = [] 
    
    DIAGONAL_DIRS.each do |end_pos|
      i=1
      position = [@pos[0] + (i * end_pos[0]), @pos[1] + (i * end_pos[1])]
      
      while board.valid_pos?(position) && board[position].is_a?(NullPiece)
        position = [@pos[0] + (i * end_pos[0]), @pos[1] + (i * end_pos[1])]
        possible_moves << position
        i += 1
      end
    end
    
    possible_moves.select! do |moves| 
      board.valid_pos?(moves)
    end
    
    return possible_moves
  end
  
  
  private
  HORIZONTAL_DIRS = [[0,1], [1, 0], [0, -1], [-1, 0]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]
  
  def move_dirs
  end
  
  def grow_unlocked_moves_in_dir(dx, dy)
  end
end

module SteppingPiece
  
  HORIZONTAL_DIRS = [[0,1], [1, 0], [0, -1], [-1, 0]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]
  
  def moves(pos, board, piece_moves)
    possible_moves = [] 
    
    piece_moves.each do |end_pos|
      possible_moves << [@pos[0] + end_pos[0], @pos[1] + end_pos[1]]
    end
    
    possible_moves.select! do |moves| 
      board.valid_pos?(moves)
    end
    
    return possible_moves
  end
  
  private
  def moves_diffs
    raise "moves_diffs method missing"
  end
end