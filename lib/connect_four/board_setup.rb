require_relative 'setup_prompt'
require_relative 'constants'

module ConnectFour
  class BoardSetup < Hash
    include ConnectFour::SetupPrompt

    def initialize
      game_mode = prompt_for_game_mode

      case game_mode
      when ConnectFour::Constants::CLASSIC_MODE
        # initialize 2 Players & Classic Board
        player_count   = ConnectFour::Constants::MIN_PLAYER_COUNT
        player_names   = prompt_for_player_names(player_count)
        self[:players] = generate_players_from_player_names(player_names)
      when ConnectFour::Constants::MULTIPLAYER_MODE
        # initialize Multiplayer Setup
        player_count    = prompt_for_player_count
        player_names    = prompt_for_player_names(player_count)
        self[:width]    = prompt_for_board_width(player_count)
        self[:height]   = prompt_for_board_height(player_count)
        self[:players]  = generate_players_from_player_names(player_names)
      end
    end
  end
end
