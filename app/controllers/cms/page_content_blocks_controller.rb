class Cms::Admin::PageContentBlocksController < ApplicationController

  uses_tiny_mce :options => { 
    :width => 390,
    :theme => 'advanced',
    :theme_advanced_buttons1 => "bold,italic,underline,bullist,numlist,link,unlink", 
    :theme_advanced_disable => "anchor,blockquote,outdent,indent,image,cleanup,help,code,separator,hr,undo,quote,removeformat,formatselect,fontselect,fontsizeselect,styleselect,sub, sup,forecolor, backcolor, forecolorpicker, backcolorpicker, charmap, visualaid,redo"
  }
    
  def new
    @page = Page.find(params[:page_id])
    @page_content_block = @page.page_content_blocks.new
    render :partial => 'cms/admin/page_content_blocks/form'  
  end

  def edit
    @page_content_block = PageContentBlock.find(params[:id])
    @page = Page.find(@page_content_block.page_id)
    render :partial => 'cms/admin/page_content_blocks/form'  
  end

  def create
    @page = Page.find(params[:page_id])
    @page_content_block = @page.page_content_blocks.new(params[:page_content_block])

    if @page_content_block.save
      render :partial => 'cms/content/page_content_blocks_container'  
    else    
      render :partial => 'cms/admin/page_content_blocks/form'  
    end
  end

  def update
    @page_content_block = PageContentBlock.find(params[:id])
    @page = Page.find(@page_content_block.page_id)
    
    @page_content_block.photo = nil if params[:remove_image]   

    if @page_content_block.update_attributes(params[:page_content_block])
      render :partial => 'cms/content/page_content_blocks_container'  
    else
      render :partial => 'cms/admin/page_content_blocks/form'  
    end  
  end

  def destroy
    @page_content_block = PageContentBlock.find(params[:id])
    @page = Page.find(@page_content_block.page_id)
    @page_content_block.destroy
      render :partial => 'cms/content/page_content_blocks_container'  
  end

  def sort
    @page = Page.find(params[:page_id])

    if params[:page_content_blocks]
      params[:page_content_blocks].each do |k,v|
        page_content_block = @page.page_content_blocks.find(k)
        page_content_block.update_attributes(:position => v)
      end
    end
    redirect_to content_path(@page.path) 
  end
end
