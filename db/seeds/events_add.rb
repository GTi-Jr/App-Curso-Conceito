#rake db:seed:events_add
for i in 0..0
  events = Event.new do |event|

    event.name = "Estudar #{i}"
    event.event_hour_start = Time.zone.parse("16:00:00")
    event.event_hour_end = Time.zone.parse("17:00:00")
    event.user_id = 70
  end
  if events.save
    Rails.logger.info "#{i} foi adicionado"
  else
    Rails.logger.info "Não foi possível adicionar #{i}. Erros:\n\t #{events.errors.full_messages}"
  end
end


 #<Event id: nil, name: nil, event_hour_start: nil, event_hour_end: nil, event_week: ["{\"mo\"=>0, \"tu\"=>0, \"we\"=>0, \"th\"=>0, \"fr\"=>0, \"sa\"=>0, \"su\"=>0}"], created_at: nil, updated_at: nil, user_id: nil>
