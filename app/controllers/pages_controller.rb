class PagesController < ApplicationController
  def index
  @pages = Page.find(:all)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
