# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "contentator"
    gem.summary = %q{A lightweight cms that focuses on in place editing.}
    gem.description = %q{A lightweight cms that focuses on in place editing.}
    gem.email = "interactive@factorylabs.com"
    gem.homepage = "http://github.com/factorylabs/contentator"
    gem.authors = ["Factory Design Labs"]
    gem.add_dependency('haml', '>= 2.2.6')
    gem.files.exclude('.gitignore', 'pkg', 'vendor', 'public/javascripts', 'script')
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end