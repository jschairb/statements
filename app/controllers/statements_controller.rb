class StatementsController < ApplicationController

  def index
    @statements = Statement.all
  end

  def create
    @statement = Statement.new(params[:statement])
    if @statement.save
      flash[:notice] = "Statement saved."
      redirect_to statement_path(@statement)
    else
      render :action => "new"
    end
  end

  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy
    redirect_to statements_path
  end

  def edit
    @statement = Statement.find(params[:id])
  end

  def new
    @statement = Statement.new
  end

  def show
    @statement = Statement.find(params[:id])
  end

  def update
    @statement = Statement.find(params[:id])
    if @statement.update_attributes(params[:statement])
      flash[:notice] = "Statement was updated."
      redirect_to statement_path(@statement)
    else
      render :action => "edit"
    end
  end

end
