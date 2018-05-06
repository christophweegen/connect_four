require_relative 'color_output'

module ConnectFour
  module DrawHelper
    include ColorOutput

    def clear_screen
      system "clear" or system "cls"
    end

    def center(string)
      string.rjust(`tput cols`.to_i/2 + string.size/2)
    end

    def center_puts(string)
      puts string.rjust(`tput cols`.to_i/2 + string.size/2)
    end

    def center_print(string)
      print string.rjust(`tput cols`.to_i/2 + string.size/2)
    end

    def print_logo
      logo = "##### Multiplayer Connect Four #####"
      2.times { puts }
      center_puts logo
      puts
    end

    # draws board in console
    def draw_board
      clear_screen
      print_logo
      center_puts @column_headers.join(' ')
      @rows.each do |row|
        row_string = ""
        slots_filled_in_row = 0
        row.each do |slot|
          if slot
            color_code = slot
            color_code = 1 if slot == "X"
            color_code = 2 if slot == "O"
            color_code = COLOR_CODES[color_code]
            slot = slot.to_s.colorize(color_code)
            slots_filled_in_row += 1
          else
            slot = '.'
          end
          row_string << (slot + " ")
        end
        center_puts((' ' * 11 * slots_filled_in_row) + row_string)
      end
    end
  end
end
