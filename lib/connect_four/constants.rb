module ConnectFour
  module Constants
    CLASSIC_MODE     = 1
    MULTIPLAYER_MODE = 2
    COLUMN_HEADERS   = ("1".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    MIN_BOARD_WIDTH  = 8
    MIN_BOARD_HEIGHT = 8
    MAX_BOARD_WIDTH  = COLUMN_HEADERS.size
    MAX_BOARD_HEIGHT = 100
    MIN_PLAYER_COUNT = 2
    MAX_PLAYER_COUNT = 5
  end
end
