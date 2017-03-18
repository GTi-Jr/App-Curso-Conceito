#rake db:seed:lessons_add
for i in 0..100
  lessons = Lesson.new do |lesson|
    inicio = Faker::Time.forward(((1..8).to_a).sample, :morning)
    fim = inicio + 2.hours

    lesson.category_id = ((1..5).to_a).sample
    lesson.lesson_hour_start = inicio
    lesson.lesson_hour_end = fim

    lesson.teacher_id = ((1..4).to_a).sample
    lesson.limit = ((20..50).to_a).sample

  end
  if lessons.save
    Rails.logger.info "#{i} foi adicionado"
  else
    Rails.logger.info "Não foi possível adicionar #{i}. Erros:\n\t #{lessons.errors.full_messages}"
  end
end
