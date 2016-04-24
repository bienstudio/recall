class UpdateUser < ApplicationInteraction
  object :current_user, class: User
  hash :user do
    object :user
    string :email, :password, default: nil
  end

  def execute
    _user = user[:user]

    authorize(current_user, _user, :update?)

    return _user unless errors.messages.empty?

    _user.email    = user[:email]    if user[:email]
    _user.password = user[:password] if user[:password]

    unless _user.save
      errors.merge!(_user.errors)
    end

    _user
  end
end
