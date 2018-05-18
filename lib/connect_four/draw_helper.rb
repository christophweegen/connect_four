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
      put_column_headers
      @rows.each do |row|
        row_string = ""
        slots_filled_in_row = 0
        row.each do |slot|
          if slot
            color_code = slot
            if @players.size == 2
              slot = "X" if slot == 1
              slot = "O" if slot == 2
            end
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
      put_column_headers
    end

    def put_column_headers
      center_puts @column_headers.join(' ')
    end

    def draw_winner_board(winner)
      clear_screen
      print_logo
      center_puts @column_headers.join(' ')
      winner_id = winner.id
      if @players.size == 2
        winner_id = "X" if winner.id == 1
        winner_id = "O" if winner.id == 2
      end
      @rows.each do |row|
        row_string = ""
        slots_filled_in_row = 0
        row.each do |slot|
          if slot
            color_code = slot
            if @players.size == 2
              slot = "X" if slot == 1
              slot = "O" if slot == 2
            end
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
      puts
      center_puts "We have a winner!!!!! The winner is #{winner.name}(#{winner_id})"
      2.times { puts }
    end
  end
end
