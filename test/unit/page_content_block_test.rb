require 'test_helper'

class PageContentBlockTest < ActiveSupport::TestCase

  # Setup
  def setup
    @page_content_block = Factory(:page_content_block)
    @page = Page.find(@page_content_block.page_id)
    @page_content_block2 = Factory(:page_content_block, :position => 2)
  end
  subject { @page_content_block }  
  
  # Database
  should_have_db_column :page_id,             :type => :integer
  should_have_db_column :title,               :type => :string
  should_have_db_column :text,                :type => :text
  should_have_db_column :position,            :type => :integer
  should_have_db_column :visible,             :type => :boolean
  should_have_db_column :photo_file_name,     :type => :string
  should_have_db_column :photo_content_type,  :type => :string
  should_have_db_column :photo_file_size,     :type => :integer
  should_have_db_column :created_at,          :type => :datetime
  should_have_db_column :updated_at,          :type => :datetime
  
  # Relationships
  should_belong_to :pages

  # Validations
    
end