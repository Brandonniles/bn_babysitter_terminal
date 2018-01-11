require '../lib/main'

#still figuring out how I want to test this method
#possibly to make sure it returns a timestamp
#possibly to make sure it returns a timestamp in between 5pm and 4am
RSpec.describe '.clock_in_hr' do
  it "gets the hour the user started working" do
      expect(clock_in_hr).to eql()
  end
end
#for these tests the bedtime will be hardcoded at 21:00. Later version the bedtime will be dynamic
RSpec.describe '.before_bedtime_wages' do
  context "returns the wages one has earned before bedtime" do
    context "if the, start time: 8pm and end time: 9pm" do
      it "text should return 12" do
        expect(before_bedtime_wages((1,1,1,20,0,0),(1,1,1,21,0,0))).to eql(12)
      end
    end

#according to the rules, babysitter is only paid for FULL hours of work
    context "if the, start time: 6pm and end time: 8:30pm" do
      it "text should return 24" do
        expect(before_bedtime_wages((1,1,1,18,0,0),(1,1,1,20,30,0))).to eql(24)
      end
    end

#should only count the 4hrs (5-9) before bedtimes
    context "if the, start time: 5pm and end time: 11pm" do
      it "text should return 48" do
        expect(before_bedtime_wages((1,1,1,17,0,0),(1,1,1,23,0,0))).to eql(48)
      end
    end
  end
end
