require_relative "board"
require "colorize"
require_relative "cursor"

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    x,y = @cursor.cursor_pos
    @board.grid.each do |row|
      row.each do |piece|
        if [row, piece] == [x, y]
          print piece.letter.colorize(:blue)
        else
          print piece.letter
        end
      end
      print "\n"
    end
  end
end