require 'test_helper'

class BoardTest < ConnectFourSpec
  def test_board_initialize_default_dimensions
    b = ConnectFour::Board.new
    assert_equal b.width,  8
    assert_equal b.height, 8
    assert_equal b.headers, ('1'..'8').to_a
    assert_equal b.rows.size, 8
  end

  def test_board_with_dimensions_too_low
    b = ConnectFour::Board.new(width: 5, height: 5)
    assert_equal b.width,  8
    assert_equal b.height, 8
    assert_equal b.headers, ('1'..'8').to_a
    assert_equal b.rows.size, 8
  end

  def test_board_with_dimensions_too_high
    b = ConnectFour::Board.new(width: 100, height: 100)
    assert_equal b.width,     ConnectFour::Board::MAX_BOARD_WIDTH
    assert_equal b.height,    ConnectFour::Board::MAX_BOARD_HEIGHT
    assert_equal b.headers,   ConnectFour::Board::COLUMN_HEADERS
    assert_equal b.rows.size, ConnectFour::Board::MAX_BOARD_HEIGHT
  end
end
