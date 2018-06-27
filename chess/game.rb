require_relative "board"
require_relative "cursor"
require_relative "display"
require_relative "piece"
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
      system("clear")
      cursor = display.cursor
      display.render
      cursor.get_input
      p ""
      if cursor.selected
        # debugger
        board.move_piece(cursor.cursor_pos, user_input)
      end
      
    end
  end
  
  def user_input
    puts "Please enter a move:"
    pos = gets.chomp
    pos.split(",").map!(&:to_i)
  end
  
end

if $PROGRAM_NAME == __FILE__
  # brd.move_piece([0,0],[3,0])
  # brd.display_board
  # display = Display.new(brd)
  # display.render
  Game.new.play
end