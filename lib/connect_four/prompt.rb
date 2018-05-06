module ConnectFour
  module Prompt
    include ConnectFour::DrawHelper

    def prompt_for_game_mode
      clear_screen
      print_logo
      center_puts "Welcome to Multiplayer Connect Four!"
      puts
      center_puts "Please choose game mode:"
      puts
      center_puts "-----------------------------------------------------------------------"
      center_puts "1) Classic Mode     | Players: 2       | Board Size: 8x8               "
      center_puts "-----------------------------------------------------------------------"
      center_puts "2) Multiplayer Mode | Up to 20 Players | Board Size: From 8x8 to 61x100"
      center_puts "-----------------------------------------------------------------------"
      puts
      center_print "Enter number of game mode: "
      game_mode = gets.chomp.to_i
      until (1..2) === game_mode
        clear_screen
        print_logo
        center_puts "Game mode invalid. Please enter 1 for Classic Mode " +
             "or 2 for Multiplayer Mode."
        center_print "Enter number of game mode: "
        game_mode = gets.chomp.to_i
      end
      game_mode
    end

    def prompt_for_player_count
      clear_screen
      print_logo
      center_print "Please enter number of players (2-9): "
      player_count = gets.chomp.to_i
      until (2..9) === player_count
        clear_screen
        center_puts "Number of players invalid. Please enter a number from 2 to 9."
        center_print "Please enter number of players (2-9): "
        player_count = gets.chomp.to_i
      end
      player_count
    end

    def prompt_for_player_names(player_count)
      players = []
      player_count.times do |i|
        clear_screen
        print_logo
        id = i + 1
        center_print "Please enter name for player #{id}: "
        name = gets.chomp.strip
        name = "Player" if name.empty?
        players << ConnectFour::Player.new(id: id, name: name)
      end
      players
    end


    def prompt_for_board_width(player_count)
      clear_screen
      print_logo
      min_board_width = ConnectFour::Board::MIN_BOARD_WIDTH
      max_board_width = ConnectFour::Board::MAX_BOARD_WIDTH
      center_print "Please enter board width " +
                   "(#{min_board_width}-" +
                   "#{max_board_width}). " +
                   "To provide a good experience for #{player_count} Players, " +
                   "width should be at least #{player_count * 4}: "
      width = gets.chomp.to_i
      until (min_board_width..max_board_width) === width
        clear_screen
        center_print "Width invalid. Please enter a number from " +
                     "#{min_board_width} to #{max_board_width}: "
        width = gets.chomp.to_i
      end
      width
    end

    def prompt_for_board_height(player_count)
      clear_screen
      print_logo
      min_board_height = ConnectFour::Board::MIN_BOARD_HEIGHT
      max_board_height = ConnectFour::Board::MAX_BOARD_HEIGHT
      center_print "Please enter board height " +
                   "(#{min_board_height}-" +
                   "#{max_board_height}). " +
                   "To provide a good experience for #{player_count} Players, " +
                   "height should be at least #{player_count.to_i * 4}: "
      height = gets.chomp.to_i
      until (min_board_height..max_board_height) === height
        clear_screen
        center_print "Width invalid. Please enter a number from #{min_board_width} to #{max_board_width}: "
        height = gets.chomp.to_i
      end
      height
    end
  end
end
