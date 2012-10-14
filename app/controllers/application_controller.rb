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

  def create_dare attrs
      @dare = Dare.new(attrs)
      @dare.owner = current_user
      if @dare.save
        tweet_dare current_user, @dare.as_tweet
        redirect_to @dare
      else
        redirect_to root_path
        flash[:error] = "Something went wrong and our system chickened out when it was going to deliver your dare."
      end
  end

  def tweet_dare user, tweet
    client = user.twitter_client
    Thread.new { client.update(tweet) }
  end
end
