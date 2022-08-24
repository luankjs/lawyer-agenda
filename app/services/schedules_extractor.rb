require "http"

class SchedulesExtractor
  API_URL = 'https://aplicacao7.tst.jus.br/pautaws/rest/pautas'

  def initialize()
    # initialize
  end

  def call
    response = HTTP.get(API_URL)
    schedules = response.parse
  end
end