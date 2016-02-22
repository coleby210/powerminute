class UsersController < ApplicationController
  before_action :verify_user
  def show
    @user = User.find(params[:id])
    @total_workouts = @user.workouts
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
  end

  protected

  def verify_user
    if !user_session
      redirect_to '/'
    end
  end



end