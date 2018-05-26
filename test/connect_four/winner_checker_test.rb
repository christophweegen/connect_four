require 'test_helper'

describe ConnectFour::WinnerChecker, "test #check_horizontal" do
  let(:generator) do
    ConnectFour::TestHelpers::BoardGenerator.new(number_of_boards_to_generate: 100)
  end
  let(:horizontal_winner_boards)    { generator.horizontal_winner_boards }
  let(:vertical_winner_boards)      { generator.vertical_winner_boards }
  let(:diagonal_asc_winner_boards)  { generator.diagonal_asc_winner_boards }
  let(:diagonal_desc_winner_boards) { generator.diagonal_desc_winner_boards }
  let(:no_winner_boards)            { generator.no_winner_boards }

  describe "#check_horizontal" do

    it "can check horizontal winner boards" do
      horizontal_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        horizontal_winner = winner_checker.check_horizontal
        expect(horizontal_winner).must_be_instance_of ConnectFour::Player
        expect(horizontal_winner.id).must_equal 1
      end
    end

    it "doesn't check vertical winner boards" do
      vertical_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_horizontal
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal ascending winner boards" do
      diagonal_asc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_horizontal
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal descending boards" do
      diagonal_desc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_horizontal
        expect(no_winner).must_be_instance_of NilClass
      end
    end
  end

  describe "#check_vertical" do

    it "can check vertical winner boards" do
      vertical_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        vertical_winner = winner_checker.check_vertical
        expect(vertical_winner).must_be_instance_of ConnectFour::Player
        expect(vertical_winner.id).must_equal 1
      end
    end

    it "doesn't check horizontal winner boards" do
      horizontal_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_vertical
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal ascending winner boards" do
      diagonal_asc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_vertical
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal descending boards" do
      diagonal_desc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_vertical
        expect(no_winner).must_be_instance_of NilClass
      end
    end
  end

  describe "#check_diagonal_asc" do

    it "can check diagonal asc winner boards" do
      diagonal_asc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        vertical_winner = winner_checker.check_diagonal_asc
        expect(vertical_winner).must_be_instance_of ConnectFour::Player
        expect(vertical_winner.id).must_equal 1
      end
    end

    it "doesn't check horizontal winner boards" do
      horizontal_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_asc
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check vertical winner boards" do
      vertical_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_asc
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal descending boards" do
      diagonal_desc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_asc
        expect(no_winner).must_be_instance_of NilClass
      end
    end
  end

  describe "#check_diagonal_desc" do

    it "can check diagonal desc winner boards" do
      diagonal_desc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        vertical_winner = winner_checker.check_diagonal_desc
        expect(vertical_winner).must_be_instance_of ConnectFour::Player
        expect(vertical_winner.id).must_equal 1
      end
    end

    it "doesn't check horizontal winner boards" do
      horizontal_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_desc
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check vertical winner boards" do
      vertical_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_desc
        expect(no_winner).must_be_instance_of NilClass
      end
    end

    it "doesn't check diagonal ascending boards" do
      diagonal_asc_winner_boards.each do |board|
        winner_checker = ConnectFour::WinnerChecker.new(board: board)
        no_winner = winner_checker.check_diagonal_desc
        expect(no_winner).must_be_instance_of NilClass
      end
    end
  end
end
