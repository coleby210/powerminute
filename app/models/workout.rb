class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_template
end
