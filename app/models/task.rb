# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  text       :string
#  due        :datetime
#  completed  :boolean
#  user_id    :integer
#  project_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :course
end
