require_relative 'draw_helper'
require_relative 'prompt'
require_relative 'column_validator'
require_relative 'winner_checker'

module ConnectFour
  class Board
    extend  ConnectFour::Prompt
    include ConnectFour::DrawHelper
    include ConnectFour::ColumnValidator
    include ConnectFour::WinnerChecker

    COLUMN_HEADERS = ("1".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    MIN_BOARD_WIDTH  = 8
    MIN_BOARD_HEIGHT = 8
    MAX_BOARD_WIDTH  = COLUMN_HEADERS.size
    MAX_BOARD_HEIGHT = 100
    MAX_PLAYER_COUNT = 5

    attr_reader :width, :height, :rows, :column_headers, :players

    def self.setup_board
      game_mode = prompt_for_game_mode

      case game_mode
      when 1
        # initialize 2 Players & Classic Board
        player_count = 2
        players = prompt_for_player_names(player_count)
        board   = new(players: players)
      when 2
        # initialize Multiplayer Setup
        player_count = prompt_for_player_count
        players      = prompt_for_player_names(player_count)
        width        = prompt_for_board_width(player_count)
        height       = prompt_for_board_height(player_count)
        board        = new(width:   width,
                           height:  height,
                           players: players)
      end
    end

    def initialize(width: 8, height: 8, players:)
      limit_and_set_board_dimensions(width, height)
      @players = players
      @rows    = []
      @column_headers = COLUMN_HEADERS[0..(@width - 1)]

      # initialize board as two-dimensional array
      @height.times do
        @rows << Array.new(@width)
      end
    end

    def play
      @players.cycle do |player|
        draw_board
        puts
        claim_slot(player)
        winner = check_for_winner
        if winner
          draw_winner_board(winner)
          return
        end
      end
    end

    private
      def claim_slot(player)
        column = prompt_for_column_to_play(player)
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
        if @players.size == 2
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
        if width  <  MIN_BOARD_WIDTH
          @width = MIN_BOARD_WIDTH
          puts "The width value you provided was too low. " +
               "Width was set to #{MIN_BOARD_WIDTH} (min value)."
        elsif width > MAX_BOARD_WIDTH
          @width = MAX_BOARD_WIDTH
          puts "The width value you provided was too high. " +
               "Width was set to #{MAX_BOARD_WIDTH} (max value)."
        else
          @width = width
        end
        # limit and set board height
        if height  <  MIN_BOARD_HEIGHT
          @height = MIN_BOARD_HEIGHT
          puts "The height value you provided was too low. " +
               "Height was set to #{MIN_BOARD_HEIGHT} (min value)."
        elsif height > MAX_BOARD_HEIGHT
          @height = MAX_BOARD_HEIGHT
          puts "The height value you provided was too high. " +
               "Height was set to #{MAX_BOARD_HEIGHT} (max value)."
        else
          @height = height
        end
      end
  end
end
