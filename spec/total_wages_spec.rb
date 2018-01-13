require '../lib/main'

RSpec.describe '.total_wages' do
  context 'sums up all wages methods' do

    context 'start_time => 6pm, end_time => 2am' do
      let(:time6) { Time.new(1,1,1,18,0,0) }
      let(:time2a) { Time.new(1,1,2,2,0,0) }
      it "returns 92" do
        expect(total_wages(time6, time2a)).to eql(92)
      end
    end

    context 'start_time => 10:30pm, end_time => 1am' do
      let(:time1030) { Time.new(1,1,1,10,30,0) }
      let(:time1a) { Time.new (1,1,2,1,0,0) }
      it "returns 24" do
        expect(total_wages(time1030, time2a)).to eql(24)
      end
    end

    context ''


  end
end
