require_relative "../lib/timestamp.rb"

RSpec.describe '.in_check' do
  context "returns a Timestamp between 5pm and 4am" do
    it "passes if 8pm produces a valid timestamp" do
      expect(in_check(20,0)).to be >= START_TIME && be <= END_TIME
    end
  end
  it "passes if 2am produces a valid timestamp" do
    expect(in_check(2,0)).to be >= START_TIME && be <= END_TIME
  end
end

RSpec.describe '.out_check' do
  context "returns a Timestamp between 5pm and 4am" do
    it "passes if 8pm produces a valid timestamp" do
      expect(out_check(23,0)).to be >= START_TIME && be <= END_TIME
    end
  end
  it "passes if 2am produces a valid timestamp" do
    expect(out_check(19,0)).to be >= START_TIME && be <= END_TIME
  end
end
