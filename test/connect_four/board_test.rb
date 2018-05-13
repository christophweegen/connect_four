require 'test_helper'

class BoardTest < ConnectFourSpec
  def setup
    @players = []
    2.times do |i|
      @players << ConnectFour::Player.new(id: i, name: "Player")
    end
  end

  def test_board_initialize_default_dimensions
    b = ConnectFour::Board.new(players: @players)
    assert_equal b.width,  8
    assert_equal b.height, 8
    assert_equal b.column_headers, ('1'..'8').to_a
    assert_equal b.rows.size, 8
  end

  def test_board_with_dimensions_too_low
    b = ConnectFour::Board.new(width: 5, height: 5, players: @players)
    assert_equal b.width,  8
    assert_equal b.height, 8
    assert_equal b.column_headers, ('1'..'8').to_a
    assert_equal b.rows.size, 8
  end

  def test_board_with_dimensions_too_high
    b = ConnectFour::Board.new(width: 100, height: 100, players: @players)
    assert_equal b.width,          ConnectFour::Constants::MAX_BOARD_WIDTH
    assert_equal b.height,         ConnectFour::Constants::MAX_BOARD_HEIGHT
    assert_equal b.column_headers, ConnectFour::Constants::COLUMN_HEADERS
    assert_equal b.rows.size,      ConnectFour::Constants::MAX_BOARD_HEIGHT
  end
end
