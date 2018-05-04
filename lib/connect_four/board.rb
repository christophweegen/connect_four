module ConnectFour
  class Board
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

    # draws board in console
    def draw
      ConnectFour::Prompt.clear
      @column_headers.each {|char| print char + " " }
      puts
      @rows.each do |row|
        row.each do |slot|
          print((slot || ".") + " ")
        end
        puts
      end
    end

    def play
      winner = nil
      until winner
        players.cycle do |player|
          draw
          puts
          claim_slot(player)
          # check_for_winner
        end
      end
      # applaud(winner)
    end

    private
      def claim_slot(player)
        column = ConnectFour::Prompt.prompt_for_column_to_play(player: player,
                                                               column_headers: @column_headers)
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
