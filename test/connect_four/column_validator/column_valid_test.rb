require 'test_helper'

describe "ConnectFour::ColumnValidator#valid_column?" do
  let(:players) do
    players = []
    2.times do |i|
      players << ConnectFour::Player.new(id: i, name: "Player")
    end
    players
  end

  describe "with default/min board dimensions" do
    let(:board) { ConnectFour::Board.new(players: players) }
    let(:valid_columns) { "1".."8" }
    let(:small_invalid_columns) { ["-2", "-1", "0"] }
    let(:big_invalid_columns) { ["9", "10", "11", "a", "b", "c"] }

    it "has valid columns 1-8" do
      valid_columns.each do |column|
        assert_equal true, (board.instance_eval { column_valid?(column) })
      end
    end

    it "has invalid columns < 1" do
      small_invalid_columns.each do |column|
        assert_equal false, (board.instance_eval { column_valid?(column) })
      end
    end

    it "has invalid columns > 8" do
      big_invalid_columns.each do |column|
        assert_equal false, (board.instance_eval { column_valid?(column) })
      end
    end
  end

  describe "with max board dimensions" do
    let(:width)  { ConnectFour::Constants::MAX_BOARD_WIDTH }
    let(:height) { ConnectFour::Constants::MAX_BOARD_HEIGHT }
    let(:board) do
      ConnectFour::Board.new(width: width, height: height, players: players)
    end
    let(:valid_columns) { ("1".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a }
    let(:small_invalid_columns) { ["-2", "-1", "0"] }
    let(:big_invalid_columns) { ["10", "11", "12", "aa", "bb", "zz"] }

    it "has valid columns 1-9/a-b/A-Z" do
      valid_columns.each do |column|
        assert_equal true, (board.instance_eval { column_valid?(column) })
      end
    end

    it "has invalid columns < 1" do
      small_invalid_columns.each do |column|
        assert_equal false, (board.instance_eval { column_valid?(column) })
      end
    end

    it "has invalid columns > 8" do
      big_invalid_columns.each do |column|
        assert_equal false, (board.instance_eval { column_valid?(column) })
      end
    end
  end
end
