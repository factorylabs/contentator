- form_tag sort_cms_admin_<%= table_name %>_path, :id => 'sort_form', :onsubmit => 'getPcbInputs();' do
  = submit_tag "Sort"
  = hidden_field_tag :page_id, @page.id
  %br 

- <%= class_name %>.all.each do |<%= file_name %>|
  = render :partial => 'cms/content/<%= file_name %>', :locals => {:<%= file_name %> => <%= file_name %>}