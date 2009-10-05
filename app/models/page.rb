class Page < ActiveRecord::Base
  acts_as_tree :order => 'position'
  has_permalink :title, :slug, :scope => :parent_id

  validates_presence_of :title
  validates_length_of :title, :within => 1..255, :message => 'must have a length between 1 and 255 characters'
            
  validates_presence_of :slug
  validates_uniqueness_of :slug, :scope => :parent_id, :message => 'must be unique, slug already taken'   
  validates_length_of :slug, :within => 1..255, :message => 'must have a length between 1 and 255 characters'       
  validates_format_of :slug, :with => /^[a-z\d\-]+$/, :message => 'can only contain lowercase letters, numbers and dashes'
  validates_associated :parent

  before_save :create_full_path
  # after_save :update_children_full_path
  
  def self.find_from_path(path)
    is_404 = false
    path = path.join("/")
    page = path.blank? ? Page.home_page : find_by_path(path)
    if page.nil?
      is_404 = true
      page = Page.home_page
    end
    [page, is_404]
  end

  def self.home_page
    Page.find(1)
  end  

  def destroy
    unless self.children.empty?
      self.errors.add_to_base 'Cannot delete page with children. Please delete children first.'
      return
    end
    super
  end

  protected
  #Creates a URI path based on the Page tree
  def create_full_path
    self.parent.reload if self.parent
    if parent_node = self.parent
      # Build URI Path
      # puts "#{self.title}'s parent's path = #{parent_node.path}"
      path = "#{parent_node.path}/#{self.slug}"
      # strip leading space, if there is one...
      path = path[1..-1] if path.starts_with? "/"
      self[:path] = path || ""
    else
      self[:path] = self.slug
    end
  end
  
#   # Updates all this content's child URI paths
#   def update_children_full_path
# puts 'wtf'
#     self.children.each do |child|
# puts child.inspect
#       child.create_full_path
#       child.save
# puts child.inspect
#       child.update_children_full_path
#     end
#   end

end