require_relative './version.rb'
require 'json'
require 'rest-client'
require 'dotenv/load'
require 'pry'
class AstanleyCLIProject::Team
    attr_accessor :market, :name, :wins, :losses
    @@all = []

    def initialize(teams_hash)
        teams_hash.each do |key, value|
            send("#{key}", value)
        end
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end
