module OnFuel
  def initialize
    @fuel = 0
  end
  attr_reader :fuel

  def drive
    super
    if @fuel >= 1
      @fuel -=1
    else
      puts 'can not drive anymore'
      stop
    end
  end

  def refuel
    @fuel = 5
  end

end

class Transport

  attr_accessor :driver

  def drive
    puts 'driving'
  end

  def stop
    puts 'stopped'
  end
end


class Car < Transport
  include OnFuel

  def initialize
    @wheels = 4
  end
end

class Bike < Transport

  def initialize
    super
    @wheels = 2
  end
end

class Motorcycle < Transport
  include OnFuel

  def initialize
    super
    @wheels = 2
  end
end

my_moto = Motorcycle.new
my_moto.driver = 'John'
my_moto.refuel
6.times {my_moto.drive}



