require 'test_helper'

describe ConnectFour::SetupPrompt do

  after { reset_stdin }

  subject { ->(game_mode) { ConnectFour::SetupPrompt.prompt_for_valid_game_mode(game_mode) } }

  describe "::prompt_for_valid_game_mode" do
    it "returns valid game mode" do
      mock_user_input(1)
      valid_game_mode = subject.call(1)
      assert_equal 1, valid_game_mode
    end

    it "rejects invalid game mode and asks for new input until valid" do
      mock_user_input("5\n-10\na\n2\nb\nc\n")
      game_mode = subject.call("z")
      assert_equal 2, game_mode
    end
  end
end
