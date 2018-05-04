module ConnectFour
  class Board
    COLUMN_HEADERS = ("1".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    MIN_BOARD_WIDTH  = 8
    MIN_BOARD_HEIGHT = 8
    MAX_BOARD_WIDTH  = COLUMN_HEADERS.size
    MAX_BOARD_HEIGHT = 50

    attr_reader :width, :height, :rows, :headers

    def initialize(width: 8, height: 8)
      limit_and_set_board_dimensions(width, height)
      @rows    = []
      @headers = COLUMN_HEADERS[0..(@width - 1)]

      # initialize board as two-dimensional array
      @height.times do
        @rows << Array.new(@width)
      end
    end

    # draws board in console
    def draw
      @headers.each {|char| print char + " " }
      puts
      @rows.each do |row|
        row.each do |slot|
          print (slot || ".") + " "
        end
        puts
      end
    end

    private
      def limit_and_set_board_dimensions(width, height)
        # limit and set board width
        if width  <  MIN_BOARD_WIDTH
          @width = MIN_BOARD_WIDTH
          puts "The width value you provided was too low." +
               "Width was set to #{MIN_BOARD_WIDTH} (min value)"
        elsif width > MAX_BOARD_WIDTH
          @width = MAX_BOARD_WIDTH
          puts "The width value you provided was too high." +
               "Width was set to #{MAX_BOARD_WIDTH} (max value)"
        else
          @width = width
        end
        # limit and set board height
        if height  <  MIN_BOARD_HEIGHT
          @height = MIN_BOARD_HEIGHT
          puts "The height value you provided was too low." +
               "Height was set to #{MIN_BOARD_HEIGHT} (min value)"
        elsif height > MAX_BOARD_HEIGHT
          @height = MAX_BOARD_HEIGHT
          puts "The height value you provided was too high." +
               "Height was set to #{MAX_BOARD_HEIGHT} (max value)"
        else
          @height = height
        end
      end
  end
end
