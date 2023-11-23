class GenerateImage
  def initialize(prompt)
    @prompt = prompt
  end

  def call
    client = OpenAI::Client.new
    puts '-' * 50
    puts 'Generating image...'
    puts '-' * 50
    response = client.images.generate(parameters: { model: 'dall-e-3', prompt: @prompt })
    p response.dig("data", 0, "url")
  end
end