class ContentatorGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      puts "manifesting this here generator"
    end
  end  
end