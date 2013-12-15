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
    # @@my_game.se_glider(1,0).ne_glider(27, 2)
    @@time = 0
    @@count = 0
    @@hash = {}

  get '/' do
    @board = @@my_game.screen.board
    erb :index
  end

  post '/add' do
    @@count += 1
    @@hash[@@count] = params #shouldn't actually need this in the end
    @@my_game = @@my_game.send(params["method"], params["y"].to_i, params["x"].to_i)
    @board = @@my_game.screen.board
    erb :index
  end


  get '/play' do
    if @@time > 0
      @@my_game.generation
    end
    @board = @@my_game.screen.board
    @@time += 1
    erb :play
  end

end