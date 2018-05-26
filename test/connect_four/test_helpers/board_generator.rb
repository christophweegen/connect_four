module ConnectFour
  module TestHelpers
    class BoardGenerator
      MAX_BOARD_WIDTH   = ConnectFour::Constants::MAX_BOARD_WIDTH
      MIN_BOARD_WIDTH   = ConnectFour::Constants::MIN_BOARD_WIDTH
      MAX_BOARD_HEIGHT  = ConnectFour::Constants::MAX_BOARD_HEIGHT
      MIN_BOARD_HEIGHT  = ConnectFour::Constants::MIN_BOARD_HEIGHT
      MIN_PLAYER_COUNT  = ConnectFour::Constants::MIN_PLAYER_COUNT
      MAX_PLAYER_COUNT  = ConnectFour::Constants::MAX_PLAYER_COUNT

      attr_reader :empty_boards,
                  :horizontal_winner_boards,
                  :vertical_winner_boards,
                  :diagonal_asc_winner_boards,
                  :diagonal_desc_winner_boards,
                  :no_winner_boards

      def initialize(number_of_boards_to_generate:)
        @empty_boards = generate_random_empty_boards(number_of_boards_to_generate)
        @horizontal_winner_boards    = generate_horizontal_winner_boards
        @vertical_winner_boards      = generate_vertical_winner_boards
        @diagonal_asc_winner_boards  = generate_diagonal_asc_winner_boards
        @diagonal_desc_winner_boards = generate_diagonal_desc_winner_boards
      end

      private

        def generate_random_empty_boards(number_of_boards_to_generate)
          count = number_of_boards_to_generate
          random_empty_boards = []
          count.times do
            random_width  = rand(MIN_BOARD_WIDTH..MAX_BOARD_WIDTH)
            random_height = rand(MIN_BOARD_HEIGHT..MAX_BOARD_HEIGHT)
            random_player_count = rand(MIN_PLAYER_COUNT..MAX_PLAYER_COUNT)
            players = []
            random_player_count.times do |i|
              players << ConnectFour::Player.new(name: "Player #{i + 1}", id: i + 1)
            end
            board = ConnectFour::Board.new(width:   random_width,
                                           height:  random_height,
                                           players: players )
            random_empty_boards << board
          end
          random_empty_boards
        end

        def generate_horizontal_winner_boards
          boards = deep_dup(@empty_boards)
          boards.each do |board|
            prefill_rows(board)
            board_height = board.rows.size
            board_width  = board.rows[0].size
            random_row_index  = rand(0..(board_height - 1))
            random_slot_index = rand(0..(board_width - 4))
            winner_id = 1
            board.rows[random_row_index][random_slot_index]     = winner_id
            board.rows[random_row_index][random_slot_index + 1] = winner_id
            board.rows[random_row_index][random_slot_index + 2] = winner_id
            board.rows[random_row_index][random_slot_index + 3] = winner_id
          end
          boards
        end

        def generate_vertical_winner_boards
          boards = deep_dup(@empty_boards)
          boards.each do |board|
            board_height = board.rows.size
            board_width  = board.rows[0].size
            random_row_index  = rand(0..(board_height - 4))
            random_slot_index = rand(0..(board_width - 1))
            winner_id = 1
            board.rows[random_row_index][random_slot_index]     = winner_id
            board.rows[random_row_index + 1][random_slot_index] = winner_id
            board.rows[random_row_index + 2][random_slot_index] = winner_id
            board.rows[random_row_index + 3][random_slot_index] = winner_id
          end
          boards
        end

        def generate_diagonal_asc_winner_boards
          boards = deep_dup(@empty_boards)
          boards.each do |board|
            board_height = board.rows.size
            board_width  = board.rows[0].size
            random_row_index  = rand(3..(board_height - 1))
            random_slot_index = rand(0..(board_width - 4))
            winner_id = 1
            board.rows[random_row_index][random_slot_index]     = winner_id
            board.rows[random_row_index - 1][random_slot_index + 1] = winner_id
            board.rows[random_row_index - 2][random_slot_index + 2] = winner_id
            board.rows[random_row_index - 3][random_slot_index + 3] = winner_id
          end
          boards
        end

        def generate_diagonal_desc_winner_boards
          boards = deep_dup(@empty_boards)
          boards.each do |board|
            board_height = board.rows.size
            board_width  = board.rows[0].size
            random_row_index  = rand(0..(board_height - 4))
            random_slot_index = rand(0..(board_width - 4))
            winner_id = 1
            board.rows[random_row_index][random_slot_index]     = winner_id
            board.rows[random_row_index + 1][random_slot_index + 1] = winner_id
            board.rows[random_row_index + 2][random_slot_index + 2] = winner_id
            board.rows[random_row_index + 3][random_slot_index + 3] = winner_id
          end
          boards
        end

        def prefill_rows(board)
          board.rows.each_with_index do |row, index|
            row[0]   = 2 if index.odd?
            row[-1]  = 2 if index.even?
          end
        end

        def deep_dup(array)
          Marshal.load(Marshal.dump(array))
        end
    end
  end
end
