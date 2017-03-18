class DashboardController < BaseController
  def index
    @userscount = User.all.count
    @lessonscount = Lesson.all.count
    @teacherscount = Teacher.all.count
    @contentcount = Content.all.count
    @categorycount = Category.all.count
    @subcategorycount = Subcategory.all.count
  end
end
