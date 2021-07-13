# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

shops = Shop.create([
    {
        name: "Taco Bell", 
        image_url: "https://locations.tacobell.com/permanent-b0b701/assets/images/TBUS_Logo.7bd20747.svg"
    }, 
    {
        name: "Tacos El Gordo", 
        image_url: "https://cdn.doordash.com/media/restaurant/cover/_TACOS_EL_GORDO_EAST_ORANGE_City.png"
    }

])

reviews = Review.create([
    {
        title: "What is this", 
        description: "I don't even know what I ate", 
        score: 2, 
        shop: shops.first
    },
    {
        title: "Great Food", 
        description: "I love coming here!", 
        score: 5, 
        shop: shops.first
    }

])