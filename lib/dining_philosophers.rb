require 'thread'

module DiningPhilosophers
  class Chockstick
    attr_reader :id, :mutex

    def initialize(id)
      @id = id
      @mutex = Mutex.new
    end

    def lock(name)
      mutex.synchronize do
        puts "#{name} lock chockstick ##{id}"
        yield if block_given?
        puts "#{name} unlock chockstick ##{id}"
      end
    end
  end

  class NaivePhilosopher
    attr_reader :name, :left_chopstick, :right_chopstick

    def initialize(name, left_chopstick, right_chopstick)
      @name = name

      @left_chopstick = left_chopstick
      @right_chopstick = right_chopstick
    end

    def run
      loop do
        think
        left_chopstick.lock(name) do
          right_chopstick.lock(name) { eat }
        end
      end
    end

    def think
      puts "#{name} thinking..."
      sleep(rand(2))
    end

    def eat
      puts "#{name} eating..."
      sleep(rand(2))
    end
  end

  class WisePhilosopher < NaivePhilosopher
    def initialize(name, left_chopstick, right_chopstick)
      super

      return if left_chopstick.id < right_chopstick.id

      @left_chopstick = right_chopstick
      @right_chopstick = left_chopstick
    end
  end
end
