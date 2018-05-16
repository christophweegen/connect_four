require 'test_helper'

describe ConnectFour::Board do
  before do
    @players = []
    2.times do |i|
      @players << ConnectFour::Player.new(id: i, name: "Player")
    end
  end

  it "has default dimensions if no dimensions given" do
    b = ConnectFour::Board.new(players: @players)
    assert_equal 8, b.width
    assert_equal 8, b.height
    assert_equal ('1'..'8').to_a, b.column_headers
    assert_equal 8, b.rows.size
  end

  it "has minimum dimension if given dimensions too low" do
    b = ConnectFour::Board.new(width: 5, height: 5, players: @players)
    assert_equal 8, b.width
    assert_equal 8, b.height
    assert_equal ('1'..'8').to_a, b.column_headers
    assert_equal 8, b.rows.size
  end

  it "has maximum dimensions if given dimensions are to high" do
    b = ConnectFour::Board.new(width: 100, height: 100, players: @players)
    assert_equal ConnectFour::Constants::MAX_BOARD_WIDTH,  b.width
    assert_equal ConnectFour::Constants::MAX_BOARD_HEIGHT, b.height
    assert_equal ConnectFour::Constants::COLUMN_HEADERS,   b.column_headers
    assert_equal ConnectFour::Constants::MAX_BOARD_HEIGHT, b.rows.size
  end
end
