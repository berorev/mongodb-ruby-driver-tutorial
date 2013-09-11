require 'rubygems'  # not necessary for Ruby 1.9
require 'mongo'

include Mongo

mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db('test') 

collection = db.collection('testCollection')

doc = {"name" => "MongoDB", "type" => "database", "count" => 1, "info" => {"x" => 203, "y" => '102'}}
id = collection.insert(doc)

collection.find.each { |row| puts row.inspect }
collection.find(type: 'database').each { |row| puts row.inspect }
