class PagesController < ApplicationController
  def index
    @pages = Page.find(:all)
  end

  def show
    @page = Page.find(params[:id].to_i)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.save!
    flash[:notice] = 'Page saved'
    redirect_to :action => 'index'
    rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
