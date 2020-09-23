require 'pry'
require 'json'
require "dotenv"
require "rest-client"
require "httparty"
Dotenv.load



class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
