require 'test_helper'

describe ConnectFour::ColumnValidator do
  describe "#check_for_valid_and_empty_column" do

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
          mock_user_input("aa", column, "bb", 1)
          valid_column = board.instance_exec(column, players[0]) do |column, player|
                           check_for_valid_and_empty_column(column: column,
                                                            player: player)
                         end
          assert_equal "1", valid_column
        end
      end
    end
  end

  describe "#column_full" do
    let(:players) do
      players = []
      2.times do |i|
        players << ConnectFour::Player.new(id: i, name: "Player")
      end
      players
    end

    describe "with default/min board dimensions" do
      let(:board) { ConnectFour::Board.new(players: players) }
      let(:column) { "1" }
      let(:board_height) { board.height }

      it "has a full column" do
        board_height.times do
          board.instance_exec(column) do |column|
            claim_slot(player: players[0], column: column)
          end
        end
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal true, column_full
      end

      it "has a free column when almost full" do
        (board_height - 1).times do
          board.instance_exec(column) do |column|
            claim_slot(player: players[0], column: column)
          end
        end
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal false, column_full
      end

      it "has free column when column empty" do
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal false, column_full
      end
    end

    describe "with max board dimensions" do
      let(:width)  { ConnectFour::Constants::MAX_BOARD_WIDTH }
      let(:height) { ConnectFour::Constants::MAX_BOARD_HEIGHT }
      let(:board) do
        ConnectFour::Board.new(width: width,
                               height: height,
                               players: players)
      end
      let(:column) { "1" }
      let(:board_height) { board.height }

      it "has a full column" do
        board_height.times do
          board.instance_exec(column) do |column|
            claim_slot(player: players[0], column: column)
          end
        end
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal true, column_full
      end

      it "has a free column when almost full" do
        (board_height - 1).times do
          board.instance_exec(column) do |column|
            claim_slot(player: players[0], column: column)
          end
        end
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal false, column_full
      end

      it "has free column when column empty" do
        column_full = board.instance_exec(column) do |column|
                        column_full?(column)
                      end
        assert_equal false, column_full
      end
    end
  end

  describe "#valid_column" do
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
end
