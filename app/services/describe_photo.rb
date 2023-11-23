class DescribePhoto
  INSTRUCTIONS = <<~INSTRUCTIONS
  Please describe the facial and body features of a drawn character that looks like the person in the photo.
  The description should be detailed and include the gender, type of facial hair, ethnicity and other facial features.
  Only return the description, do not add any introduction or explanations to your answer.
  INSTRUCTIONS

  def initialize(photo_url)
    @photo_url = photo_url
  end

  def call
    client = OpenAI::Client.new
    messages = [
      { "type": "text", "text": INSTRUCTIONS },
      { "type": "image_url",
        "image_url": {
          "url": @photo_url,
        },
      }
    ]

    response = client.chat(
        parameters: {
            model: "gpt-4-vision-preview", # Required.
            messages: [{ role: "user", content: messages}], # Required.
            max_tokens: 2000,
        })
    p response.dig("choices", 0, "message", "content")
  end
end