class TrialsExtractor
  API_URL = 'https://aplicacao7.tst.jus.br/pautaws/rest/processospauta/tst'

  attr_reader :schedule

  def initialize(adjudicating_part_code, year, schedule_number, session_kind)
    @adjudicating_part_code = adjudicating_part_code
    @year                   = year
    @schedule_number        = schedule_number
    @session_kind           = session_kind
    @schedule               = get_schedule
  end

  def call
    begin
      response = HTTParty.get(API_URL, { query: { sessao: @schedule.composite_id } })
    rescue Net::OpenTimeout => exception
      raise "API is unavailable"
    end


  end

  private

  def get_schedule
    schedule = Schedule.where(
      adjudicating_part_code: @adjudicating_part_code,
      year: @year,
      number: @schedule_number,
      kind: @session_kind
    ).first

    unless schedule
      raise "Schedule not found to passed args"
    end

    schedule
  end
end