require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'

require 'pry'

require 'connect_four'
require 'connect_four/player'
require 'connect_four/board'
require 'connect_four/board_setup'
require 'connect_four/constants'
require 'connect_four/setup_prompt'

# require 'connect_four/test_helpers/board_generator'
require 'connect_four/test_helpers/user_input'

require "minitest/reporters"
Minitest::Reporters.use!

class ConnectFourSpec < Minitest::Test
end

Minitest::Test.include ConnectFour::TestHelpers::UserInput
