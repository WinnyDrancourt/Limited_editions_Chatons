## Reset before seeding ##

User.delete_all
Product.delete_all

## End Reset ##

## Create Users ##
20.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name

  User.create(
    first_name: first,
    last_name: last,
    email: "#{first}#{last}@mail.net",
    password: '123456+',
    adress: Faker::Address.street_address,
    zip_code: Faker::Address.zip,
    town: Faker::Address.city
  )
end
puts 'Users create'
## End Users creation ##

## Create Products ##
Product.create(
  name: 'B&W Cat',
  price: 20,
  description: 'Two B&N cats, face to face',
  image_url: 'https://cdn.pixabay.com/photo/2020/03/18/22/35/cats-4945658_640.png'
)
Product.create(
  name: 'Baby Cat',
  price: 10,
  description: 'Baby cat in hand',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'Grass Cat',
  price: 5,
  description: 'Little cat running on Grass',
  image_url: 'https://cdn.pixabay.com/photo/2019/08/20/21/21/cat-4419763_640.jpg'
)
Product.create(
  name: 'Big head',
  price: 12,
  description: 'Big head Cat',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'B&W Cat',
  price: 20,
  description: 'Two B&N cats, face to face',
  image_url: 'https://cdn.pixabay.com/photo/2020/03/18/22/35/cats-4945658_640.png'
)
Product.create(
  name: 'Baby Cat',
  price: 10,
  description: 'Baby cat in hand',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'Grass Cat',
  price: 5,
  description: 'Little cat running on Grass',
  image_url: 'https://cdn.pixabay.com/photo/2019/08/20/21/21/cat-4419763_640.jpg'
)
Product.create(
  name: 'Big head',
  price: 12,
  description: 'Big head Cat',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'B&W Cat',
  price: 20,
  description: 'Two B&N cats, face to face',
  image_url: 'https://cdn.pixabay.com/photo/2020/03/18/22/35/cats-4945658_640.png'
)
Product.create(
  name: 'Baby Cat',
  price: 10,
  description: 'Baby cat in hand',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'Grass Cat',
  price: 5,
  description: 'Little cat running on Grass',
  image_url: 'https://cdn.pixabay.com/photo/2019/08/20/21/21/cat-4419763_640.jpg'
)
Product.create(
  name: 'Big head',
  price: 12,
  description: 'Big head Cat',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'B&W Cat',
  price: 20,
  description: 'Two B&N cats, face to face',
  image_url: 'https://cdn.pixabay.com/photo/2020/03/18/22/35/cats-4945658_640.png'
)
Product.create(
  name: 'Baby Cat',
  price: 10,
  description: 'Baby cat in hand',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'Grass Cat',
  price: 5,
  description: 'Little cat running on Grass',
  image_url: 'https://cdn.pixabay.com/photo/2019/08/20/21/21/cat-4419763_640.jpg'
)
Product.create(
  name: 'Big head',
  price: 12,
  description: 'Big head Cat',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'B&W Cat',
  price: 20,
  description: 'Two B&N cats, face to face',
  image_url: 'https://cdn.pixabay.com/photo/2020/03/18/22/35/cats-4945658_640.png'
)
Product.create(
  name: 'Baby Cat',
  price: 10,
  description: 'Baby cat in hand',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)
Product.create(
  name: 'Grass Cat',
  price: 5,
  description: 'Little cat running on Grass',
  image_url: 'https://cdn.pixabay.com/photo/2019/08/20/21/21/cat-4419763_640.jpg'
)
Product.create(
  name: 'Big head',
  price: 12,
  description: 'Big head Cat',
  image_url: 'https://cdn.pixabay.com/photo/2012/12/21/10/06/kitten-71514_640.jpg'
)

puts 'Products create'
## End Products creation (20) ##
