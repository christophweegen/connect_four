require_relative 'setup_prompt'
require_relative 'constants'

module ConnectFour
  class BoardSetup < Hash
    def initialize
      game_mode = ConnectFour::SetupPrompt.prompt_for_game_mode
      valid_game_mode = ConnectFour::SetupPrompt.prompt_for_valid_game_mode(game_mode)
      case valid_game_mode
      when ConnectFour::Constants::CLASSIC_MODE
        # initialize 2 Players & Classic Board
        player_count   = ConnectFour::Constants::MIN_PLAYER_COUNT
        player_names   = ConnectFour::SetupPrompt.prompt_for_player_names(player_count)
        self[:players] = ConnectFour::SetupPrompt.generate_players_from_player_names(player_names)
      when ConnectFour::Constants::MULTIPLAYER_MODE
        # initialize Multiplayer Setup
        player_count    = ConnectFour::SetupPrompt.prompt_for_player_count
        player_names    = ConnectFour::SetupPrompt.prompt_for_player_names(player_count)
        self[:width]    = ConnectFour::SetupPrompt.prompt_for_board_width(player_count)
        self[:height]   = ConnectFour::SetupPrompt.prompt_for_board_height(player_count)
        self[:players]  = ConnectFour::SetupPrompt.generate_players_from_player_names(player_names)
      end
    end
  end
end
