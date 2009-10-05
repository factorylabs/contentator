require File.join(File.dirname(__FILE__), '../../..', 'test_helper')

class Cms::Admin::PagesControllerTest < ActionController::TestCase
  context "page controller" do
    setup do
      @home_page = Factory(:page, :id => 1, :slug => 'home', :path => 'home', :template_name => 'home')
      @page = Factory(:page)
    end

    should "route" do
      assert_recognizes(
        {:controller => "cms/admin/pages", :action => 'index'},
        {:path => '/admin/pages', :method => :get}
      )
      assert_equal('/admin/pages',  cms_admin_pages_path())
    end

    context "on GET to :index" do
      setup { get :index }
    
      should_assign_to :pages
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end
    # 
    # context "on GET to :show" do
    #   setup { get :show, :id => @page.id }
    # 
    #   should_assign_to :page
    #   should_respond_with :success
    #   should_render_template 'admin/pages/show'
    #   should_not_set_the_flash
    # end
    # 
    # context "on GET to :new" do
    #   setup { get :new }
    # 
    #   should_assign_to :page
    #   should_respond_with :success
    #   should_render_template 'admin/pages/new'
    # end
    # 
    # context "on GET to :edit" do
    #   setup { get :edit, :id => @page.id }
    # 
    #   should_assign_to :page
    #   should_respond_with :success
    #   should_render_template 'admin/pages/edit'
    # end
    # 
    # context "stubbed valid page" do
    #   setup do
    #     Page.any_instance.stubs(:valid?).returns(true)
    #   end
    # 
    #   context "on POST to :create" do
    #     setup do
    #       post :create, :page => Factory.attributes_for(:page)
    #     end
    # 
    #     should_change 'Page.count', :by => 1
    #     should_assign_to :page
    #     should_redirect_to('admin_pages_path') { admin_pages_path }
    # 
    #     should "save to db" do
    #       assert !assigns(:page).new_record?
    #     end
    #   end
    # 
    #   context "on PUT to :update" do
    #     setup do
    #       put :update, :id => @page.id, :page => { :title => 'new title', :subtitle => 'here we are', :template_name => 'gallery' }
    #     end
    # 
    #     should_assign_to :page
    #     should_change '@page.reload.updated_at'
    #     should_redirect_to('admin_pages_path') { admin_pages_path }
    #   end
    # end
    # 
    # context "stubbed invalid page" do
    #   setup do
    #     Page.any_instance.stubs(:valid?).returns(false)
    #   end
    # 
    #   context "on POST to :create" do
    #     setup do
    #       post :create, :page => Factory.attributes_for(:page)
    #     end
    # 
    #     should_not_change 'Page.count'
    #     should_assign_to :page
    #     should_render_template 'admin/pages/new'
    # 
    #     should "not save to db" do
    #       assert assigns(:page).new_record?
    #     end
    #   end
    # 
    #   context "on PUT to :update" do
    #     setup do
    #       put :update, :id => @page.id, :page => { :updated_at => Time.now }
    #     end
    # 
    #     should_not_change 'Page.find(@page.id).updated_at'
    #     should_assign_to :page
    #     should_render_template 'admin/pages/edit'
    #   end
    # end
    # 
    # context "on DELETE to :destroy" do
    #   setup { get :destroy, :id => @page.id }
    # 
    #   should_change 'Page.count', :by => -1
    #   should_assign_to :page
    #   should_redirect_to('admin_pages_path') { admin_pages_path }
    # end

    #context "on POST to update_page_tree" do
    #  setup do
    #    post :update_page_tree,
    #      :tree => {'tree_main':[{'id':'#{@news_page.id}', 'children':[{'id':'#{@child_page.id}'},{'id':'#{@page.id}'}]}]}
    #  end
    #
    #  should_assign_to :hash
    #  #should_redirect_to('admin_pages_path') { admin_pages_path }
    #
    #  should "sort tree" do
    #    assert_equal 1, @news_page.reload.position
    #    assert_equal 1, @child_page.reload.position
    #    assert_equal 2, @page.reload.position
    #    assert_equal @news_page.id, @child_page.reload.parent_id
    #    assert_equal @news_page.id, @page.reload.parent_id
    #  end
    #end
  end
end

