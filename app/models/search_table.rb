class SearchTable < ApplicationRecord
	
	def self.searchcategory(options = {})
	  category_suggestions = Category.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)
	  category_suggestions.any? ? category_suggestions : false
	end

	def self.searchsub_category(options = {})
	  sub_category_suggestions = SubCategory.where("lower(name) LIKE ?", "#{options[:queryString]}%").limit(50)
	  sub_category_suggestions.any? ? sub_category_suggestions : false
	end

	def self.search_contents(options = {})
	  search_contents = Content.joins(:subcategory).where("lower(contents.title) LIKE ? or lower(subcategories.name) LIKE ?", "#{options[:queryString]}%", "#{options[:queryString]}%").order('id DESC').limit(50)
	  search_contents.any? ? search_contents : false
	end
end
