require_relative "board"
require_relative "game"
require_relative "piece"
require "colorize"
require_relative "cursor"
require "byebug"

class Display
  attr_reader :cursor
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    x,y = @cursor.cursor_pos
    print "  -----------------------------------------" + "\n"
    @board.grid.each_with_index do |row, rid|
      row.each_with_index do |piece, pid|
        if [rid, pid] == [x, y]
          print  "  | " +  piece.letter.colorize(:white)
        else
          print  "  | "  + piece.letter
        end
        
      end
      
      print "  | \n"
      print "  -----------------------------------------"
      print "\n"
    end
      print "  " + @board[[x, y]].moves_diffs.to_s
  end
end