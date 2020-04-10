# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'myemail@domain.com')
user_library = UserLibrary.create(user: user)
movies = Movie.create(
  [
    {
      title: 'Star Wars: The Empire Strikes Back',
      unit_price: 25,
      plot: {
        synopsis: "Skywalker's father is coming back",
        acts: [
          {
            type: :exposition,
            min_from: 45,
            min_to: 50,
            description: 'Some cool stuff happens'
          }
        ]
      }
    },
    {
      title: 'Ozark',
      unit_price: 100,
      plot: {
        synopsis: "Some bad ass money washer with family",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'They create a Casino'
          }
        ]
      }
    }
  
  ]
)

seasons = Season.create(
  [
    {
      title: 'The Lake of Ozarks',
      movie: movies.last,
      unit_price: 50,
      number: 1,
      plot: {
        synopsis: "Marty and his family moves to Missouri",
        acts: [
          {
            type: :exposition,
            min_from: 45,
            min_to: 50,
            description: 'Some cool stuff happens'
          }
        ]
      }
    },
    {
      title: 'Opening a Casino',
      movie: movies.last,
      unit_price: 50,
      number: 2,
      plot: {
        synopsis: "Marty and his family wanna create a Casino",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'They create a Casino'
          }
        ]
      }
    },
    {
      title: 'Opening a second Casino',
      movie: movies.last,
      unit_price: 50,
      number: 3,
      plot: {
        synopsis: "Marty and his family wanna create a 2nd Casino but things get ugly",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'A lot of people die'
          }
        ]
      }
    }
  ]
)

episodes = Episode.create(
    [
    {
      title: 'Chicago',
      season: seasons.first,
      number: 1,
      plot: {
        synopsis: "Marty and his family moves to Missouri",
        acts: [
          {
            type: :exposition,
            min_from: 45,
            min_to: 50,
            description: 'Some cool stuff happens'
          }
        ]
      }
    },
    {
      title: 'Moving to Missouri',
      season: seasons.first,
      number: 2,
      plot: {
        synopsis: "Marty and his family wanna create a Casino",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'They create a Casino'
          }
        ]
      }
    },
    {
      title: 'Some Cool Episode',
      season: seasons.second,
      number: 1,
      plot: {
        synopsis: "Marty and his family wanna create a 2nd Casino but things get ugly",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'A lot of people die'
          }
        ]
      }
    },
    {
      title: 'Some Other Cool Episode',
      season: seasons.last,
      number: 1,
      plot: {
        synopsis: "Marty and his family wanna create a 2nd Casino but things get ugly",
        acts: [
          {
            type: :climax,
            min_from: 45,
            min_to: 50,
            description: 'A lot of people die'
          }
        ]
      }
    }
  ]
  
)
