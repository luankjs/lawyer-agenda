require 'rails_helper'

RSpec.describe SchedulesExtractor, type: :model do
  describe '#call' do
    describe 'when api is unavailable' do
      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/pautas").to_timeout
      end

      let(:schedules_extractor) { SchedulesExtractor.new.call }

      it "should return a message" do
        expect(schedules_extractor).to eq("API is unavailable")
      end
    end
    
    describe 'when api returns an empty list' do
      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/pautas").
          to_return(status: 200, body: '[]', headers: {})
      end

      it "no schedules should be created" do
        SchedulesExtractor.new.call

        expect(Schedule.count).to eq(0)
      end
    end
    
    describe 'when api returns at least a schedule that already was extracted' do
      let(:json_response_mock) { File.read(File.join("spec", "support", "fixtures", "schedules.json")) }

      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/pautas").
          to_return(status: 200, body: json_response_mock, headers: {})
      end
      
      let!(:already_extracted_schedule) { 
        create(
          :schedule, 
          adjudicating_part_code: 405,
          year: 2022,
          number: 6,
          kind: "O"
        ) 
      }

      it 'already extracted schedules are ignored' do
        expect(Schedule.count).to eq(1)
        
        SchedulesExtractor.new.call

        expect(Schedule.count).to eq(2)
        expect(Schedule.where(adjudicating_part_code: 405, year: 2022, number: 6, kind: "O").count).to eq(1)
      end
    end
  end
end
