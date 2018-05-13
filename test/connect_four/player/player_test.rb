require 'test_helper'

describe ConnectFour::Player do
  it "has_an_id_and_name" do
    player = ConnectFour::Player.new(id: 1, name: "Player1")
    expect(player.id).must_equal 1
    expect(player.name).must_equal "Player1"
  end

  it "has_id_as_a_required_kwarg" do
    e = proc { ConnectFour::Player.new(name: "Player") }.must_raise(ArgumentError)
    expect(e.message).must_equal "missing keyword: id"
  end
end
