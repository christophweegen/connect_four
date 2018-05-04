require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'

require 'connect_four'
require 'connect_four/player'
require 'connect_four/board'

require "minitest/reporters"
Minitest::Reporters.use!

class ConnectFourSpec < Minitest::Test
end
