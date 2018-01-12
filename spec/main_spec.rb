require '../lib/main'

#still figuring out how I want to test this method
#possibly to make sure it returns a timestamp
#possibly to make sure it returns a timestamp in between 5pm and 4am
# RSpec.describe '.clock_in' do
#   it "returns clockin timestamp" do
#     expect(clock_in).to exist
#   end
# end

#for these tests the bedtime will be hardcoded at 21:00. Later version the bedtime will be dynamic
RSpec.describe '.before_bedtime_wages' do
  context "returns pre-bedtime wages" do

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
