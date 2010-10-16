require 'spec_helper'

describe LineItemsController do

  before(:each) do
    @statement = mock_model(Statement)
    Statement.stub!(:find).and_return(@statement)
  end

  describe "#create" do
    before(:each) do
      @line_item = mock_model(LineItem, :save => true)
      @line_items = mock("line_items", :build => @line_item)
      @statement.stub!(:line_items).and_return(@line_items)
    end

    describe "with valid attributes" do
      it "creates a record" do
        @line_item.should_receive(:save).and_return(true)
        post :create, :statement_id => @statement.to_param, :line_item => { }
      end

      it "renders a flash message" do
        post :create, :statement_id => @statement.to_param, :line_item => { }
        flash[:notice].should == "Line Item saved."
      end

      it "redirects to the statement path" do
        post :create, :statement_id => @statement.to_param, :line_item => { }
        response.should redirect_to(statement_path(@statement.id))
      end
    end

    describe "without valid attributes" do
      it "redirects without creating a record" do
        @line_item.should_receive(:save).and_return(false)
        post :create, :statement_id => @statement.to_param, :line_item => { }
        response.should redirect_to(statement_path(@statement.id))
      end

      it "notifies via flash message that the record did not save" do
        @line_item.should_receive(:save).and_return(false)
        post :create, :statement_id => @statement.to_param, :line_item => { }
        flash[:notice].should == "Line Item was not saved."
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      @line_item = mock_model(LineItem, :destroy => nil)
      @line_items = mock("line_items", :find => @line_item)
      @statement.stub!(:line_items).and_return(@line_items)
    end

    it "destroys the line item" do
      @line_item.should_receive(:destroy).and_return(nil)
      post :destroy, :statement_id => @statement.to_param, :id => @line_item.to_param
    end

    it "notifies via flash message" do
      post :destroy, :statement_id => @statement.to_param, :id => @line_item.to_param
      flash[:notice].should == "Line Item was destroyed."
    end

    it "redirects to the statement path" do
      post :destroy, :statement_id => @statement.to_param, :id => @line_item.to_param
      response.should redirect_to(statement_path(@statement))
    end

  end

end
