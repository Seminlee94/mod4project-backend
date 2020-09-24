# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'pry'
# require 'json'
# require "dotenv"
# require "rest-client"
# require "httparty"
# Dotenv.load

Item.destroy_all


# @@key = ENV["WEGMAN_API_KEY"]

# def self.sub_category(id)
#     response = HTTParty.get("https://api.wegmans.io/products/categories/#{id}?api-version=2018-10-18&subscription-key=#{@@key}") #{|response, request, result| response }
#     result = JSON.parse(response.body)
#     result["categories"].each do |sub_category|
        
#         puts "#{sub_category["id"]} - #{sub_category["name"]}"
        
#         Item.item_by_category(sub_category["id"])
#     end 
# end


# def self.item_by_category(sub_id)
#     response = HTTParty.get("https://api.wegmans.io/products/categories/#{sub_id}?api-version=2018-10-18&subscription-key=#{@@key}")#{|response, request, result| response }
#     result = JSON.parse(response.body)
#     if result["products"].count == 0 
#         puts "no"
#     else
#         return result["products"][0..9].each do |product|
            
#             puts product
#             puts product["sku"]
            
#             Item.info(product["sku"])
#         end
#     end
# end

# def self.info(sku)
#     # binding.pry
#     response = HTTParty.get("https://api.wegmans.io/products/#{sku}?api-version=2018-10-18&subscription-key=#{@@key}")
#     result = JSON.parse(response.body)
#     response_price = HTTParty.get("https://api.wegmans.io/products/#{sku}/prices?api-version=2018-10-18&subscription-key=#{@@key}")
#     result_price = JSON.parse(response_price.body)
#     price = result_price["stores"][0]["price"]
#     name = result["name"]
#     if result["tradeIdentifiers"] == [] || result["tradeIdentifiers"][0]["images"] == []
#         result["tradeIdentifiers"] = "https://assets.materialup.com/uploads/b03b23aa-aa69-4657-aa5e-fa5fef2c76e8/preview.png"
#     else result["tradeIdentifiers"][0]["images"][0]
#         result["tradeIdentifiers"] = result["tradeIdentifiers"][0]["images"][0]
#     end

#     if result["descriptions"]["consumer"] 
#         result["descriptions"]["consumer"]
#     else
#         result["descriptions"]["consumer"] = name
#     end
    
#     if result["descriptions"]["receipt"] 
#         result["descriptions"]["receipt"]
#     else
#         result["descriptions"]["receipt"] = name
#     end
        
#     # binding.pry
#     item = Item.create!(
#         # item_id: sku, #sku number - product_url
#         category: "Seafood",
#         sub_category: "Ready to Cook Seafood",
#         name: name, #product_url
#         price: price, #price_url
#         description: result["descriptions"]["consumer"],
#         inventory_quantity: rand(50..100),
#         image: result["tradeIdentifiers"]

#     )
# end

# def self.search(query)
#     search_query = query.split(" ").join("%20")
#     response = HTTParty.get("https://api.wegmans.io/products/search?query=#{search_query}&api-version=2018-10-18&subscription-key=#{@@key}")
#     # binding.pry
#     response["results"][0...6].map do |item|
#         sku = item["sku"]
#         Item.info(sku)
#     end
# end



Item.item_by_category("561-562") ## ""Bread, Packaged"