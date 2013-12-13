## live cells:
# 0 or 1 live neighbors: dies
# 2 or 3 live neighbors: lives
# 4 - 8 live neighbors: dies
## dead cells:
# 3 live neighbors: comes back to life
require './lib/board'
require './lib/game'
require './lib/cell'
require 'bundler'
Bundler.require

class App < Sinatra::Application
  @@my_game = Game.new(30, 30)
  @@my_game.se_glider(1,0).ne_glider(27, 2)
  @@time = 0

  get '/' do
    if @@time > 0
      @@my_game.generation
    end
    @board = @@my_game.screen.board
    @@time += 1
    erb :index
  end

  # @my_game.screen.print_screen
  # loop do
  #   sleep(0.2)
  #   @my_game.generation
  # end

end