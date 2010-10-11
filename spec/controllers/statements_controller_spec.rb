require 'spec_helper'

describe StatementsController do
  describe "#index" do
    it "renders a template" do
      get :index
      response.should render_template("statements/index")
    end

    it "assigns a variable to statements" do
      get :index
      assigns(:statements).should_not be_nil
    end
  end

  describe "#create" do
    before(:each) do
      @statement = mock_model(Statement, :save => true)
      Statement.stub!(:new).and_return(@statement)
    end

    describe "with valid attributes" do

      it "saves the record" do
        @statement.should_receive(:save).and_return(true)
        post :create, :statement => { }
      end

      it "redirects to the show action" do
        post :create, :statement => { }
        response.should redirect_to(statement_path(@statement))
      end
    end

    describe "with invalid attributes" do
      it "does not save the record" do
        @statement.should_receive(:save).and_return(false)
        post :create, :statement => { }
      end

      it "renders the new form" do
        @statement.should_receive(:save).and_return(false)
        post :create, :statement => { }
        response.should render_template("statements/new")
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      @statement = mock_model(Statement)
      Statement.stub!(:find).with(@statement.to_param).and_return(@statement)
    end

    it "destroys the record" do
      @statement.should_receive(:destroy)
      delete :destroy, :id => @statement.to_param
    end

    it "redirects to the index action" do
      @statement.should_receive(:destroy)
      delete :destroy, :id => @statement.to_param
      response.should redirect_to(statements_path)
    end
  end

  describe "#edit" do
    before(:each) do
      @statement = mock_model(Statement)
      Statement.stub!(:find).with(@statement.to_param).and_return(@statement)
    end

    it "finds a record" do
      Statement.should_receive(:find).with(@statement.to_param).and_return(@statement)
      get :edit, :id => @statement.id
    end

    it "renders a template" do
      get :edit, :id => @statement.id
      response.should render_template("statements/edit")
    end
  end

  describe "#new" do
    it "renders a template" do
      get :new
      response.should render_template("statements/new")
    end

    it "assigns a variable for forms" do
      get :new
      assigns(:statement).should_not be_nil
    end
  end

  describe "#show" do
    before(:each) do
      @statement = mock_model(Statement)
      Statement.stub!(:find).with(@statement.to_param).and_return(@statement)
    end

    it "finds a record" do
      Statement.should_receive(:find).with(@statement.to_param).and_return(@statement)
      get :show, :id => @statement.id
    end

    it "renders a template" do
      get :show, :id => @statement.to_param
      response.should render_template("statements/show")
    end
  end

  describe "#update" do
    before(:each) do
      @statement = mock_model(Statement)
      Statement.stub!(:find).with(@statement.to_param).and_return(@statement)
    end

    describe "with valid attributes" do
      before(:each) do
        @statement.stub!(:update_attributes).and_return(true)
      end

      it "finds a record" do
        Statement.should_receive(:find).with(@statement.to_param).and_return(@statement)
        put :update, :id => @statement.id
      end

      it "updates a record" do
        @statement.should_receive(:update_attributes).and_return(true)
        put :update, :id => @statement.id
      end

      it "redirects to the show action" do
        put :update, :id => @statement.id
        response.should redirect_to(statement_path(@statement))
      end
    end

    describe "with invalid attributes" do
      before(:each) do
        @statement.stub!(:update_attributes).and_return(false)
      end

      it "finds a record" do
        Statement.should_receive(:find).with(@statement.to_param).and_return(@statement)
        put :update, :id => @statement.id
      end

      it "does not update the record" do
        @statement.should_receive(:update_attributes).and_return(false)
        put :update, :id => @statement.id
      end

      it "renders the edit action" do
        put :update, :id => @statement.id
        response.should render_template("statements/edit")
      end
    end
  end
end
