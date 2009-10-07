Factory.define :page do |f|
  f.title                           'Page'
  f.subtitle                        'Welcome to the website'
  f.path                            'page'
  f.template_name                   'content'
  f.position                        17
  f.parent_id                       { Factory.next :parent_id }
  f.visible                         true
  f.in_navigation                   true
  f.updated_at                      '2009-04-01 12:00:00'
end

Factory.sequence :parent_id do |n|
  n
end