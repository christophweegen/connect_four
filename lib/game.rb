require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/prompt'

puts "Welcome to Multiplayer Connect Four!"

game_mode = ConnectFour::Prompt.prompt_for_game_mode

case game_mode
when 1
  # initialize 2 Players & Classic Board
  player_count = 2
  players = ConnectFour::Prompt.prompt_for_player_names(player_count)
  board   = ConnectFour::Board.new(players: players)
when 2
  # initialize Multiplayer Setup
  player_count = ConnectFour::Prompt.prompt_for_player_count
  players      = ConnectFour::Prompt.prompt_for_player_names(player_count)
  width        = ConnectFour::Prompt.prompt_for_board_width(player_count)
  height       = ConnectFour::Prompt.prompt_for_board_height(player_count)
  board        = ConnectFour::Board.new(width:   width,
                                        height:  height,
                                        players: players)
end

board.play
