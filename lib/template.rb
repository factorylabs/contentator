run "rm public/index.html"

puts "    Installing plugins"
plugin 'acts_as_tree', :git => 'git://github.com/rails/acts_as_tree.git'
plugin 'permalink_fu', :git => 'git://github.com/technoweenie/permalink_fu.git'

puts "    Applying contentator templates to project"
generate :contentator_files