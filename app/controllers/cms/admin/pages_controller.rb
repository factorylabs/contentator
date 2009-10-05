class Cms::Admin::PagesController < Cms::Admin::AdminController

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @pages = Page.all_except_home
  end

  def edit
    @page = Page.find(params[:id])
    @pages = Page.all_except_home
  end

  def create
    @page = Page.new(params[:page])
    @pages = Page.all_except_home

    if @page.save
      flash[:notice] = 'Page was successfully created.'
      redirect_to(admin_pages_path)
    else
      render :action => "new"
    end
  end

  def update
    @page = Page.find(params[:id])
    @pages = Page.all_except_home

    if @page.update_attributes(params[:page])
      params[:frontend] ? redirect_to( content_path(@page.path) )  : redirect_to( admin_pages_path )
    else
      render :action => "edit"
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pages_url) }
    end
  end

  # def update_page_tree
  #   @hash = JSON.parse params[:tree]
  #   save_tree(@hash['tree_main'] || @hash['tree_sub'], nil)
  #   render :nothing => true, :layout => false
  # end

  private

  # saves the tree structure and positions when updated
  # def save_tree(nodes, parent_id = 0)
  #   position = 0
  #   nodes.each do |node|
  #     temp = Page.update(node['id'].to_i, {:position => position, :parent_id => parent_id}).save
  #     puts "id: #{node['id']}, parent_id: #{parent_id}, position: #{position += 1}: saved: #{temp}"
  #     save_tree(node['children'], node['id']) if node["children"]
  #   end
  # end
end
