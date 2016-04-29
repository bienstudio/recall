class CreateCourse < ApplicationInteraction
  object :current_user, class: User
  hash :course do
    string :name, :code, :color
  end

  def to_model
    Course.new
  end

  def execute
    _course = Course.new(course)
    _course.user = current_user

    authorize(current_user, _course, :create?)

    return nil unless errors.messages.empty?

    unless _course.save
      errors.merge!(_course.errors)
    end

    _course
  end
end
