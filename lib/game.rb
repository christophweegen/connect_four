require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/prompt'

puts "Welcome to Multiplayer Connect Four!"

game_mode = ConnectFour::Prompt.prompt_for_game_mode

case game_mode
when 1
  # initialize Classic Board
  board = ConnectFour::Board.new
when 2
  # initialize Multiplayer Board
  player_count = ConnectFour::Prompt.prompt_for_player_count
  width        = ConnectFour::Prompt.prompt_for_board_width(player_count)
  height       = ConnectFour::Prompt.prompt_for_board_height(player_count)
  board        = ConnectFour::Board.new(width: width, height: height)
end
