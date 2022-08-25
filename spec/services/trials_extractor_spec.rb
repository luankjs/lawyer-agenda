require 'rails_helper'

RSpec.describe TrialsExtractor, type: :model do
  let!(:extracted_schedule) { 
    create(
      :schedule, 
      adjudicating_part_code: 405,
      year: 2022,
      number: 6,
      kind: "O"
    )
  }

  let(:trials_extractor) { 
    TrialsExtractor.new(
      extracted_schedule.adjudicating_part_code,
      extracted_schedule.year,
      extracted_schedule.number,
      extracted_schedule.kind
    ) 
  }

  describe '#new' do
    it 'should receive correct number of args' do
      expect(TrialsExtractor).to_not respond_to(:new).with(1..3).arguments
      expect(TrialsExtractor).to respond_to(:new).with(4)
    end

    it 'should raise an error when schedule not found' do
      expect { TrialsExtractor.new(111, 2222, 3, "A") }.to raise_error("Schedule not found to passed args")
    end

    it 'should find and set correct schedule' do
      expect(trials_extractor.schedule).to eq(extracted_schedule)
    end
  end

  describe '#call' do
  end
end
