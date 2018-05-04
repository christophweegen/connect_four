require_relative 'connect_four/player'
require_relative 'connect_four/board'

min_board_width  = ConnectFour::Board::MIN_BOARD_WIDTH
min_board_height = ConnectFour::Board::MIN_BOARD_HEIGHT
max_board_width  = ConnectFour::Board::MAX_BOARD_WIDTH
max_board_height = ConnectFour::Board::MAX_BOARD_HEIGHT

def clear
  system "clear" or system "cls"
end

clear
puts "Welcome to Multiplayer Connect Four!"

# Prompt for game_mode
puts "Please choose game mode:"
puts
puts "1) Classic Mode --- Players: 2 // Board Size: 8x8"
puts "2) Multiplayer Mode --- Up to 20 Players // Board Size: 8x8 - 61x100"
puts
print "Enter number of game mode: "
game_mode = gets.chomp
clear
until ('1'..'2') === game_mode
  puts "Game mode invalid. Please enter 1 or 2."
  print "Enter number of game mode: "
  game_mode = gets.chomp
  clear
end

# Initialize Classic Mode Board or prompt for Multiplayer player_count
case game_mode
when "1"
  board = ConnectFour::Board.new
when "2"
  print "Please enter number of players (2-20): "
  player_count = gets.chomp
  clear
  until ('2'..'20') === player_count
    puts "Number of players invalid. Please enter a number from 2 to 20."
    print "Please enter number of players (2-20): "
    player_count = gets.chomp
    clear
  end

  # Prompt for board width
  print "Please enter board width " +
        "(#{min_board_width}-" +
        "#{max_board_width}). " +
        "To provide a good experience for #{player_count} Players, " +
        "width should be at least #{player_count.to_i * 4}: "

  width = gets.chomp
  clear
  until (min_board_width.to_s..max_board_width.to_s) === width
    puts "Width invalid. Please enter a number from #{min_board_width} to #{max_board_width}."
    print "Please enter number of players (2-20): "
    width = gets.chomp
    clear
  end

  # Prompt for board height
  print "Please enter board height " +
        "(#{min_board_height}-" +
        "#{max_board_height}). " +
        "To provide a good experience for #{player_count} Players, " +
        "height should be at least #{player_count.to_i * 4}: "

  height = gets.chomp
  clear
  until (min_board_height.to_s..max_board_height.to_s) === width
    puts "Width invalid. Please enter a number from #{min_board_width} to #{max_board_width}."
    print "Please enter number of players (2-20): "
    height = gets.chomp
    clear
  end
end
