require 'test_helper'

class PlayerTest < ConnectFourSpec
  def test_player_has_id_and_name
    player = ConnectFour::Player.new(id: 1, name: "Player1")
    assert player.id == 1
    assert player.name == "Player1"
  end

  def test_player_id_is_required_kwarg
    e = assert_raises(ArgumentError) { ConnectFour::Player.new }
    assert_equal e.message, "missing keyword: id"
  end
end
