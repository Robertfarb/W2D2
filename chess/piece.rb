class Piece
  
  def initialize

  end
  
  def letter
    "♖"
  end
  
  def inspect
    "♖"  
  end
  
end

class NullPiece < Piece
  
  def inspect
    "_"
  end
  
  def letter
    "_"
  end
  
end