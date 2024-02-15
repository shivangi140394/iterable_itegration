class EventsController < ApplicationController
  before_action :authenticate_user! 

  def create_event_a
    user_id = current_user.id
    IterableApiService.create_event_a(user_id)
    render json: { message: 'Event A created successfully' }
  end

  def create_event_b
    user_id = current_user.id
    event_created = IterableApiService.create_event_b(user_id)
    if event_created
      email_sent = IterableApiService.send_email_notification(user_id, 'EventB')
      if email_sent
        render json: { message: 'Event B created successfully and email notification sent' }
      else
        render json: { message: 'Event B created successfully but email notification failed' }
      end
    else
      render json: { message: 'Failed to create Event B' }, status: :unprocessable_entity
    end
  end
end
