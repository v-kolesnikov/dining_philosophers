require "spec_helper"
require "shared"

RSpec.describe DiningPhilosophers::ResourceHierarchy::Philosopher do
  let(:chocksticks) do
    (1..5).map do |number|
      DiningPhilosophers::ResourceHierarchy::Chockstick.new(number)
    end
  end

  let(:philosophers) do
    names = %w(Пифагор Сократ Платон Диоген Аристотель)
    (0..4).to_a.concat([0]).each_cons(2).zip(names).map do |(left, right), name|
      described_class.new(name, chocksticks[left], chocksticks[right])
    end
  end

  include_examples "table setup"
  include_examples "by timeout"
end
