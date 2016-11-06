# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Navigiation Items
navigation_titles = ["About Us", "Boarding", "Daycare", "FAQ", "Testimonials", "Hours & Location", "Reservations"]
i = 1
navigation_titles.each do |title|
  NavigationItem.find_or_create_by(title: title, list_order: i)
  i = i + 1
end

# Create admin user
User.create(email: "admin@gmail.com", password: "password", password_confirmation: "password", user_type: 1)