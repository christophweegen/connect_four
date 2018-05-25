require 'test_helper'

describe ConnectFour::SetupPrompt do
  after { reset_stdin }

  describe ".generate_players_from_player_names" do
    subject { ->(player_names) { ConnectFour::SetupPrompt.generate_players_from_player_names(player_names) } }

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

  describe ".prompt_for_game_mode" do
    subject { -> { ConnectFour::SetupPrompt.prompt_for_game_mode } }

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

  describe ".prompt_for_player_count" do
    subject { -> { ConnectFour::SetupPrompt.prompt_for_player_count } }

    it "returns valid player count if player count between 2-5" do
      (2..5).each do |i|
        mock_user_input(i)
        valid_game_mode = subject.call
        assert_equal i, valid_game_mode
      end
    end

    it "rejects invalid player_count and asks for new player count until valid" do
      mock_user_input(1, 6, -10, 12, "a", "z", 5, "c")
      game_mode = subject.call
      assert_equal 5, game_mode
    end
  end

  describe ".prompt_for_valid_game_mode" do
    subject { ->(game_mode) { ConnectFour::SetupPrompt.prompt_for_valid_game_mode(game_mode) } }

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

  describe ".generate_players_from_player_names" do
    subject { ->(player_names) { ConnectFour::SetupPrompt.generate_players_from_player_names(player_names) } }

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

  describe ".prompt_for_player_names" do
    subject { ->(player_count) { ConnectFour::SetupPrompt.prompt_for_player_names(player_count) } }

    it "returns player_names as an Array stripped off whitespace" do
      mock_user_input("   Tom  ", " Jerry    ")
      player_names = subject.call(2)
      assert_equal ["Tom", "Jerry"], player_names
    end
  end

  describe ".prompt_for_board_width" do
    subject { ->(board_width) { ConnectFour::SetupPrompt.prompt_for_board_width(board_width) } }
    let(:min) { ConnectFour::Constants::MIN_BOARD_WIDTH }
    let(:max) { ConnectFour::Constants::MAX_BOARD_WIDTH }
    let(:player_count) { 2 }

    it "returns valid board width if board width between 8-61" do
      (min..max).each do |i|
        mock_user_input(i)
        valid_width = subject.call(player_count)
        assert_equal i, valid_width
      end
    end

    it "rejects invalid board width and asks for new board width until valid" do
      mock_user_input(1, 7, -10, 62, "a", "z", 30, "c")
      valid_width = subject.call(player_count)
      assert_equal 30, valid_width
    end
  end

  describe ".prompt_for_board_height" do
    subject { ->(board_height) { ConnectFour::SetupPrompt.prompt_for_board_height(board_height) } }
    let(:min) { ConnectFour::Constants::MIN_BOARD_HEIGHT }
    let(:max) { ConnectFour::Constants::MAX_BOARD_HEIGHT }
    let(:player_count) { 2 }

    it "returns valid board height if board height between 8-100" do
      (min..max).each do |i|
        mock_user_input(i)
        valid_height = subject.call(player_count)
        assert_equal i, valid_height
      end
    end

    it "rejects invalid board height and asks for new board height until valid" do
      mock_user_input(1, 7, -10, 101, "a", "z", 50, "c")
      valid_height = subject.call(player_count)
      assert_equal 50, valid_height
    end
  end
end
