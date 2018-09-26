class Api::TweetsController < ApplicationController
  def index
    render json: TwitterClient.timeline
  end

  def create
    TwitterClient.tweet(params[:tweet])
  end

  def search
    # /api/search?term=justin%20bieber
    render json: TwitterClient.by_user(params[:term])
  end
end
