module ConnectFour
  module Prompt
    class << self
      def prompt_for_game_mode
        clear
        puts "Please choose game mode:"
        puts
        puts "1) Classic Mode --- Players: 2 // Board Size: 8x8"
        puts "2) Multiplayer Mode --- Up to 20 Players // Board Size: 8x8 - 61x100"
        puts
        print "Enter number of game mode: "
        game_mode = gets.chomp.to_i
        until (1..2) === game_mode
          clear
          puts "Game mode invalid. Please enter 1 for Classic Mode " +
               "or 2 for Multiplayer Mode."
          print "Enter number of game mode: "
          game_mode = gets.chomp.to_i
        end
        game_mode
      end

      def prompt_for_player_count
        clear
        print "Please enter number of players (2-20): "
        player_count = gets.chomp.to_i
        until (2..20) === player_count
          clear
          puts "Number of players invalid. Please enter a number from 2 to 20."
          print "Please enter number of players (2-20): "
          player_count = gets.chomp.to_i
        end
        player_count
      end

      def prompt_for_player_names(player_count)
        players = []
        player_count.times do |i|
          clear
          id = i + 1
          print "Please enter name for player #{id}: "
          name = gets.chomp.strip
          name = "Player" if name.empty?
          players << ConnectFour::Player.new(id: id, name: name)
        end
        players
      end


      def prompt_for_board_width(player_count)
        clear
        min_board_width = ConnectFour::Board::MIN_BOARD_WIDTH
        max_board_width = ConnectFour::Board::MAX_BOARD_WIDTH
        print "Please enter board width " +
              "(#{min_board_width}-" +
              "#{max_board_width}). " +
              "To provide a good experience for #{player_count} Players, " +
              "width should be at least #{player_count * 4}: "
        width = gets.chomp.to_i
        until (min_board_width..max_board_width) === width
          clear
          print "Width invalid. Please enter a number from #{min_board_width} to #{max_board_width}: "
          width = gets.chomp.to_i
        end
        width
      end

      def prompt_for_board_height(player_count)
        clear
        min_board_height = ConnectFour::Board::MIN_BOARD_HEIGHT
        max_board_height = ConnectFour::Board::MAX_BOARD_HEIGHT
        print "Please enter board height " +
              "(#{min_board_height}-" +
              "#{max_board_height}). " +
              "To provide a good experience for #{player_count} Players, " +
              "height should be at least #{player_count.to_i * 4}: "
        height = gets.chomp.to_i
        until (min_board_height..max_board_height) === height
          clear
          print "Width invalid. Please enter a number from #{min_board_width} to #{max_board_width}: "
          height = gets.chomp.to_i
        end
        height
      end

      def prompt_for_column_to_play(player:, column_headers:)
        puts  "It's your turn #{player.name} (#{player.id}). "
        text = "Please select the column you want to play: "
        print text
        column = gets.chomp
        until column_headers.include?(column)
          clear
          puts "Column invalid. Look at the board headers to see valid columns! "
          print text
          column = gets.chomp
        end
        column
      end

      def clear
        system "clear" or system "cls"
      end
    end
  end
end
