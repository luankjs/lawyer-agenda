class TrialsExtractor
  def initialize(adjudicating_part_code, year, schedule_number, session_kind)
    @adjudicating_part_code = adjudicating_part_code
    @year                   = year
    @schedule_number        = schedule_number
    @session_kind           = session_kind
  end

  def call
    # do stuff
  end

  private
    attr_reader :adjudicating_part_code, :year, :schedule_number, :session_kind
end