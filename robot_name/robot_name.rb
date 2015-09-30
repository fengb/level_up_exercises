class NameCollisionError < RuntimeError; end

class InvalidNameError < RuntimeError; end

class Robot


  attr_accessor :name


  def initialize(args = {})
    @@registry ||= []
    @custom_name = args[:custom_name]
    name_generator
    check_registry
  end

  def name_generator
    if @custom_name
      @custom_name.call
    else
      char = -> { ('A'..'Z').to_a.sample }
      num = -> { rand(10) }
      self.name = "#{char.call}#{char.call}#{num.call}#{num.call}#{num.call}"
    end
  end

  def check_registry
    if @@registry.include?(name)
      raise NameCollisionError, 'There was a problem generating the robot name!'
    elsif (@custom_name !~ /[[:alpha:]]{2}[[:digit:]]{3}/)
      raise InvalidNameError, 'This name is not in the right format!'
    else
      add_to_registry
    end
  end

  def add_to_registry
    @@registry << name
  end

end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
generator = -> { 'AA111' }
Robot.new(custom_name: generator)
Robot.new(custom_name: generator)
