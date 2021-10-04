module RegistrationsHelper
  def register_or_sold_out(event)
    if event.sold_out?
      content_tag(:span, 'Sold out sorry.', class: 'text-sm text-gray-300')
    else
      link_to 'Regist Event',
              new_event_registration_path(event),
              class: 'text-sm text-white'
    end
  end
end
