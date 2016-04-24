class CreateUser < ApplicationInteraction
  hash :user do
    string :email, :password
  end

  def to_model
    User.new
  end

  def execute
    _user = User.new(user)

    _user
  end
end
