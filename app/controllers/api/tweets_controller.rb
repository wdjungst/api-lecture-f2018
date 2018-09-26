class Api::TweetsController < ApplicationController
  def index
    render json: TwitterClient.timeline
  end
end
