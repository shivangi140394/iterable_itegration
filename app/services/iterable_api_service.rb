require 'httparty'

class IterableApiService
  include HTTParty
  base_uri 'https://api.iterable.com'

  def self.create_event_a(user_id)
    response = self.iterable_post("/events/track", body: { userId: user_id, eventType: 'EventA' }.to_json, headers: { 'Content-Type' => 'application/json' })
    response.success? # Return true or false based on the API response
  end

  def self.create_event_b(user_id)
    response = self.iterable_post("/events/track", body: { userId: user_id, eventType: 'EventB' }.to_json, headers: { 'Content-Type' => 'application/json' })

    response.success?
  end

  def self.send_email_notification(user_id, event_type)
    if event_type == 'EventB'
      response = self.iterable_post("/email/target", body: { userId: user_id, templateId: 'event_b_template' }.to_json, headers: { 'Content-Type' => 'application/json' })
      response.success? # Return true or false based on the API response
    else
      false
    end
  end

  private

  def self.iterable_post(url, options = {})
    options[:headers] ||= {}
    options[:headers]['Api-Key'] = ENV['ITERABLE_API_KEY']
    # options[:headers]['Api-Key'] = "2cLu78fcBTGtI7PKswkD6N5Ig6c"
    self.post(url, body: options[:body], headers: options[:headers])
  end
end

