class SearchTable < ApplicationRecord
	
	def self.searchcategory(options = {})

	category_suggestions = Category.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	category_suggestions.any? ? category_suggestions : false

	end

	def self.searchsubcategory(options = {})
	  subcategory_suggestions = Subcategory.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	  subcategory_suggestions.any? ? subcategory_suggestions : false
	end

	def self.search_contents(options = {})
	  search_contents = Content.joins(:subcategory).where("lower(contents.title) LIKE ? or lower(subcategories.name) LIKE ?", "#{options[:queryString]}%", "#{options[:queryString]}%").order('id DESC').limit(50)
	  search_contents.any? ? search_contents : false
	end

	def self.searchUsers(options = {})
	  users_suggestions = User.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	  users_suggestions.any? ? users_suggestions : false
	
	end
	def self.searchTeachers(options = {})
	  teachers_suggestions = Teacher.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	  teachers_suggestions.any? ? teachers_suggestions : false
	
	end
	def self.searchlesson(options = {})
	  lesson_suggestions = Lesson.joins(:subcategory,:teacher).where("lower(subcategories.name) LIKE ? OR lower(teachers.name) LIKE ?", "#{options[:queryString]}%", "#{options[:queryString]}%")

	  if options[:date_range].present?
        initial_date = Date.parse(options[:date_range].split('-')[0])
        end_date     = Date.parse(options[:date_range].split('-')[1])
        lesson_suggestions = Lesson.where(date_t: (initial_date..end_date))
      end

	  lesson_suggestions.any? ? lesson_suggestions.order('id DESC').limit(50) : false
	
	end
end
