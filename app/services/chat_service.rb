require 'openai'

class ChatService
  def initialize
    @client = OpenAI::Client.new
  end

  def chat(message)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: message }],
        n: 5,  # Number of recommendations to generate
        temperature: 0.7
      }
    )
    response['choices'].first['message']['content']
  end
end
