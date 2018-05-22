require 'test_helper'

describe ConnectFour::ColumnValidator do
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

    it "has free column when almost full" do
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

  describe "with default/min board dimensions" do
    let(:width)  { 99 }
    let(:height) { 99 }
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

    it "has free column when almost full" do
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
