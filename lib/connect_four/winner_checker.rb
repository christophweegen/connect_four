module ConnectFour
  class WinnerChecker
    ARRAY_OFFSET = 1
    USELESS_LAST_SLOTS_TO_CHECK = 3
    USELESS_LAST_ROWS_TO_CHECK = 3

    def initialize(rows:, players:)
      @rows = rows
      @players = players
    end

    def check_for_winner
      check_horizontal   || check_vertical ||
      check_diagonal_asc || check_diagonal_desc
    end

    def check_horizontal
      @rows.reverse_each.with_index do |row, row_index|
        return nil unless row.any?
        row.each_with_index do |slot, slot_index|
          next unless slot
          break if slot_index == row.size - USELESS_LAST_SLOTS_TO_CHECK
          next unless row[slot_index + 1] == slot
          next unless row[slot_index + 2] == slot
          next unless row[slot_index + 3] == slot
          hit_coordinates = []
          4.times do |i|
            hit_coordinates << [row_index, slot_index - 1 + i]
          end
          winner_id = slot - ARRAY_OFFSET
          return winner = @players[winner_id]
          # return { winner: @players[slot - 1],
          #          hit_coordinates: hit_coordinates }
        end
      end
      nil
    end

    def check_vertical
      @rows.reverse_each.with_index do |row, row_index|
        return nil if row_index == @rows.size - USELESS_LAST_ROWS_TO_CHECK
        row.each_with_index do |slot, slot_index|
          next unless slot
          rev_rows = @rows.reverse
          next unless rev_rows[row_index + 1][slot_index] == slot
          next unless rev_rows[row_index + 2][slot_index] == slot
          next unless rev_rows[row_index + 3][slot_index] == slot
          winner_id = slot - ARRAY_OFFSET
          return winner = @players[winner_id]
        end
      end
      nil
    end

    def check_diagonal_asc
      @rows.reverse_each.with_index do |row, row_index|
        return nil if row_index == @rows.size - USELESS_LAST_ROWS_TO_CHECK
        row.each_with_index do |slot, slot_index|
          break if slot_index == row.size - USELESS_LAST_SLOTS_TO_CHECK
          next unless slot
          rev_rows = @rows.reverse
          next unless rev_rows[row_index + 1][slot_index + 1] == slot
          next unless rev_rows[row_index + 2][slot_index + 2] == slot
          next unless rev_rows[row_index + 3][slot_index + 3] == slot
          winner_id = slot - ARRAY_OFFSET
          return winner = @players[winner_id]
        end
      end
      nil
    end

    def check_diagonal_desc
      @rows.each_with_index do |row, row_index|
        return nil if row_index == @rows.size - USELESS_LAST_ROWS_TO_CHECK
        row.each_with_index do |slot, slot_index|
          break if slot_index == row.size - USELESS_LAST_SLOTS_TO_CHECK
          next unless slot
          next unless @rows[row_index + 1][slot_index + 1] == slot
          next unless @rows[row_index + 2][slot_index + 2] == slot
          next unless @rows[row_index + 3][slot_index + 3] == slot
          winner_id = slot - ARRAY_OFFSET
          return winner = @players[winner_id]
        end
      end
      nil
    end
  end
end
