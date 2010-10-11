class Statement < ActiveRecord::Base

  belongs_to :recipient
  has_many   :line_items

  validates_presence_of :number

  before_create :create_recipient

  attr_accessor :recipient_attributes

  def recipient_name
    recipient ? recipient.name : ""
  end

  protected

  def create_recipient
    recipient = Recipient.create(recipient_attributes)
    self.recipient = recipient
  end

end
