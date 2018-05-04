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
  end
end
