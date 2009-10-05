class CreateHomePage < ActiveRecord::Migration
  def self.up
    execute "INSERT INTO `pages` (id,title,template_name,slug,position,visible) VALUES (1,'Home', 'home','home',1,1)"
  end

  def self.down
    Page.find_by_id(1).destroy
  end
end
