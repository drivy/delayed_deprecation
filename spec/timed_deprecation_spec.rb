require "date"

RSpec.describe TimedDeprecation do
  let(:reason) { "Check later" }
  let(:owner) { "Bob" }

  it "executes a block" do
    demo = double(hello: "world")

    described_class.new(reason, owner: owner, reconsider_after: Date.today.next_year) do
      demo.hello
    end

    expect(demo).to have_received(:hello)
  end

  it "doesn't logs when reconsider date is in the future" do
    expect do
      described_class.new(reason, owner: owner, reconsider_after: Date.today.next_year)
    end.not_to output.to_stderr
  end

  it "logs when reconsider date is in the past" do
    expect do
      described_class.new(reason, owner: owner, reconsider_after: Date.today.prev_year)
    end.to output(/#{reason}/).to_stderr
  end
end
