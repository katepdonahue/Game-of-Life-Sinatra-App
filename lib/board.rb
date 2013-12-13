class Board
  attr_reader :board

  def initialize(game_object)
    @board = []
    generate_screen(game_object)
  end

  def generate_screen(game_obj)
    game_obj.height.times do
      board << []
    end
  end

end