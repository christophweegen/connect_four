require 'test_helper'

describe ConnectFour::SetupPrompt do

  after { reset_stdin }

  subject { ->(player_names) { ConnectFour::SetupPrompt.generate_players_from_player_names(player_names) } }

  describe "::generate_players_from_player_names" do
    it "has 'Player' as default name" do
      player_names = ["", "", ""]
      players = subject.call(player_names)
      players.each do |player|
        assert_equal "Player", player.name
      end
    end

    it "sets the name and id of players correctly" do
      player_names = ["Angus", "Malcolm", "Brian"]
      players = subject.call(player_names)
      assert_equal "Angus",   players[0].name
      assert_equal "Malcolm", players[1].name
      assert_equal "Brian",   players[2].name

      assert_equal 1, players[0].id
      assert_equal 2, players[1].id
      assert_equal 3, players[2].id
    end

    it "returns an Array of Player objects" do
      player_names = ["Angus", "Malcolm", "Brian"]
      players = subject.call(player_names)
      assert_equal 3, players.size
      assert_instance_of Array, players
      players.each do |player|
        assert_instance_of ConnectFour::Player, player
      end
    end
  end
end
