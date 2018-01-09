require '../lib/main'

RSpec.describe main do
  describe clock_in do
    it "gets and input from a user" do
      expect(clock_in(""))
    end
  end
end
