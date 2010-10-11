require 'spec_helper'

describe Recipient do
  it "should create a new instance given valid attributes" do
    Factory.create(:recipient).reload.should_not be_new_record
  end

  it "has many statements" do
    Factory.build(:recipient).should respond_to(:statements)
  end


  describe "validations" do
    it "requires the presence of a name" do
      recipient = Factory.build(:recipient, :name => nil)
      recipient.should_not be_valid
      recipient.errors.on(:name).should include("can't be blank")
    end
  end
end
