# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_messages
    messages = ''
    %w{ notice success warning error }.each do |type|
      messages += content_tag(:div,
        content_tag(:div, flash[type.to_sym] || flash.now[type.to_sym]),
        :class => type + ' message'
        ) if flash[type.to_sym] || flash.now[type.to_sym]
    end
    messages.blank? ? '' : content_tag(:div, messages, :class => 'flash-messages', :id => 'flash_messages')
  end
end
