require "../lib/main"

RSpec.describe '.bedtime_wages' do
  context "returns wages * $8" do

    context "start_time => 8pm, end_time => 10pm" do
      let(:time8) {Time.new(1,1,1,20,0,0)}
      let(:time10) {Time.new(1,1,1,22,0,0)}
      it "returns 8" do
        expect(bedtime_wages(time8, time10)).to eql(8)
      end
    end
    context "start_time => 9pm, end_time => 12am" do
      let(:time9) {Time.new(1,1,1,19,0,0)}
      let(:time12) {Time.new(1,1,2,0,0,0)}
      it "returns 24" do
        expect(bedtime_wages(time9, time12)).to eql(24)
      end
    end
    context "start_time => 1am, end_time => 4am" do
      let(:time1) {Time.new(1,1,2,1,0,0)}
      let(:time4) {Time.new(1,1,2,4,0,0)}
      it "returns 0" do
        expect(bedtime_wages(time1, time4)).to eql(0)
      end
    end

  end
end
