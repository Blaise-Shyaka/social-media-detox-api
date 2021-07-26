module RequestSpecHelper
  # Parse JSON response to ruby hash
  def parse_json
    JSON.parse(response.body)
  end
end
