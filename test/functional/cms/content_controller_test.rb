require File.join(File.dirname(__FILE__), '../..', 'test_helper')

class Cms::ContentControllerTest < ActionController::TestCase

  def setup
    @home_page = Factory(:page, :id => 1, :slug => 'home', :path => 'home', :template_name => 'home')
    @page = Factory(:page)
  end
  
  should "route" do
    assert_recognizes(
      {:controller => "cms/content", :action => 'show', :path => ['anything']},
      {:path => '/anything', :method => :get}
    )
    assert_equal('/anything',  content_path('anything'))
  end

  context 'GET show' do
    setup { get :show, :path => [@page.path]}
    should_respond_with :success
    should_not_set_the_flash
    should("assign to @page") { assert_equal assigns(:page), @page }
    should_render_template :content
  end

  context 'GET 404' do
    setup { get :show, :path => ['nonexistant', 'path']}
    should_respond_with :missing
    should_not_set_the_flash
    should("assign to @is_404") { assert_equal assigns(:is_404), true }
    should_render_template '404'
  end
  
  context 'GET home' do
    setup do
      get :show, :path => [@home_page.path]
    end
    should_respond_with :success
    should_not_set_the_flash
    should("assign to @page") { assert_equal assigns(:page), @home_page }
    should_render_template :home
  end

end
