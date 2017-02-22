class DashboardController < BaseController
	
	def index
    @userscount = User.all.count
	@lessonscount = Lesson.all.count
	@teacherscount = Teacher.all.count	
	end
end