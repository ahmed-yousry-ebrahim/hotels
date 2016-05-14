# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AccomodationType.destroy_all
puts "Seeding database"
accomodation_types = AccomodationType.create([{
                                                  id: 1, name: 'Hotel'
                                              },
                                              {
                                                  id: 2, name: 'Resort'
                                              },
                                              {
                                                  id: 3, name: 'B & B'
                                              },
                                              {
                                                  id: 4, name: 'Pension'
                                              },
                                              {
                                                  id: 5, name: 'Motel'
                                              }])