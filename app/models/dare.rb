class Dare < ActiveRecord::Base

  attr_accessible  :text, :daree

  belongs_to :owner
  belongs_to :dared_user

  validates :text, presence: true

  def daree=(args)
    User.create!(nickname: args["nickname"])
  end
end
