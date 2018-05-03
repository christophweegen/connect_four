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
  end
end
