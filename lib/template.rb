gem 'contentator'
gem 'kete-tiny_mce', :lib => 'tiny_mce'
gem 'thoughtbot-shoulda', :lib => 'shoulda'
gem 'thoughtbot-factory_girl', :lib => 'factory_girl'
gem 'haml',
gem 'mocha',

run "rake gems:install"

puts "    Installing plugins"
plugin(acts_as_tree)
plugin(paperclip)
plugin(permalink_fu)

puts "    Applying contentator templates to project"
generate :contentator_files