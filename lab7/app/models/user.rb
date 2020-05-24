# this is the model for the 'User Table'.. this file was create when I generated a scaffold for user
class User < ApplicationRecord
  has_many(:micropost, dependent: :destroy)

  # has_many is a function call that corrects the "ConstraintException: FOREIGN KEY constraint failed" error
  # I think the error here occured because I tried to delete a user and the microposts were a 'child' of the user and we were not deleting them as well...to fix this we need to delete the microposts for the user that we are deleting!
  # what this function does is destroy the 'Microposts' for a user when the user is deleted
end
