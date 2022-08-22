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

  let!(:another_extracted_schedule) { 
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
    describe 'when api is unavailable' do
      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/processospauta/tst").
        with(query: { sessao: extracted_schedule.composite_id }).to_timeout
      end

      it "should raise an error" do
        expect { trials_extractor.call }.to raise_error("API is unavailable")
      end
    end

    describe 'when api returns trials' do
      let(:json_response_mock) { File.read(File.join("spec", "support", "fixtures", "trials.json")) }
      let(:parsed_trials_from_api) { JSON.parse(json_response_mock) }
      let(:already_extracted_trial) { create(:trial, number: parsed_trials_from_api[0]['numeroCompleto']) }

      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/processospauta/tst").
          with(query: { sessao: extracted_schedule.composite_id }).
          to_return(status: 200, body: json_response_mock, headers: {})
      end

      it 'should create trials' do
        expect(Trial.count).to eq(0)

        trials_extractor.call

        expect(Trial.count).to eq(parsed_trials_from_api.size)
      end

      it 'should create relationship with Schedule correctly' do
        expect(extracted_schedule.trials.size).to eq(0)
        expect(another_extracted_schedule.trials.size).to eq(0)
        
        trials_extractor.call

        expect(extracted_schedule.trials.count).to eq(parsed_trials_from_api.size)
        expect(another_extracted_schedule.trials.size).to eq(0)
        expect(
          Trial.all.collect { |t| t.schedules.to_a }.flatten.uniq
        ).to include(extracted_schedule)
        expect(
          Trial.all.collect { |t| t.schedules.to_a }.flatten.uniq
        ).to_not include(another_extracted_schedule)
      end

      it 'should ignore already extracted trials' do
        expect(already_extracted_trial.number).to eq(parsed_trials_from_api[0]['numeroCompleto'])
        expect(Trial.count).to eq(1)
        expect(extracted_schedule.trials.count).to eq(0)

        trials_extractor.call

        expect(Trial.count).to_not eq(3)
        expect(Trial.count).to eq(2)
        expect(extracted_schedule.trials.count).to eq(parsed_trials_from_api.size)
      end
    end
  end
end
