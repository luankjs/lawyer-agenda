class TrialsExtractor
  API_URL = 'https://aplicacao7.tst.jus.br/pautaws/rest/processospauta/tst'

  attr_reader :schedule, :trial

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

    trials_from_api = JSON.parse(response&.body)

    trials_from_api.each do |trial_from_api|
      @trial = Trial.find_or_initialize_by(number: trial_from_api['numeroCompleto'])

      unless @trial.persisted?
        @trial.meta = trial_from_api
        @trial.save
      end

      @trial.schedules << @schedule

      parts_from_api = extract_parts(trial_from_api['listaPartes'])
    end
  end

  private

  def get_schedule
    schedule = Schedule.find_by(
      adjudicating_part_code: @adjudicating_part_code,
      year: @year,
      number: @schedule_number,
      kind: @session_kind
    )

    unless schedule
      raise "Schedule not found to passed args"
    end

    schedule
  end

  def extract_parts(parts_from_api)
    parts_from_api.each do |part_from_api|
      part = Part.find_or_initialize_by(code: part_from_api['codParte'])

      unless part.persisted?
        part.name = part_from_api['nomParte']
        part.save
      end

      TrialPart.create(
        trial: @trial, 
        part: part, 
        proxy_year: part_from_api['anoProcInt'],
        proxy_number: part_from_api['numProcInt']
      )

      extract_lawyers(part, part_from_api['listaAdvogadoOuProcuradorParte'])
    end
  end

  def extract_lawyers(part, lawyers_from_api)
    lawyers_from_api.each do |lawyer_from_api|
      lawyer = Lawyer.find_or_initialize_by(name: lawyer_from_api['nome'])

      part.lawyers << lawyer
    end
  end
end