require "spec_helper"
require "shared"

RSpec.describe DiningPhilosophers::WaitCondition::Philosopher do
  let(:table) { Mutex.new }

  let(:philosophers) do
    names = %w(Пифагор Сократ Платон Диоген Аристотель)
    phils = names.map { |name| described_class.new(name, table) }

    (0..4).to_a.concat([0]).each_cons(2).each do |(left, right)|
      phils[left].tap do |p|
        p.left = phils[left - 1]
        p.right = phils[right]
      end
    end
    phils
  end

  it do
    philosophers.each_cons(2) do |first, second|
      expect(first.right).to eq second
    end
    expect(philosophers.last.right).to eq philosophers.first
  end

  include_examples "by timeout"
end
