class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  protected
  def authenticated
    if current_user
      true
    else
      authenticate
      false
    end
  end

  def authenticate
    redirect_to "/auth/twitter"
  end

  def current_user
    if session[:uid]
      @current_user = User.find_by_uid(session[:uid])
    end
  end

  def create_dare args_hash
      user = User.find_or_create!(args_hash["dare"][:dared_user][:nickname])
      @dare = Dare.create({text: args_hash["dare"]["text"], dared_user: user })
      @dare.save!

      if current_user.oauth_hash
        @dare.owner = current_user
        @dare.save
        tweet_dare current_user, @dare.as_tweet
      end

      redirect_to @dare
  end

  def tweet_dare user, tweet
    client = user.twitter_client
    Thread.new { client.update(tweet) }
  end
end
