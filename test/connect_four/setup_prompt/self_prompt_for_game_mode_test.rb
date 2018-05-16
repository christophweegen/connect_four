require 'test_helper'

describe ConnectFour::SetupPrompt do

  after { reset_stdin }

  subject { -> { ConnectFour::SetupPrompt.prompt_for_game_mode } }

  describe "::prompt_for_game_mode" do
    it "gets valid user input" do
      mock_user_input(2)
      game_mode = subject.call
      assert_equal 2, game_mode
    end

    it "gets arbitrary user input" do
      mock_user_input(10)
      game_mode = subject.call
      assert_equal 10, game_mode
    end
  end
end
