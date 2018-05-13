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
    expect(b.width).must_equal 8
    expect(b.height).must_equal 8
    expect(b.column_headers).must_equal(('1'..'8').to_a)
    expect(b.rows.size).must_equal 8
  end

  it "has minimum dimension if given dimensions too low" do
    b = ConnectFour::Board.new(width: 5, height: 5, players: @players)
    expect(b.width).must_equal 8
    expect(b.height).must_equal 8
    expect(b.column_headers).must_equal(('1'..'8').to_a)
    expect(b.rows.size).must_equal 8
  end

  it "has maximum dimensions if given dimensions are to high" do
    b = ConnectFour::Board.new(width: 100, height: 100, players: @players)
    expect(b.width).must_equal          ConnectFour::Constants::MAX_BOARD_WIDTH
    expect(b.height).must_equal         ConnectFour::Constants::MAX_BOARD_HEIGHT
    expect(b.column_headers).must_equal ConnectFour::Constants::COLUMN_HEADERS
    expect(b.rows.size).must_equal      ConnectFour::Constants::MAX_BOARD_HEIGHT
  end
end
