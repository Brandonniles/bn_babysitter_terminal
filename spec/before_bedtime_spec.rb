require_relative '../lib/methods'

#for these tests the bedtime will be hardcoded at 21:00. Later version the bedtime will be dynamic
RSpec.describe '.before_bedtime_wages' do
  context "returns pre-bedtime wages" do

    context 'start_time => 10:30pm, end_time => 1am' do
      let(:time1030) { Time.new(1,1,1,22,30,0) }
      let(:time1a) { Time.new(1,1,2,1,0,0) }
      it "returns 0" do
        expect(before_bedtime_wages(time1030, time1a)).to eql(0)
      end
    end

    context 'start_time => 6pm, end_time => 2am' do
      let(:time6) { Time.new(1,1,1,18,0,0) }
      let(:time2a) { Time.new(1,1,2,2,0,0) }
      it "returns 36" do
        expect(before_bedtime_wages(time6, time2a)).to eql(36)
      end
    end

    context "start_time => 8pm, end_time => 9pm" do
      let(:time8) {Time.new(1,1,1,20,0,0)}
      let(:time9) {Time.new(1,1,1,21,0,0)}
      it "returns 12" do
        expect(before_bedtime_wages(time8, time9)).to eql(12)
      end
    end

    #according to the rules, babysitter is only paid for FULL hours of work
    context "start_time => 6pm, end_time => 8:30pm" do
      let(:time6) {Time.new(1,1,1,18,0,0)}
      let(:time830) {Time.new(1,1,1,20,30,0)}
      it "returns 24" do
        expect(before_bedtime_wages(time6, time830)).to eql(24)
      end
    end

    #should only count the 4hrs (5-9) before bedtimes
    context "start_time => 5pm, end_time => 11pm" do
      let(:time5) {Time.new(1,1,1,17,0,0)}
      let(:time11) {Time.new(1,1,1,23,0,0)}
      it "returns 48" do
        expect(before_bedtime_wages(time5, time11)).to eql(48)
      end
    end
  end
end
