module EventsHelper
  def price(event)
    event.free? ? 'Free' : number_to_currency(event.price)
  end

  def event_date(event)
    event.start_at.strftime('%B %d at %I:%M %P')
  end
end
