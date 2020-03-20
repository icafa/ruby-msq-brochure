# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brochure.create!(name: 'Brochure1( 2 page )', width: 17, height: 11, keywords:"", src: "/public/uploads/brochure/src/1/goodu",owner_type: "default", preimage: "/uploads/brochure/src/1/preimage.jpg", brochuretype: "brochure", current_page_number: 1, page_count: 2);
Brochure.create!(name: 'Brochure2( 4 page )', width: 17, height: 11, keywords:"", src: "/public/uploads/brochure/src/2/goodu",owner_type: "default", preimage: "/uploads/brochure/src/2/preimage.jpg", brochuretype: "brochure", current_page_number: 1, page_count: 4);
Brochure.create!(name: 'Business Card( 2 page )', width: 17, height: 11, keywords:"", src: "/public/uploads/brochure/src/3/goodu",owner_type: "default", preimage: "/uploads/brochure/src/3/preimage.jpg", brochuretype: "businesscard", current_page_number: 1, page_count: 2);
Brochure.create!(name: 'PostCard( 2 page )', width: 17, height: 11, keywords:"", src: "/public/uploads/brochure/src/4/goodu",owner_type: "default", preimage: "/uploads/brochure/src/4/preimage.jpg", brochuretype: "postcard", current_page_number: 1, page_count: 2);
