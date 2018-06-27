require_relative "piece"
require_relative "display"
require "byebug"

class Board
  attr_reader :grid, :null_piece
  
  
  def initialize 
    @null_piece = NullPiece.instance
    @grid = Array.new (8) { Array.new(8, @null_piece)}
  end
  
  def populate_board
    # [0,1,-1,-2].each do |row|
    #   @grid[row].map! { |pos| pos = Piece.new }
    # end
    game_board = Board.new
    self[[0, 3]] = King.new(:blue, self, [0, 3])
    self[[0, 1]] = Knight.new(:blue, self, [0, 1])
    self[[0, 2]] = Bishop.new(:blue, self, [0, 2])
    self[[0, 0]] = Rook.new(:blue, self, [0, 0])
    self[[0, 4]] = Queen.new(:blue, self, [0, 4])
    # debugger
    
  end
  
  def display_board
    @grid.each do |row|
      p row
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise "Start position empty" if self[start_pos].is_a?(NullPiece)
    raise "End position occupied" unless self[end_pos].is_a?(NullPiece)
    if self[start_pos].valid_moves?(end_pos)
      self[end_pos] = self[start_pos] 
      self[start_pos] = @null_piece
    else
      nil
    end
  end
  
  def valid_pos?(pos)
    pos.all? {|num| num.between?(0, 7)}  
  end
  
  
  def [] (pos)
    x,y = pos
    @grid[x][y]
  end
  
  def []= (pos, val)
    x,y = pos
    @grid[x][y] = val
  end
  
end

if $PROGRAM_NAME == __FILE__
  brd = Board.new
  brd.populate_board
  # brd.move_piece([0,0],[3,0])
  brd.display_board
  display = Display.new(brd)
  display.render
end