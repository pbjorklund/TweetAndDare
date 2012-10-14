class Dare < ActiveRecord::Base

  attr_accessible :text, :state
  attr_accessible :owner, :dared_user
  attr_accessible :target

  belongs_to :owner, class_name: 'User'
  belongs_to :dared_user, class_name: 'User'

  validates :text, presence: {  message: "Can't leave this blank. We suggest: 'try Tweet And Dare'" }
  validates :target, format: { with: /^(@|#)[a-z1-9\_]{1,21}/i, message: "Only @mentions and #hashtags allowed" }
  validates :target, presence: { message: "Can't be blank. Dare a friend!" }

  acts_as_votable

  STATES = { :default => 0, :new => 0, :accepted => 1, :completed => 2, :failed => 3}

  def self.get_most_popular
    Dare.find(:all, order: 'cached_votes_total ASC').take(5)
  end

  # Public: Customized target setter
  #
  # Returns the target value
  def target=(val)
    if val
      if val.match(/^\@/)
        self.dared_user = User.find_or_initialize_by_nickname(nickname: val)
      end
    end
    self[:target] = val
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
    tweet.concat " http://tweetanddare.com/dares/#{id}"
  end
end
