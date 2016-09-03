
# Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)
#
#                   before output for each next number we should puts "========="
#                   if number is even or odd it should puts string "the number is even" or "the number is odd"
#                   if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
#                   in case we've got "0" we should puts "we've got 0"
#                   in each case we should get 2 messages except the '0' case

def generate_ten_random_numbers
  i = 1
  while i <= 10
    a = rand(0..9)
    puts "================="
    puts "#{i}: a = #{a}"

    if a < 5
      puts "the number is less than 5"
    elsif a == 5
      puts "the number is 5"
    else
      puts "the number is more than 5"
    end
    a.even? ? (puts "the number is even") : (puts "the number is odd")
    if a == 0
      puts "we've got 0"
    end

    i += 1
  end
end






#                   2. add to your solution next test
#
#                   create project
#                   make a random action: create or not a new bug issue
#                   open project page,
#                   open issues tab
#                   if there is a bug present then add self to watchers
#                   if no then create a new bug issue and then add self to watchers
#                   Verify that there is a bug issue and that current user is a watcher
#

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

