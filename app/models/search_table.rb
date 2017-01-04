class SearchTable < ApplicationRecord
	
	def self.searchcategory(options = {})
	category_suggestions = Category.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	category_suggestions.any? ? category_suggestions : false
	
	end

	def self.searchsub_category(options = {})
	  sub_category_suggestions = SubCategory.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	  sub_category_suggestions.any? ? sub_category_suggestions : false
	
	end

	def self.searchUsers(options = {})
	  users_suggestions = User.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)

	  users_suggestions.any? ? users_suggestions : false
	
	end
end
