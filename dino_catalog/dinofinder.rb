require 'csv'
require_relative 'parser'

class DinoFinder
  def initialize(all_dinos)
    @all_dinos = all_dinos
  end

  def bipeds
    @all_dinos.each do |hash|
      p hash[:name] if hash[:walking] == "Biped"
    end
  end

  def carnivores
    @all_dinos.each do |hash|
      p hash[:name] if hash[:carnivore] == "Yes" || hash[:diet] == "Carnivore"
    end
  end

  def specific_period(period)
    @all_dinos.each do |hash|
      p hash[:name] if hash[:period] == period
    end
  end

  def big_dinos
    @all_dinos.each do |hash|
      p hash[:name] if hash[:weight].to_i > 4000
    end
  end

  def small_dinos
    @all_dinos.each do |hash|
      puts hash[:name] if hash[:weight].to_i < 4000
    end
  end

  def find_dino(name)
    @all_dinos.each do |hash|
      next unless hash[:name] == name
      hash.each do |_k, v|
        puts v
      end
    end
  end
end
