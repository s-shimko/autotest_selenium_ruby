class SomeObject
# attr_accessor :value

  def value
    @value
  end

  # def initialize(target = "my target", value ="my value")
  #   @target = target
  #   @value = value
  # end
  #
  # def puts_all
  #   puts @target
  #   puts @value
  # end
end
object = SomeObject.new('111')
# object.value = "34343"
puts object.value






# #==========================oven start=======================================
class Oven

  @@all_ovens_spent = 0
  ENERGY_PRICE = 100

  def self.sum
    @@all_ovens_spent*ENERGY_PRICE
  end


  # def initialize(model, colour, volume, power)
  #   @model = model
  #   @colour = colour
  #   @volume = volume
  #   @power = power
  # end
  attr_reader :power, :model, :colour, :volume
  attr_accessor :default_time

  def initialize(options={})
      @model = options[:model]
      @colour = options[:colour]
      @volume = options[:volume]
      @power = options[:power]
      @energy_spent = 0
      @default_time = 5
  end

def puts_p
  puts @model
  puts @colour
  puts @volume
  puts @power
end

  def turn_on(time: nil, power: 300)
    time = @default_time unless time
    puts "working"
    if power > @power
      raise "This oven is not so powerfull"
    elsif power < 100
      raise "Please choose correct power"
    end
    puts "power is #{power}W"
    sleep time
    @energy_spent += count_energy(power,time)
    @@all_ovens_spent += count_energy(power,time)
    puts "..."
    sleep 1
    turn_off
  end

  def count_energy(power,time)
    (((power/60.00)*time)/1000).round(2)
  end

  def turn_off
    puts "stop"
  end
end
options = {model: '33',colour: 'red', volume: 'loud', power: 2000}
var = Oven.new(options)

var.turn_on(power: 412)
puts 'Power is ' + var.power.to_s
puts 'Colour is ' + var.colour.to_s
puts 'Model is ' + var.model.to_s
puts 'Volume is ' + var.volume.to_s
# var.turn_off

oven1 = Oven.new
oven2 = Oven.new
oven1.turn_on(time:2,power:22000)
oven2.turn_on(time:3,power:21000)
puts "Sum is " + Oven.sum
#================================oven end================================================
# def call_yield
#   ary = ['string', 'sss']
#   yield(ary)
# end
#
# call_yield { |var| puts var }

#
# def create_method(method_name)
#   define_method(method_name.to_sym) do |a|
#     puts "#{method_name} is defined"
#     puts "#{a} is argument"
#   end
# end
#
# class User
#   attr_reader :first_name, :last_name
#
#   attr_writer :first_name, :last_name
#
#   attr_accessor :first_name, :last_name
# end



# for i in 0..10 do
#   puts i
# end

# i = 10
# loop do
#   break if i == 0
#   puts i
#   i -= 1
# end
#
# class Animal
#   def initialize
#     @dog = 'dog'
#     @cat = 'cat'
#     @mouse = 'mouse'
#   end
#
#   def sound(voice)
#     puts "This bitch do #{voice}"
#   end
# end

# var = lambda do
#   puts "adsf"
# end
#
# var.call