require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/board_setup'

module ConnectFour
  def self.hello_world
    "hello world"
  end
end

board_setup = ConnectFour::BoardSetup.new
board       = ConnectFour::Board.new(board_setup)
board.play
