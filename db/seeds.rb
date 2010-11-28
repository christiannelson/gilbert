# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

10.times do
  Article.create! :title => Faker::Lorem.words(2 + rand(4)).join(' ').titleize,
                  :author => Faker::Name.name,
                  :content => Faker::Lorem.paragraphs(1 + rand(2)).join("\n\n")
end