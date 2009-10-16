class ContentatorGenerator < Rails::Generator::Base
puts "running"
  def manifest
    record do |m|
      

      puts "manifesting this here generator"
    end
  end  
end