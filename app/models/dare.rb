class Dare < ActiveRecord::Base

  attr_accessible  :text, :daree

  belongs_to :owner
  belongs_to :dared_user

  def daree(args)
  end

  def daree=(args)
  end

end
