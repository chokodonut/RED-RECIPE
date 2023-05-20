# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@mail',
   password: 'adminadmin1'
)

User.create!(
   name: 'bonbon',
   email: 'bon@mail',
   password: 'bonbonbon'
)

User.create!(
   name: 'nikuniku',
   email: 'niku@mail',
   password: 'nikuniku'
)

User.create!(
   name: 'hana',
   email: 'hana@mail',
   password: 'hanahana'
)

User.create!(
   name: 'ponta',
   email: 'ponta@mail',
   password: 'pontaponta'
)

User.create!(
   name: 'gorori',
   email: 'gorori@mail',
   password: 'gororigorori'
)

User.create!(
   name: 'tetuko',
   email: 'tetuko@mail',
   password: 'tetukotetuko'
)