# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  color      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ApplicationRecord
  belongs_to :user

  has_many :tasks

  validates :name, presence: true
  validates :user, presence: true
end
