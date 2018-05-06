module ConnectFour
  module ColorOutput
    COLOR_CODES = { 1 => "\033[1;31m",   # light red
                    2 => "\033[1;32m",   # light green
                    3 => "\033[1;33m",   # yellow
                    4 => "\033[1;36m",   # light cyan
                    5 => "\033[1;95m",   # magenta
                    6 => "\033[1;34m",   # blue
                    7 => "\033[1;37m",   # white
                    8 => "\033[1;34m",   # light blue
                    9 => "\033[1;37m" }  # light gray
  end

  String.class_eval do
    def colorize(color_code)
      "#{color_code}#{self}\033[0m"
    end
  end
end
