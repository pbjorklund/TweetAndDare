class User < ActiveRecord::Base
  attr_accessible :uid, :nickname

  has_one :auth
  has_many :owning_dares, :class_name => "Dare", :foreign_key => :owner_id
  has_many :received_dares, :class_name => "Dare", :foreign_key => :dared_user_id

  def twitter
  	auth.twitter
  end
end