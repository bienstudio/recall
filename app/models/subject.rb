# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ApplicationRecord
  belongs_to :user
end
