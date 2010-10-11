require 'spec_helper'

describe Statement do
  it "should create a new instance given valid attributes" do
    Factory.create(:statement).reload.should_not be_new_record
  end

  it "belongs to a recipient" do
    Factory.build(:statement).should respond_to(:recipient)
  end

  it "has many line items" do
    Factory.build(:statement).should respond_to(:line_items)
  end

  describe "validations" do
    it "requires the presence of a number" do
      statement = Factory.build(:statement, :number => nil)
      statement.should_not be_valid
      statement.errors.on(:number).should include("can't be blank")
    end
  end

  describe "#recipient_name" do
    it "returns the recipient.name" do
      statement = Factory.create(:statement, :recipient_attributes => { :name => 'Josiah'})
      statement.reload.recipient.should_not be_nil
      statement.recipient.name.should_not be_nil

      statement.recipient_name.should == statement.recipient.name
    end

    describe "without a recipient" do
      it "returns an empty string" do
        statement = Factory.create(:statement, :recipient_attributes => nil)
        statement.reload.recipient.should == nil

        statement.recipient_name.should == ""
      end
    end
  end

end
