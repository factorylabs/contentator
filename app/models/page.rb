class Page < ActiveRecord::Base
  TEMPLATES = ['content', 'home']

  acts_as_tree :order => 'position'
  has_permalink :title, :slug, :scope => :parent_id
  
  has_many :page_content_blocks, :order => :position

  validates_presence_of :title
  validates_length_of :title, :within => 1..255, :message => 'must have a length between 1 and 255 characters'
  validates_presence_of :slug
  validates_uniqueness_of :slug, :scope => :parent_id, :message => 'must be unique, slug already taken'   
  validates_length_of :slug, :within => 1..255, :message => 'must have a length between 1 and 255 characters'       
  validates_format_of :slug, :with => /^[a-z\d\-]+$/, :message => 'can only contain lowercase letters, numbers and dashes'
  validates_associated :parent

  before_save :create_full_path
  before_save :check_parent

  named_scope :ordered, :order => :position
  named_scope :visible, :conditions => "visible = 1"
  
  def self.find_from_path(path)
    path = path.join("/")
    page = path.blank? ? Page.home_page : find_by_path(path)
  end

  def self.home_page
    Page.find(1)
  end  

  def destroy
    if self == Page.home_page
      self.errors.add_to_base 'Cannot delete home page.'
      return
    end
    unless self.children.empty?
      self.errors.add_to_base 'Cannot delete page with children. Please delete children first.'
      return
    end
    super
  end

  protected
  def check_parent
    return if self.id == 1
    self.parent_id = 1 if self.parent_id.nil?
  end
  
  #Creates a URI path based on the Page tree
  def create_full_path
    return if self.id == 1
    self.parent.reload if self.parent
    if parent_node = self.parent
      # Build URI Path
      path = "#{parent_node.path}/#{self.slug}"
      # strip leading space, if there is one...
      path = path[1..-1] if path.starts_with? "/"
      self[:path] = path || ""
    else
      self[:path] = self.slug
    end
  end
end