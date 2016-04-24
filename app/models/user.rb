# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  role                            :integer          default("0")
#

class User < ApplicationRecord
  enum role: [:user, :admin]

  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true

  has_many :courses
  has_many :projects
  has_many :tasks
end
