# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Book.create(title: 'Introduction to Computer Science', rating:5, finished_at:nil)
Book.create(title: 'Rspec with codeschool', rating:2,finished_at:5.days.ago)


