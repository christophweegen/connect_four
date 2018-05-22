module ConnectFour
  module ColorOutput
    COLOR_CODES = { 1 => "\033[1;31m",  # light red
                    2 => "\033[1;32m",  # light green
                    3 => "\033[1;33m",  # yellow
                    4 => "\033[1;36m",  # light cyan
                    5 => "\033[1;95m" } # magenta
  end

  String.class_eval do
    def colorize(color_code)
      "#{color_code}#{self}\033[0m"
    end
  end
end
