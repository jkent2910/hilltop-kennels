# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin user
User.create(email: "admin@gmail.com", password: "password", password_confirmation: "password", user_type: 1)

# Create main pages
def create_pages(navigation_item)
  if navigation_item.title == "About Us"
    Page.find_or_create_by(title: "About Us", body: "Hilltop Kennels is one of the finest boarding facilities in Cedar Rapids.
                                                    We are located at 1403 Wilson Ave. SW, just ten minutes north of the Eastern Iowa Airport. The kennel sits on six beautiful acres.
                                                    Hilltop Kennels was established in 1979 and is privately owned and operated.  Hilltop Kennels provides a private indoor/outdoor run
                                                    for each dog and separate boarding area for cats. Our goal is to provide a safe and comfortable stay for your pet.",
                                                    navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "Boarding"
    Page.find_or_create_by(title: "Boarding", body: "Because you don't compromise when it comes to your pet, neither do we. Hilltop Kennels offers spacious and spotlessly clean indoor/outdoor suites
                                                     in various sizes to accommodate all sizes of dogs. Your pet's indoor portion of its kennel provides a secure private setting to snooze, dine or drink a fresh beverage.
                                                     Leading from the inside of the kennel to their individual outside patio is their own private entrance to sunbathe, lay in the shade or converse with their neighbor.  Each
                                                     dog has a 17 foot long indoor/outdoor run equipped with a resting platform, feeder and stainless steel water dish.",
                                                     navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "Daycare"
    Page.find_or_create_by(title: "Daycare", body: "The Daycare is open from 7:00AM to 6:00PM Monday - Saturday.", navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "FAQ"
    Page.find_or_create_by(title: "FAQ", body: "Is there a veteirnarian on staff?", navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "Testimonials"
    Page.find_or_create_by(title: "Testimonials", body: "We LOVE Hilltop Kennels! I’ve been boarding dogs at Hilltop Kennels for more than 22 years. Indoor and outdoor areas in their clean, roomy kennels give dogs room to move around.
                                                         They even offer extra playtime with the animals which I love. It gives the dogs more attention and interaction while away from home. My Lab has a large variety of allergies and
                                                         can’t have a number of foods/toy materials common to most dogs. Everyone is very helpful and careful to avoid those things. They ensure he receives his medication as required.
                                                         No one could ask for more friendly, caring owners and staff!", navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "Hours & Location"
    Page.find_or_create_by(title: "Hours & Location", body: "Business Hours", navigation_item_id: navigation_item.id)
  elsif navigation_item.title == "Reservations"
    Page.find_or_create_by(title: "Reservations", body: "Call 319-363-1054 to Reserve", navigation_item_id: navigation_item.id)
  end
end

# Create Navigiation Items
navigation_titles = ["About Us", "Boarding", "Daycare", "FAQ", "Testimonials", "Hours & Location", "Reservations"]
i = 1
navigation_titles.each do |title|
  n = NavigationItem.find_or_create_by(title: title, list_order: i)
  i = i + 1
  create_pages(n)
end