require_relative 'draw_helper'

module ConnectFour
  class Board
    include ConnectFour::DrawHelper

    COLUMN_HEADERS = ("1".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    MIN_BOARD_WIDTH  = 8
    MIN_BOARD_HEIGHT = 8
    MAX_BOARD_WIDTH  = COLUMN_HEADERS.size
    MAX_BOARD_HEIGHT = 100

    attr_reader :width, :height, :rows, :column_headers, :players

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
      winner = nil
      until winner
        players.cycle do |player|
          draw_board
          puts
          claim_slot(player)
          # check_for_winner
        end
      end
      # applaud(winner)
    end

    private
      def claim_slot(player)
        column = prompt_for_column_to_play(player)
        index_of_column = @column_headers.index(column)
        @rows.reverse_each do |row|
          if row[index_of_column].nil?
            if @players.size == 2
              row[index_of_column] = player.id == 1 ? "X" : "O"
              break
            else
              row[index_of_column] = player.id
              break
            end
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
        center_puts("It's your turn, #{player.name}(#{player_id}). ")
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

      def column_valid?(column)
        @column_headers.include?(column)
      end

      def column_full?(column)
        return unless column_valid?(column)
        index_of_column = @column_headers.index(column)
        @rows.reverse_each do |row|
          if row[index_of_column].nil?
            return false
          else
            next
          end
        end
        true
      end

      def check_for_valid_and_empty_column(column:, player:)
        until column_valid?(column) && !column_full?(column)
          clear_screen
          column_invalid_text = "Column invalid! " +
                                "Look at the board headers to see valid columns!"
          column_full_text    = "Column full! Select another column!"
          draw_board
          puts
          center_puts(column_invalid_text) unless @column_headers.include?(column)
          center_puts(column_full_text) if column_full?(column)
          center_print("#{player.name}(#{player.id}), " +
                       "please select the column you want to play: ")
          column = gets.chomp
        end
        column
      end
  end
end
