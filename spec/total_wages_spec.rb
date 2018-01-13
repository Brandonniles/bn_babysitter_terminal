require '../lib/main'

RSpec.describe '.total_wages' do
  context 'sums up all wages methods' do

    context 'start_time => 6pm, end_time => 2am' do
      let(:time6) { Time.new(1,1,1,18,0,0) }
      let(:time2a) { Time.new(1,1,2,2,0,0) }
      it "returns 92" do
        expect(total_wages(time6, time2a)).to eql("You earned $92 in wages")
      end
    end

    context 'start_time => 10:30pm, end_time => 1am' do
      let(:time1030) { Time.new(1,1,1,22,30,0) }
      let(:time1a) { Time.new(1,1,2,1,0,0) }
      it "returns 24" do
        expect(total_wages(time1030, time1a)).to eql("You earned $24 in wages")
      end
    end

    context 'start_time => 5pm, end_time => 11pm' do
      let(:time5) { Time.new(1,1,1,17,0,0) }
      let(:time11) { Time.new(1,1,1,23,0,0) }
      it "returns 64" do
        expect(total_wages(time5, time11)).to eql("You earned $64 in wages")
      end
    end

    context 'start_time => 10pm, end_time => 12am' do
      let(:time10) { Time.new(1,1,1,22,0,0) }
      let(:time12a) { Time.new(1,1,2,0,0,0) }
      it "returns 16" do
        expect(total_wages(time10, time12a)).to eql("You earned $16 in wages")
      end
    end

    context 'start_time => 12:30am, end_time => 3:45am' do
      let(:time1230a) { Time.new(1,1,2,0,30,0) }
      let(:time345a) { Time.new(1,1,2,3,45,0) }
      it "returns 48" do
        expect(total_wages(time1230a, time345a)).to eql("You earned $48 in wages")
      end
    end

    context 'start_time => 9:30pm, end_time => 3:45am' do
      let(:time930) { Time.new(1,1,1,21,30,0) }
      let(:time345a) { Time.new(1,1,2,3,45,0) }
      it "returns 64" do
        expect(total_wages(time930, time345a)).to eql("You earned $64 in wages")
      end
    end

  end
end
