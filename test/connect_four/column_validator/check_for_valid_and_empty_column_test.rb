require 'test_helper'

describe "ConnectFour::ColumnValidator#check_for_valid_and_empty_column" do

  after { reset_stdin }

  let(:players) do
    players = []
    2.times do |i|
      players << ConnectFour::Player.new(id: i, name: "Player")
    end
    players
  end
  let(:board) { ConnectFour::Board.new(players: players) }
  let(:valid_columns) { "1".."8" }
  let(:small_invalid_columns) { ["-2", "-1", "0"] }
  let(:big_invalid_columns) { ["9", "10", "11", "a", "b", "c"] }
  let(:invalid_columns) { small_invalid_columns + big_invalid_columns }

  describe "when column valid" do
    it "returns valid column" do
      valid_columns.each do |column|
        valid_column = board.instance_exec(column, players[0]) do |column, player|
                         check_for_valid_and_empty_column(column: column,
                                                          player: player)
                       end
        assert_equal column, valid_column
      end
    end
  end

  describe "when column invalid" do
    it "prompts for valid column until column valid" do
      invalid_columns.each do |column|
        mock_user_input("aa\n#{column}\nbb\n1\n")
        valid_column = board.instance_exec(column, players[0]) do |column, player|
                         check_for_valid_and_empty_column(column: column,
                                                          player: player)
                       end
        assert_equal "1", valid_column
      end
    end
  end
end
