class LineItemsController < ApplicationController

  before_filter :get_statement

  def create
    @line_item = @statement.line_items.build(params[:line_item])
    if @line_item.save
      flash[:notice] = "Line Item saved."
      redirect_to statement_path(@statement)
    else
      flash[:notice] = "Line Item was not saved."
      redirect_to statement_path(@statement)
    end
  end

  def destroy
    @line_item = @statement.line_items.find(params[:id])
    @line_item.destroy
    flash[:notice] = "Line Item was destroyed."
    redirect_to statement_path(@statement)
  end

  protected

  def get_statement
    @statement = Statement.find(params[:statement_id])
  end
end
