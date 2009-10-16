class ContentatorFilesGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      #copy all the cms files into the new project
      m.directory('app/controllers/cms/admin')      

      m.file "../../../app/controllers/application_controller.rb", "app/controllers/application_controller.rb"
      m.file "../../../app/controllers/application_controller.rb", "app/controllers/application_controller.rb"
      m.file "../../../app/controllers/cms/content_controller.rb", "app/controllers/cms/content_controller.rb"
      m.file "../../../app/controllers/cms/admin/admin_controller.rb", "app/controllers/cms/admin/admin_controller.rb"
      m.file "../../../app/controllers/cms/admin/page_content_blocks_controller.rb", "app/controllers/cms/admin/page_content_blocks_controller.rb"
      m.file "../../../app/controllers/cms/admin/pages_controller.rb", "app/controllers/cms/admin/pages_controller.rb"
      m.file "../../../app/helpers/application_helper.rb", "app/helpers/application_helper.rb"
      m.file "../../../app/helpers/cms/admin/pages_helper.rb", "app/helpers/cms/admin/pages_helper.rb"
      m.file "../../../app/models/page.rb", "app/models/page.rb"
      m.file "../../../app/models/page_content_block.rb", "app/models/page_content_block.rb"

      m.directory('app/views/cms/content')      
      m.directory('app/views/cms/admin')      
      m.directory('app/views/cms/admin/page_content_blocks')      
      m.directory('app/views/cms/admin/pages')      
      m.directory('app/views/layouts/cms/admin/pages')      

      m.file "../../../app/views/cms/admin/_admin_toolbar.html.haml", "app/views/cms/admin/_admin_toolbar.html.haml"
      m.file "../../../app/views/cms/admin/page_content_blocks/_form.html.haml", "app/views/cms/admin/page_content_blocks/_form.html.haml"
      m.file "../../../app/views/cms/admin/pages/_form.html.haml", "app/views/cms/admin/pages/_form.html.haml"
      m.file "../../../app/views/cms/admin/pages/edit.html.haml", "app/views/cms/admin/pages/edit.html.haml"
      m.file "../../../app/views/cms/admin/pages/index.html.haml", "app/views/cms/admin/pages/index.html.haml"
      m.file "../../../app/views/cms/admin/pages/new.html.haml", "app/views/cms/admin/pages/new.html.haml"
      m.file "../../../app/views/cms/content/_page_content_block.html.haml", "app/views/cms/content/_page_content_block.html.haml"
      m.file "../../../app/views/cms/content/_page_content_blocks_container.html.haml", "app/views/cms/content/_page_content_blocks_container.html.haml"
      m.file "../../../app/views/cms/content/content.html.haml", "app/views/cms/content/content.html.haml"
      m.file "../../../app/views/cms/content/home.html.haml", "app/views/cms/content/home.html.haml"
      m.file "../../../app/views/layouts/application.html.haml", "app/views/layouts/application.html.haml"
      m.file "../../../app/views/layouts/cms/admin/application.html.haml", "app/views/layouts/cms/admin/application.html.haml"

      m.file "../../../db/migrate/20091002165818_create_pages.rb", "db/migrate/20091002165818_create_pages.rb"
      m.file "../../../db/migrate/20091002211930_create_home_page.rb", "db/migrate/20091002211930_create_home_page.rb"
      m.file "../../../db/migrate/20091007222703_create_page_content_blocks.rb", "db/migrate/20091007222703_create_page_content_blocks.rb"

      m.directory('public/images/admin_standard')      
      m.directory('public/images/icons')      

      m.file "../../../public/images/admin_standard/content-header-bg.png", "public/images/admin_standard/content-header-bg.png"
      m.file "../../../public/images/admin_standard/context-arrow.png", "public/images/admin_standard/context-arrow.png"
      m.file "../../../public/images/admin_standard/context-bg.png", "public/images/admin_standard/context-bg.png"
      m.file "../../../public/images/admin_standard/crumb-bg-current.gif", "public/images/admin_standard/crumb-bg-current.gif"
      m.file "../../../public/images/admin_standard/crumb-bg.gif", "public/images/admin_standard/crumb-bg.gif"
      m.file "../../../public/images/admin_standard/crumb-divide-current.gif", "public/images/admin_standard/crumb-divide-current.gif"
      m.file "../../../public/images/admin_standard/crumb-divide.gif", "public/images/admin_standard/crumb-divide.gif"
      m.file "../../../public/images/admin_standard/drawer-end.png", "public/images/admin_standard/drawer-end.png"
      m.file "../../../public/images/admin_standard/drawer-middle.png", "public/images/admin_standard/drawer-middle.png"
      m.file "../../../public/images/admin_standard/drawer-start.png", "../../../public/images/admin_standard/drawer-start.png"
      m.file "../../../public/images/admin_standard/form-error.png", "public/images/admin_standard/form-error.png"
      m.file "../../../public/images/admin_standard/input-background.gif", "public/images/admin_standard/input-background.gif"
      m.file "../../../public/images/admin_standard/shadow-bottom.png", "public/images/admin_standard/shadow-bottom.png"
      m.file "../../../public/images/admin_standard/shadow-right.png", "public/images/admin_standard/shadow-right.png"
      m.file "../../../public/images/admin_standard/subnavigation-bullet-1.png", "public/images/admin_standard/subnavigation-bullet-1.png"
      m.file "../../../public/images/admin_standard/subnavigation-bullet-2.png", "public/images/admin_standard/subnavigation-bullet-2.png"
      m.file "../../../public/images/admin_standard/tab-active-cap.png", "public/images/admin_standard/tab-active-cap.png"
      m.file "../../../public/images/admin_standard/tab-active.png", "public/images/admin_standard/tab-active.png"
      m.file "../../../public/images/admin_standard/tab-inactive-cap.png", "public/images/admin_standard/tab-inactive-cap.png"
      m.file "../../../public/images/admin_standard/tab-inactive.png", "public/images/admin_standard/tab-inactive.png"
      m.file "../../../public/images/icons/add.png", "public/images/icons/add.png"
      m.file "../../../public/images/icons/cancel.png", "public/images/icons/cancel.png"
      m.file "../../../public/images/icons/delete.png", "public/images/icons/delete.png"
      m.file "../../../public/images/icons/edit.png", "public/images/icons/edit.png"
      m.file "../../../public/images/icons/folder.png", "public/images/icons/folder.png"
      m.file "../../../public/images/icons/move.png", "public/images/icons/move.png"

      m.file "../../../public/stylesheets/admin_standard.css", "public/stylesheets/admin_standard.css"
      m.file "../../../public/stylesheets/application.css", "public/stylesheets/application.css"

      m.file "../../../test/functional/cms/admin/page_content_block_controller_test.rb", "test/functional/cms/admin/page_content_block_controller_test.rb"
      m.file "../../../test/functional/cms/admin/pages_controller_test.rb", "test/functional/cms/admin/pages_controller_test.rb"
      m.file "../../../test/functional/cms/content_controller_test.rb", "test/functional/cms/content_controller_test.rb"

      m.file "../../../test/unit/page_content_block_test.rb", "test/unit/page_content_block_test.rb"
      m.file "../../../test/unit/page_test.rb", "test/unit/page_test.rb"
    end
  end  
end