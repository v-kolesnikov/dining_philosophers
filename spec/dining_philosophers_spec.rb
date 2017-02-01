require "spec_helper"

RSpec.describe DiningPhilosophers do
  let(:chocksticks) do
    (1..5).map do |number|
      DiningPhilosophers::Chockstick.new(number)
    end
  end

  let(:philosophers) do
    names = %w(Пифагор Сократ Платон Диоген Аристотель)
    (0..4)
      .to_a
      .concat([0])
      .each_cons(2)
      .zip(names)
      .map do |(left, right), name|
        DiningPhilosophers::WisePhilosopher
          .new(name, chocksticks[left], chocksticks[right])
      end
  end

  it "setup" do
    expect(chocksticks.count).to eq 5
    expect(philosophers.count).to eq 5

    expect(philosophers[0].left_chopstick.id).to eq 1
    expect(philosophers[0].right_chopstick.id).to eq 2

    expect(philosophers[1].left_chopstick.id).to eq 2
    expect(philosophers[1].right_chopstick.id).to eq 3

    expect(philosophers[2].left_chopstick.id).to eq 3
    expect(philosophers[2].right_chopstick.id).to eq 4

    expect(philosophers[3].left_chopstick.id).to eq 4
    expect(philosophers[3].right_chopstick.id).to eq 5

    expect(philosophers[4].left_chopstick.id).to eq 1
    expect(philosophers[4].right_chopstick.id).to eq 5
  end

  it 'run' do
    begin
      test_interval_sec = 30
      Timeout.timeout(test_interval_sec) do
        philosophers.map do |philosopher|
          Thread.new { philosopher.run }
        end.map(&:join)
      end
    rescue Timeout::Error => e
      e.inspect
    end
  end
end
