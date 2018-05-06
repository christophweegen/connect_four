require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/prompt'

board = ConnectFour::Board.setup_board
board.play
