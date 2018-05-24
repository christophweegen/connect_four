require 'test_helper'

describe ConnectFour::BoardSetup do
  describe '#initialize' do
    after { reset_stdin }

    let(:classic_mode)      { 1 }
    let(:multiplayer_mode)  { 2 }

    let(:number_of_players) { 3 }

    let(:player1)           { "Tom" }
    let(:player2)           { "Jerry" }
    let(:player3)           { "Mickey" }

    let(:width)             { 40 }
    let(:height)            { 50 }

    let(:board_setup) { ConnectFour::BoardSetup.new }

    describe "in Classic Mode" do

      it "returns a valid setup hash" do
        mock_user_input(classic_mode, player1, player2)
        assert_instance_of ConnectFour::BoardSetup, board_setup
        assert_kind_of Hash, board_setup
        assert board_setup.has_key?(:players)
        assert_equal 1,                   board_setup.size
        assert_equal Array,               board_setup[:players].class
        assert_equal 1,                   board_setup[:players][0].id
        assert_equal 2,                   board_setup[:players][1].id
        assert_equal "Tom",               board_setup[:players][0].name
        assert_equal "Jerry",             board_setup[:players][1].name
        assert_equal ConnectFour::Player, board_setup[:players][0].class
        assert_equal ConnectFour::Player, board_setup[:players][1].class
      end
    end

    describe "in Multiplayer Mode" do

      it "returns a valid setup hash" do
        mock_user_input(multiplayer_mode,
                        number_of_players,
                        player1, player2, player3,
                        width, height)
        assert_instance_of ConnectFour::BoardSetup, board_setup
        assert_kind_of Hash, board_setup
        assert board_setup.has_key?(:players)
        assert board_setup.has_key?(:width)
        assert board_setup.has_key?(:height)
        assert_equal 3,                   board_setup.size
        assert_equal Array,               board_setup[:players].class
        assert_equal Integer,             board_setup[:width].class
        assert_equal Integer,             board_setup[:width].class
        assert_equal 1,                   board_setup[:players][0].id
        assert_equal 2,                   board_setup[:players][1].id
        assert_equal 3,                   board_setup[:players][2].id
        assert_equal "Tom",               board_setup[:players][0].name
        assert_equal "Jerry",             board_setup[:players][1].name
        assert_equal "Mickey",            board_setup[:players][2].name
        assert_equal ConnectFour::Player, board_setup[:players][0].class
        assert_equal ConnectFour::Player, board_setup[:players][1].class
        assert_equal ConnectFour::Player, board_setup[:players][2].class
      end
    end
  end
end
