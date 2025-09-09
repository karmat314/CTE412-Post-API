# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
## Create sample posts
Post.destroy_all
posts = [
  { title: "First Post", body: "This is the body of the first post." },
  { title: "Second Post", body: "Here’s some more content for the second post." },
  { title: "Final Post", body: "This is just a demo seed to populate the database with some posts." }
]

posts.each do |post|
  Post.create!(post)
end

