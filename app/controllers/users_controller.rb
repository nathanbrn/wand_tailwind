class UsersController < ApplicationController
  def index
    @users = User.all
    render inertia: 'Users/Index', props: { users: @users.as_json }
  end
end