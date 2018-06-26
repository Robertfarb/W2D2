require_relative "board"
require_relative "cursor"
require_relative "display"
require  'byebug'

class Game
  attr_reader :board, :display, :cursor
  
  def initialize
    @board = Board.new
    @board.populate_board
    @display = Display.new(board)
    # @cursor = Cursor.new([0, 0], board)
  end
  
  def play
    loop do
      display.render
      display.cursor.get_input
      system("clear")
    end
  end
  
end

if $PROGRAM_NAME == __FILE__
  # brd.move_piece([0,0],[3,0])
  # brd.display_board
  # display = Display.new(brd)
  # display.render
  Game.new.play
end