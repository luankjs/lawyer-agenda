require "http"

class SchedulesExtractor
  API_URL = 'https://aplicacao7.tst.jus.br/pautaws/rest/pautas'

  def initialize()
    # initialize
  end

  def call
    begin
      schedules_from_api = HTTP.get(API_URL).parse    
    rescue => exception
      return "API is unavailable"
    end

    schedules_from_api.each do |schedule_from_api|
      schedule_id_params = {
        adjudicating_part_code: schedule_from_api['orgaoJudicante']['codOrgaoJudicante'],
        year: schedule_from_api['anoPauta'],
        number: schedule_from_api['numPauta'],
        kind: schedule_from_api['tipSessao'],
      }

      if Schedule.where(schedule_id_params).count > 0
        puts "Schedule #{schedule_id_params.map { |key, value| value }.join('-')} already extracted"
      else
        schedule_params = {
          adjudicating_part_code: schedule_from_api['orgaoJudicante']['codOrgaoJudicante'],
          kind: schedule_from_api['tipSessao'],
          number: schedule_from_api['numPauta'],
          year: schedule_from_api['anoPauta'],
          date: schedule_from_api['dtaSessao'],
          meta: schedule_from_api,
          mode: schedule_from_api['codMeioJulgamento'],
          published_at: schedule_from_api['dtaPublicacao'],
        }
        
        Schedule.create(schedule_params)
        TrialsExtractor.new(*schedule_id_params.values).call
      end
    end
  end
end