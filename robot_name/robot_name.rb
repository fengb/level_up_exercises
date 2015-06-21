class NameCollisionError < RuntimeError; end

class Robot
  attr_accessor :name
  @@registry = []

  def initialize(args = {})
    @name = args[:name] || generate_name

    if format_valid?(@name) && name_unique?(@name)
      @@registry << @name
    end
  end

  def self.registry
    @@registry
  end

  private
    def letter_randomizer
      ("A".."Z").to_a.sample
    end

    def generate_name
      name = []
      2.times { name << letter_randomizer }
      3.times { name << rand(10) }
      name.join
    end

    def format_valid?(name)
      if !(name =~ /[[:alpha:]]{2}[[:digit:]]{3}/)
        raise NameCollisionError, "This is an invalid name format!"
      else
        true
      end
    end

    def name_unique?(name)
       if @@registry.include?(name)
         raise NameCollisionError, "This name already exists!"
       else
         true
       end
    end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."
