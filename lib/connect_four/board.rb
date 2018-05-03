module ConnectFour
  class Board
    attr_reader :width, :height, :rows

    def initialize(width: 8, height: 8)
      @width  = width
      @height = height
      @rows   = []

      # initialize board as two-dimensional array
      height.times do
        @rows << Array.new(width)
      end
    end

    # draws board in console
    def draw
      @rows.each do |row|
        row.each do |slot|
          print slot || "."
        end
        puts
      end
    end
  end
end
