# 1. Go through methods lesson and demos once again. Then create 5 simple classes structure with
# 3 inheritance levels and write unit tests which demonstrate different methods availability
# levels (public, private, protected)
#
#
# 2. Create at least 10 classes structure with at least 3 inheritance levels where are some real
# staff can be described. There should be some methods and properties defined. And also there are
# should be used couple modules (as mixins) to share behavior we shouldn't share using inheritance
#
# This could be anything you want: machines, transport, animals, furniture, buildings, plants, etc

module Heal
  def initialize
    @health = 0
  end

  attr_writer :health

  def take_drugs
    if @health >= 1
      @health -=1
      puts "I am taking drugs. My health = #{@health}"
    else
      puts 'I need rehab!'
    end
  end

  def rehab
    @health = 3
    put_looser_in_a_rehab
  end

  private
  def put_looser_in_a_rehab
    puts "Put in a rehab. My health = #{@health}"
  end

end


class People

  def born
    puts ""
    puts "#{@name} was born"
  end

  def eat
    @health += 1
    puts "I'm eating. My health = #{@health}"
  end

  def die
    puts "My time has come - Bye!"
  end

end

class Musician < People
  include Heal

  def initialize name
    @name = name
  end

  def know_the_notes
    puts "My name is #{@name} and I know the notes! #{self.have_an_instrument}"
  end

  protected
  def have_an_instrument
    "And I have an instrument!"
  end
end


class Guitarist < Musician
  attr_accessor :name, :health

  def initialize
    @name = name
  end

  def play_the_guitar
    puts "My name is #{@name} and I can play the guitar - jjjjjj!!!"
  end
end

class Singer < Musician

  def initialize(name)
    @name = name
  end

  def can_sing
    puts "My name is #{@name} and I can sing - aaaaaa!!!"
  end
end

slash = Guitarist.new
slash.name = 'Slash'
slash.health = 3
slash.born
slash.know_the_notes
slash.play_the_guitar
slash.eat
slash.die


iggy = Singer.new("Iggy")
iggy.born
iggy.know_the_notes
iggy.can_sing
iggy.health = 3
2.times { iggy.take_drugs }
iggy.rehab
2.times { iggy.take_drugs }
iggy.eat
2.times { iggy.take_drugs }
iggy.die
puts ""

henry = Musician.new("Henry Rollins")
henry.know_the_notes
puts henry.have_an_instrument
# class Doctor
#   #know anatomy
# end


