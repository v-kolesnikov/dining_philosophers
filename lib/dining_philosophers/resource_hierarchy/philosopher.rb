module DiningPhilosophers
  module ResourceHierarchy
    class Philosopher
      attr_reader :name, :left, :right

      EAT_INTERVAL   = 3..5 # sec
      THINK_INTERVAL = 1..2 # sec

      def initialize(name, left, right)
        @name = name
        @left, @right = left.id < right.id ? [left, right] : [right, left]
      end

      def run
        loop do
          think
          left.lock(name) do
            right.lock(name) { eat }
          end
        end
      end

      def think
        sleep(rand(THINK_INTERVAL))
      end

      def eat
        sleep(rand(EAT_INTERVAL))
      end
    end
  end
end
