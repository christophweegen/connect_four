module ConnectFour
  module WinnerChecker
    def check_for_winner
      rows = self.rows
      horizontal = check_horizontal(rows)
      vertical   = check_vertical(rows)
      diagonal   = check_diagonal(rows)
      horizontal # || vertical || diagonal
    end

    def check_horizontal(rows)
      player_id = nil
      consecutive_tokens = 0
      rows.reverse_each do |row|
        player_id = nil
        consecutive_tokens = 0
        row.each do |slot|
          if slot && slot != player_id
            player_id = slot
            consecutive_tokens = 1
          elsif slot && slot == player_id
              consecutive_tokens += 1
          else
            consecutive_tokens = 0
            player_id = nil
          end
          if consecutive_tokens == 4
            return winner = @players[player_id - 1]
          end
        end
      end
      nil
    end

    def check_vertical(rows)
      # winner = nil
      # player_id = nil
      # consecutive_tokens = 0
      # rows.reverse_each do |row|
      #   row.each_with_index do |slot|
      #     if slot && slot != player_id
      #       player_id = slot
      #       consecutive_tokens = 1
      #     elsif slot == player_id
      #         consecutive_tokens += 1
      #     else
      #       consecutive_tokens = 0
      #       player_id = nil
      #     end
      #     return winner = player_id if consecutive_tokens == 4
      #   end
      # end
    end

    def check_diagonal(rows)
    end
  end
end
