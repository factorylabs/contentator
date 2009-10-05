require 'test_helper'

class PageTest < ActiveSupport::TestCase

  # Setup
  def setup
    @home_page = Factory(:page, :id => 1, :slug => 'home', :path => 'home')
    @page = Factory(:page)
    @child = Factory(:page, :title => 'Child', :parent_id => @page.id)
  end
  subject { @page }  
  
  # Database
  should_have_db_column :template_name, :type => :string
  should_have_db_column :title,         :type => :string
  should_have_db_column :subtitle,      :type => :string
  should_have_db_column :slug,          :type => :string
  should_have_db_column :path,          :type => :string
  should_have_db_column :position,      :type => :integer
  should_have_db_column :parent_id,     :type => :integer
  should_have_db_column :visible,       :type => :boolean
  should_have_db_column :in_navigation, :type => :boolean
  should_have_db_column :created_at,    :type => :datetime
  should_have_db_column :updated_at,    :type => :datetime
  
  # Relationships
  # should_have_many :page_content_blocks
  
  # Validations
  should_validate_presence_of :title
    
  # Factories
  # should_have_valid_factory :page

  should "find home page" do 
    home = Page.home_page
    assert_equal 1, home.id
    assert_equal 'home', home.slug
  end
  
  should "find a page with a path" do
    test_page, is_404 = Page.find_from_path(@page.path.split('/'))
    assert_equal @page, test_page
  end

  should "return home page, 404 if path not found" do
    page, is_404 = Page.find_from_path(['a', 'nonexistant', 'path'])
    assert is_404
  end

  should "not destroy if children" do 
    @page.destroy
    assert @page
    assert @page.errors.on_base.include?('Cannot delete page with children. Please delete children first.')
  end

  should "have parent slug in path" do
    new_page = Page.create(:title => 'new page', :parent_id => @page.id)
    assert_equal "#{@page.path}/#{new_page.slug}", new_page.path
  end
  
  # should "update children path" do
  #   new_page = Page.create(:title => 'new page', :parent_id => @page.id)
  #   assert_equal "#{@page.path}/#{new_page.slug}", new_page.path
  # 
  #   @page.title = 'new parent'
  #   @page.save
  #   assert_equal "new-parent/#{new_page.slug}", new_page.path
  # end
  
end