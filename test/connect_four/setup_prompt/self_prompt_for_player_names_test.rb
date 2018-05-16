require 'test_helper'

describe ConnectFour::SetupPrompt do

  after { reset_stdin }

  subject { ->(player_count) { ConnectFour::SetupPrompt.prompt_for_player_names(player_count) } }

  describe "::prompt_for_player_count" do
    it "returns player_names as an Array stripped off whitespace" do
      mock_user_input("   Tom  \n Jerry    \n")
      player_names = subject.call(2)
      assert_equal ["Tom", "Jerry"], player_names
    end
  end
end
