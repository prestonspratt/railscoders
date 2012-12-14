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
    @page = Page.find(params[:id].to_i)
  end

  def update
    @page = Page.find(params[:id].to_i)
    @page.attributes = params[:page]
    @page.save!
    flash[:notice] = "Page updated"
    redirect_to :action => 'index' #if successful go back to the index of all pages
    rescue #if an error is thrown
    render :action => 'edit' #go back to the edit page please and list my errors
  end

  def destroy
    @page = Page.find(params[:id].to_i)
    if @page.destroy
      flash[:notice] = "Page deleted"
      else
      flash[:error] = "There was a problem deleting the page"
    end
    redirect_to :action => 'index'
   end
end
