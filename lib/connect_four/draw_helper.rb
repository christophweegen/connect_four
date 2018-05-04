module ConnectFour
  module DrawHelper
    def center(string)
      string.rjust(`tput cols`.to_i/2 + string.size/2)
    end
  end
end
