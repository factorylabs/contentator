require File.join(File.dirname(__FILE__), '../../..', 'test_helper')

class Cms::Admin::PageContentBlocksControllerTest < ActionController::TestCase

  def setup
    @page_content_block = Factory(:page_content_block)
    @page = Page.find(@page_content_block.page_id)
  end

  should "route" do
    assert_recognizes(
      {:controller => "cms/admin/page_content_blocks", :action => 'index'},
      {:path => '/admin/page_content_blocks', :method => :get}
    )
    assert_recognizes(
      {:controller => "cms/admin/page_content_blocks", :action => 'sort'},
      {:path => '/admin/page_content_blocks/sort', :method => :get}
    )
    assert_equal('/admin/page_content_blocks',  cms_admin_page_content_blocks_path())
  end
      
  context "on POST to :new" do
    setup do
      post :new, :page_id => @page.id
    end
  
    should_assign_to :page
    should_assign_to :page_content_block
    should_render_template :form
    should_respond_with :success
  end

  context "on GET to :edit" do
    setup { get :edit, :id => @page_content_block.id }
    
    should_assign_to :page
    should_assign_to :page_content_block
    should_render_template :form
    should_respond_with :success
  end

  context "stubbed valid page_content_block" do
    setup do
      PageContentBlock.any_instance.stubs(:valid?).returns(true)
    end
  
    context "on POST to :create" do
      setup do
        post :create, :page_content_block => Factory.attributes_for(:page_content_block), :page_id => @page.id
      end
  
      should_change('the number of page content blocks', :by => 1 ) { PageContentBlock.count }
      should_assign_to :page
      should_assign_to :page_content_block
      should_render_template :page_content_blocks_container
      should_respond_with :success
  
      should "save to db" do
        assert !assigns(:page_content_block).new_record?
      end
    end
  
    context "on PUT to :update" do
      setup do
        put :update, :id => @page_content_block.id, :page_content_block => { :title => 'new title' }
      end
      
      should_assign_to :page
      should_assign_to :page_content_block
      should_render_template :page_content_blocks_container
      should_respond_with :success
      should_change('page_content_block updated' ) { @page_content_block.reload.updated_at }
    end
  end
  
  context "stubbed invalid page" do
    setup do
      PageContentBlock.any_instance.stubs(:valid?).returns(false)
    end
  
    context "on POST to :create" do
      setup do
        post :create, :page_content_block => Factory.attributes_for(:page_content_block), :page_id => @page.id
      end
  
      should_not_change('the number of page_content_blocks') {PageContentBlock.count}
      should_assign_to :page
      should_assign_to :page_content_block
      should_render_template :form
      should_respond_with :success
  
      should "not save to db" do
        assert assigns(:page_content_block).new_record?
      end
    end
  
    context "on PUT to :update" do
      setup do
        put :update, :id => @page_content_block.id, :page_content_block => { :updated_at => Time.now  }
      end
  
      should_not_change('page_content_block updated' ) { PageContentBlock.find(@page_content_block.id).updated_at }
      should_assign_to :page
      should_assign_to :page_content_block
      should_render_template :form
      should_respond_with :success
    end
  end

  context "on DELETE to :destroy" do
    setup { get :destroy, :id => @page_content_block.id }
    
    should_change('the number of page content blocks', :by => -1 ) { PageContentBlock.count }
    should_assign_to :page
    should_assign_to :page_content_block
    should_render_template :page_content_blocks_container
    should_respond_with :success
  end
end
