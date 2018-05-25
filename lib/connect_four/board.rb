require_relative 'draw_helper'
require_relative 'column_validator'
require_relative 'winner_checker'

module ConnectFour
  class Board
    include ConnectFour::DrawHelper
    include ConnectFour::ColumnValidator

    attr_reader :width, :height, :rows, :column_headers, :players

    def initialize(width: 8, height: 8, players:)
      limit_and_set_board_dimensions(width, height)
      @players = players
      @rows    = []
      @column_headers = ConnectFour::Constants::COLUMN_HEADERS[0..(@width - 1)]

      # initialize board as two-dimensional array
      @height.times do
        @rows << Array.new(@width)
      end
    end

    def play
      @players.cycle do |player|
        draw_board
        puts
        column = prompt_for_column_to_play(player)
        claim_slot(player: player, column: column)
        winner_checker = ConnectFour::WinnerChecker.new(board: self)
        winner = winner_checker.check_for_winner
        if winner
          draw_winner_board(winner)
          return
        end
      end
    end

    private
      def claim_slot(player:, column:)
        index_of_column = @column_headers.index(column)
        @rows.reverse_each do |row|
          if row[index_of_column].nil?
            row[index_of_column] = player.id
            break
          else
            next
          end
        end
      end

      def prompt_for_column_to_play(player)
        if @players.size == ConnectFour::Constants::MIN_PLAYER_COUNT
          player_id = player.id == 1 ? "X" : "O"
        else
          player_id = player.id
        end
        colors = ConnectFour::ColorOutput::COLOR_CODES
        name = player.name + "(" + player_id.to_s + ")"
        name = name.colorize(colors[player.id])
        center_puts((" " * 11) + "It's your turn, #{name}")
        center_print("Please select the column you want to play: ")
        column = gets.chomp
        check_for_valid_and_empty_column(column: column, player: player)
      end

      def limit_and_set_board_dimensions(width, height)
        # limit and set board width
        if width  <  ConnectFour::Constants::MIN_BOARD_WIDTH
          @width = ConnectFour::Constants::MIN_BOARD_WIDTH
          puts "The width value you provided was too low. " +
               "Width was set to #{@width} (min value)."
        elsif width > ConnectFour::Constants::MAX_BOARD_WIDTH
          @width = ConnectFour::Constants::MAX_BOARD_WIDTH
          puts "The width value you provided was too high. " +
               "Width was set to #{@width} (max value)."
        else
          @width = width
        end
        # limit and set board height
        if height  <  ConnectFour::Constants::MIN_BOARD_HEIGHT
          @height = ConnectFour::Constants::MIN_BOARD_HEIGHT
          puts "The height value you provided was too low. " +
               "Height was set to #{@height} (min value)."
        elsif height > ConnectFour::Constants::MAX_BOARD_HEIGHT
          @height = ConnectFour::Constants::MAX_BOARD_HEIGHT
          puts "The height value you provided was too high. " +
               "Height was set to #{@height} (max value)."
        else
          @height = height
        end
      end
  end
end
