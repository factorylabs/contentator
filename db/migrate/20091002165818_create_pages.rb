class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string      :title, :limit => 100  
      t.string      :subtitle, :limit => 100  
      t.string      :slug, :limit => 100
      t.string      :path
      t.string      :template_name
      t.integer     :position
      t.integer     :parent_id
      t.boolean     :visible
      t.boolean     :in_navigation
      t.timestamps
    end
  end 

  def self.down
    drop_table :pages
  end
end
