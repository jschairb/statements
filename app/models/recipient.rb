class Recipient < ActiveRecord::Base

  validates_presence_of :name

  has_many :statements

end
