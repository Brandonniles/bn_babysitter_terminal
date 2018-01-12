require "../lib/main"

RSpec.describe '.post_midnight_wages' do
  context 'returns wages * 16' do

    context "start_time => 8pm, end_time => 10pm" do
      let(:time8) {Time.new(1,1,1,20,0,0)}
      let(:time10) {Time.new(1,1,1,22,0,0)}
      it "returns 0" do
        expect(post_midnight_wages(time8, time10)).to eql(0)
      end
    end

    context "start_time => 8pm, end_time => 12am" do
      let(:time8) {Time.new(1,1,1,20,0,0)}
      let(:time0) {Time.new(1,1,2,0,0,0)}
      it "returns 0" do
        expect(post_midnight_wages(time8, time0)).to eql(0)
      end
    end

    context "start_time => 1am, end_time => 4am" do
      let(:time1) {Time.new(1,1,2,1,0,0)}
      let(:time4) {Time.new(1,1,2,4,0,0)}
      it "returns 48" do
        expect(post_midnight_wages(time1, time4)).to eql(48)
      end
    end

    context "start_time => 6pm, end_time => 4am" do
      let(:time6) {Time.new(1,1,1,18,0,0)}
      let(:time4) {Time.new(1,1,2,4,0,0)}
      it "returns 64" do
        expect(post_midnight_wages(time6, time4)).to eql(64)
      end
    end

    context "start_time => 11pm, end_time => 1am" do
      let(:time11) {Time.new(1,1,1,23,0,0)}
      let(:time1) {Time.new(1,1,2,1,0,0)}
      it "returns 16" do
        expect(post_midnight_wages(time11, time1)).to eql(16)
      end
    end

  end
end
