# NOTE: This file was created with the following command
# "rails generate migration CreateAssignment
# description:string completion_time:integer

class CreateAssignment < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :description
      t.integer :completion_time
    end
  end
end
