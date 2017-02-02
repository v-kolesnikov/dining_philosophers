module DiningPhilosophers
  module WaitCondition
    class Philosopher
      attr_reader :name, :eating, :condition, :table_mutex
      attr_accessor :left, :right

      EAT_INTERVAL   = 3..5 # sec
      THINK_INTERVAL = 1..2 # sec

      def initialize(name, table_mutex)
        @name = name
        @eating = false
        @table_mutex = table_mutex
        @condition = ConditionVariable.new
      end

      def run
        loop do
          think
          eat
        end
      end

      def think
        table_mutex.synchronize do
          @eating = false
          left.condition.signal
          right.condition.signal
        end
        sleep(rand(THINK_INTERVAL))
      end

      def eat
        table_mutex.synchronize do
          condition.wait(table_mutex) while right.eating || right.eating
          @eating = true
        end
        sleep(rand(EAT_INTERVAL))
      end
    end
  end
end
