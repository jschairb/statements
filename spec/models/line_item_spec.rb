require 'spec_helper'

describe LineItem do
  it "should create a new instance given valid attributes" do
    Factory.create(:line_item).reload.should_not be_new_record
  end

  it "belongs to a statement" do
    Factory.build(:line_item).should respond_to(:statement)
  end


  it "calculates the cost before saving" do
    line_item = Factory.build(:line_item)
    line_item.cost.should be_blank

    line_item.save.should == true
    line_item.cost.should_not be_blank
  end

  it "ensures the cost is only 2 digits" do
    line_item = Factory.create(:line_item)
    line_item.cost.should == 10.00
  end

  it "adds to the statement total when saved" do
    statement = Factory.create(:statement)
    statement.reload.total_cost.should == 0.0
    line_item = Factory.create(:line_item, :statement => statement)
    statement.reload.total_cost.should == line_item.cost
  end

  it "subtracts to the statement total when destroyed" do
    statement = Factory.create(:statement)
    line_item = Factory.create(:line_item, :statement => statement)
    statement.reload.line_items.should == [line_item]

    expected = (statement.reload.total_cost - line_item.cost)
    line_item.destroy
    statement.reload.total_cost.should == expected
  end

  describe "validations" do
    it "requires a description" do
      line_item = Factory.build(:line_item, :description => nil)
      line_item.should_not be_valid
      line_item.errors.on(:description).should include("can't be blank")
    end

    it "requires a statement" do
      line_item = Factory.build(:line_item, :statement => nil)
      line_item.should_not be_valid
      line_item.errors.on(:statement).should include("can't be blank")
    end

    it "requires a price" do
      line_item = Factory.build(:line_item, :price => nil)
      line_item.should_not be_valid
      line_item.errors.on(:price).should include("can't be blank")
    end

    it "requires a quantity" do
      line_item = Factory.build(:line_item, :quantity => nil)
      line_item.should_not be_valid
      line_item.errors.on(:quantity).should include("can't be blank")
    end

  end
end
