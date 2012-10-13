class Dare < ActiveRecord::Base

  attr_accessible  :text, :daree

  belongs_to :owner
  belongs_to :dared_user

  validates :text, presence: true

  def daree=(args)
    User.create!(nickname: args["nickname"])
  end

  # Public: Turn the dare into a tweet which can be submitted to twitter.
  #
  # Returns a string less than 140 characters long
  def as_tweet
    tweet ||= ""
    tweet.concat "I #dare "
    tweet.concat dared_user.present? ? "@" + dared_user.nickname : "#anyone"
    tweet.concat " to "
    tweet.concat text[0..((118 - tweet.length) - 1)]
    tweet.concat " http://some.url.com/dares/12345"
  end
end
