class LineItem < ActiveRecord::Base

  belongs_to :statement

  validates_presence_of :description, :price, :quantity, :statement

  before_save :calculate_cost

  protected

  def calculate_cost
    self.cost = (price * quantity).round(2)
  end

end
