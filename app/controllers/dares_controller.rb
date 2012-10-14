class DaresController < ApplicationController
  def index
    @dare = Dare.new
  end

  def show
    @dare = fetch_dare
  end

  def create
    user = User.find_or_create!(params["dare"][:dared_user][:nickname])
    @dare = Dare.create({text: params["dare"]["text"], dared_user: user })
    @dare.save!

    if current_user && current_user.oauth_hash
      tweet_dare current_user.oauth_hash, @dare.as_tweet
    end

    render :show
  end

  private
  def tweet_dare oauth_hash, tweet
    client = Twitter::Client.new(oauth_hash)
    Thread.new { client.update(tweet) }
  end

  def fetch_dare
    Dare.find params[:id]
  end
end
