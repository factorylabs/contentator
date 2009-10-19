gem 'contentator'
gem 'kete-tiny_mce', :lib => 'tiny_mce'
gem 'thoughtbot-shoulda', :lib => 'shoulda'
gem 'thoughtbot-factory_girl', :lib => 'factory_girl'
gem 'haml'
gem 'mocha'
gem 'paperclip'

run "sudo rake gems:install"

puts "    Installing plugins"
plugin 'acts_as_tree', :git => 'git://github.com/rails/acts_as_tree.git'
plugin 'permalink_fu', :git => 'git://github.com/technoweenie/permalink_fu.git'

puts "    Applying contentator templates to project"
generate :contentator_files