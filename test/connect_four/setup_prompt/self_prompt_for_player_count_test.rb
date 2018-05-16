require 'test_helper'

describe ConnectFour::SetupPrompt do

  after { reset_stdin }

  subject { -> { ConnectFour::SetupPrompt.prompt_for_player_count } }

  describe "::prompt_for_player_count" do
    it "returns valid player count if player count between 2-5" do
      (2..5).each do |i|
        mock_user_input(i)
        valid_game_mode = subject.call
        assert_equal i, valid_game_mode
      end
    end

    it "rejects invalid player_count and asks for new player count until valid" do
      mock_user_input("1\n6\n-10\n12\na\nz\n5\nc\n")
      game_mode = subject.call
      assert_equal 5, game_mode
    end
  end
end
