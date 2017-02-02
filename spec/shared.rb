RSpec.shared_examples "table setup" do
  it "5 philosophers and 5 chocksticks" do
    expect(chocksticks.count).to eq 5
    expect(philosophers.count).to eq 5
  end
end

RSpec.shared_examples "by timeout" do
  let(:lunch_timeout_seconds) { 10 }

  subject do
    Timeout.timeout(lunch_timeout_seconds) do
      philosophers.map do |philosopher|
        Thread.new { philosopher.run }
      end.map(&:join)
    end
  end

  it "successfully lunch before timeout" do
    expect { subject }.to raise_error Timeout::Error
  end
end
