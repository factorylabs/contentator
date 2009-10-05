class Cms::ContentController < ApplicationController 

  def show
    @page, @is_404 = Page.find_from_path(params[:path])

    if @is_404
      render :action => '404', :layout => true, :status => 404
    else
      render :action => @page.template_name if @page
    end
  end
  
  def home
  end

  def content
  end
end