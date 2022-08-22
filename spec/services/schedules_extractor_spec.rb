require 'rails_helper'

RSpec.describe SchedulesExtractor, type: :model do
  describe '#call' do
    describe 'when api is unavailable' do
      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/pautas").
          with(
            headers: { 'Connection'=>'close', 'Host'=>'aplicacao7.tst.jus.br', 'User-Agent'=>'http.rb/5.1.0' }
          ).to_timeout
      end

      let(:schedules_extractor) { SchedulesExtractor.new.call }

      it "should return a message" do
        expect(schedules_extractor).to eq("API is unavailable")
      end
    end
    
    describe 'when api returns an empty list' do
      before do
        stub_request(:get, "https://aplicacao7.tst.jus.br/pautaws/rest/pautas").
          with(
            headers: { 'Connection'=>'close', 'Host'=>'aplicacao7.tst.jus.br', 'User-Agent'=>'http.rb/5.1.0' }
          ).to_return(status: 200, body: [], headers: {})
      end

      it "no schedules should be created" do
        expect(Schedule.count).to eq(0)
      end
    end
  end
end
