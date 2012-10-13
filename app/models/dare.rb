class Dare < ActiveRecord::Base

  attr_accessible  :text, :daree

  belongs_to :owner
  belongs_to :dared_user

  def daree(args)
  end

  def daree=(args)
  end

  # Public: Turn the dare into a tweet which can be submitted to twitter.
  #
  # Returns a string less than 140 characters long
  def as_tweet
    tweet ||= ""
    tweet << "I #dare "
    tweet.concat dared_user.present? ? "@" + dared_user.nickname : "#anyone"
    tweet << " to "
    tweet << text[0..((118 - tweet.length) - 1)]
    tweet << " http://some.url.com/dares/12345"
  end

end
