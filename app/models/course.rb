# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
end
