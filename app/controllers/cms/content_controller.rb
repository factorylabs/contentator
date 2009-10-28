class Cms::ContentController < ApplicationController 

  def show
    @page = Page.find_from_path(params[:path])

    if @page
puts @page.inspect
puts @page.title.inspect
puts @page.template_name

      render :action => @page.template_name
    else
      respond_to do |format|
        format.all { render :file => "#{RAILS_ROOT}/public/404.html", :status => 404  }
      end
    end
  end
  
  private
  def home
  end

  def content
  end
end