require 'stringio'

module ConnectFour
  module TestHelpers
    module UserInput
      OLD_STDIN = $stdin

      def mock_user_input(*input)
        input = input.join("\n") + "\n"
        $stdin = StringIO.new(input)
      end

      def reset_stdin
        $stdin = OLD_STDIN
      end
    end
  end
end
