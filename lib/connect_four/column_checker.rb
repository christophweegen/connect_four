module ConnectFour
  module ColumnChecker
    private
      def column_valid?(column)
        @column_headers.include?(column)
      end

      def column_full?(column)
        return unless column_valid?(column)
        index_of_column = @column_headers.index(column)
        @rows.reverse_each do |row|
          if row[index_of_column].nil?
            return false
          else
            next
          end
        end
        true
      end

      def check_for_valid_and_empty_column(column:, player:)
        until column_valid?(column) && !column_full?(column)
          clear_screen
          column_invalid_text = "Column invalid! " +
                                "Look at the board headers to see valid columns!"
          column_full_text    = "Column full! Select another column!"
          draw_board
          puts
          center_puts(column_invalid_text) unless @column_headers.include?(column)
          center_puts(column_full_text) if column_full?(column)
          center_print("#{player.name}(#{player.id}), " +
                       "please select the column you want to play: ")
          column = gets.chomp
        end
        column
      end
  end
end
