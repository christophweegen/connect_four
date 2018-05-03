module ConnectFour
  class Player
    attr_reader :id, :name

    def initialize(id, name: "AnonymousPlayer")
      @id = id
      @name = name
    end
  end
end
