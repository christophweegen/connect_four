require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'

require 'connect_four'
require 'connect_four/player'
require 'connect_four/board'
require 'connect_four/test_helpers/board_generator'

require "minitest/reporters"
Minitest::Reporters.use!

class ConnectFourSpec < Minitest::Test
end
