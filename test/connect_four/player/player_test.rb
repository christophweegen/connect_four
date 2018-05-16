require 'test_helper'

describe ConnectFour::Player do
  it "has_an_id_and_name" do
    player = ConnectFour::Player.new(id: 1, name: "Player1")
    assert_equal 1, player.id
    assert_equal "Player1", player.name
  end

  it "has_id_as_a_required_kwarg" do
    e = assert_raises(ArgumentError) { ConnectFour::Player.new(name: "Player") }
    assert_equal "missing keyword: id", e.message
  end
end
