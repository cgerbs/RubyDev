#Chris Gerbino
#COEN164 - Lab 5
#May 11, 2020
#TA: Samantha Song

require 'sinatra'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/student.db")

#creating 'model' for student database table

class Student
  include DataMapper::Resource

  property :id, Serial
  property :firstname, Text
  property :lastname, Text
  property :studentID, Integer
  property :email, Text
  property :dateOfBirth, Date
  property :yearOfGraduation, Integer
  property :photo, Text
end

DataMapper.finalize

get '/' do
  @studentList = Student.all # query 'Student' db table
  erb :displayResults
end

#open terminals
#irb & sqlite3
#irb
#require_relative 'student'
#Student.auto_mirgrate!
#sqlite3
#sqlite3 student.db
#.table
#select * from students;
#irb
#std = Student.new
#std.save

#sqlite
#select * from students; should now return |1||||

#list all students
# Student.all

#return first student
# Student.first
#return student with id = 2
# Student.get(2)

#update first student
# Student.first.update(name: "Christopher")

#delete student with id = 4
# Student.get(4).destroy

# Student.create(firstname: "chris", lastname: "gerbino", studentID: 1234567, email: "me@gmail.com", dateOfBirth: Date.new(1998), yearOfGraduation: 2021 , photo: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
# Student.create(firstname: "sam", lastname: "zxcv", studentID: 234553, email: "same@gmail.com", dateOfBirth: Date.new(1998), yearOfGraduation: 2021 , photo: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
# Student.create(firstname: "john", lastname: "sadf", studentID: 234553, email: "john@gmail.com", dateOfBirth: Date.new(1998), yearOfGraduation: 2021 , photo: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
# Student.create(firstname: "alex", lastname: "gdas", studentID: 723452, email: "alex@gmail.com", dateOfBirth: Date.new(1998), yearOfGraduation: 2021 , photo: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
# Student.create(firstname: "anders", lastname: "asdf", studentID: 234565, email: "anders@gmail.com", dateOfBirth: Date.new(1998), yearOfGraduation: 2021 , photo: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
