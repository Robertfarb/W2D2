require_relative "piece"
require_relative "display"
require "byebug"
class Board
  attr_reader :grid
  def initialize 
    @grid = Array.new (8) { Array.new(8, NullPiece.new)}
  end
  
  def populate_board
    [0,1,-1,-2].each do |row|
      @grid[row].map! { |pos| pos = Piece.new }
    end
    
  end
  
  def display_board
    @grid.each do |row|
      p row
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise "Start position empty" if self[start_pos].is_a?(NullPiece)
    raise "End position occupied" unless self[end_pos].is_a?(NullPiece)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end
  
  def valid_pos?(pos)
    pos.all? {|num| num.between?(0, 8)}  
  end
  
  private
  
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
  brd.move_piece([0,0],[3,0])
  brd.display_board
  display = Display.new(brd)
  display.render
end