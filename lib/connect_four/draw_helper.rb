module ConnectFour
  module DrawHelper
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
      center_puts logo
      puts
    end

    # draws board in console
    def draw
      ConnectFour::Prompt.clear
      print_logo
      center_puts @column_headers.join(' ')
      @rows.each do |row|
        row_string = ""
        row.each do |slot|
          slot = '.' unless slot
          row_string << (slot.to_s + " ")
        end
        center_puts(row_string)
      end
    end
  end
end
