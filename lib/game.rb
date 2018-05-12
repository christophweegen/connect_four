require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/prompt'

board_setup = ConnectFour::BoardSetup.new
board       = ConnectFour::Board.new(board_setup)
board.play
