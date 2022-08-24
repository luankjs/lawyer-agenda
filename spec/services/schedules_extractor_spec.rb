require 'rails_helper'

RSpec.describe SchedulesExtractor, type: :model do
  describe '#call' do
    it "assign api returns some schedule" do
      SchedulesExtractor.new.call

      expect(schedules).to be > 0
    end
  end
end
