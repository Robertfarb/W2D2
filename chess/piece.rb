class Piece
  
  def initialize

  end
  
  def letter
    "P"
  end
  
  def inspect
    "P"  
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