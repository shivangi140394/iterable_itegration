require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET create_event_a' do
    it 'creates Event A and returns success message' do
      user = FactoryBot.create(:user) # Create a user using FactoryBot
      sign_in user # Sign in the user

      expect(IterableApiService).to receive(:create_event_a).with(user.id).and_return(true)
      
      get :create_event_a
      expect(response.body).to eq({ message: 'Event A created successfully' }.to_json)
    end
  end

  describe 'GET create_event_b' do
    it 'creates Event B and returns success message' do
      user = FactoryBot.create(:user) # Create a user using FactoryBot
      sign_in user # Sign in the user

      expect(IterableApiService).to receive(:create_event_b).with(user.id).and_return(true)
      
      get :create_event_b
      expect(response.body).to eq({ message: 'Event B created successfully' }.to_json)
    end
  end
end

