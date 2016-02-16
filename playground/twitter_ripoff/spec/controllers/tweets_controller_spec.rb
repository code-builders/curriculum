require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe "GET index" do
    it "returns a status of 200" do
      get :index
      expect(response.status).to eq 200
    end
  end
  
end
