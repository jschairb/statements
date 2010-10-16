class LineItem < ActiveRecord::Base

  belongs_to :statement

  validates_presence_of :description, :price, :quantity, :statement

  before_save :calculate_cost
  after_create  :add_to_statement_total
  after_destroy :subtract_from_statement_total

  protected

  def add_to_statement_total
    statement.total_cost = statement.total_cost += cost
    statement.save
  end

  def calculate_cost
    self.cost = (price * quantity).round(2)
  end

  def subtract_from_statement_total
    statement.total_cost = statement.total_cost -= cost
    statement.save
  end

end
