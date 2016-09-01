##Tasks Main Data Classes

# 1. Create a method which will take a natural number as an argument and will find a sum of all its digits
def sum_all_digits(num)
  split_string = num.to_s.split('')
  split_string.map!(&:to_i)
  sum_digits = split_string.inject(0) { |res,el| res + el }
  return sum_digits
end

# 2. There is a string Find a maximum number of digits placed in a row in it

def max_num_of_digits(string)
  split_string = string.split('')
  digits = split_string.select { |el| el.to_i.to_s == el.to_s }
  return digits.count
end

# 3. There is a string. Find a maximal number (not a digit) in it

def max_num_of_not_digits(string)
  split_string = string.split('')
  not_digits = split_string.select { |el| el.to_i.to_s != el.to_s }
  return not_digits.count
end

# # 4. There are two strings. Find number of first chars from first string matching first chars of the second string.
#     Consider two cases:
# strings are definitely different
# strings can completely match
# найти кол-во эл-ов которые совпадают подряд начиная сначала, посимвольно 2 строки сравнивать и считать совпадения
#
# first_string = "first and last"
# second_string = "first and last"
# # puts first_string.eql? second_string
#
# str1 = first_string.split('')
# str2 = second_string.split('')
# puts str1[0].eql? str2[0]


# 5. There is an array of integers. First puts elements with even indexes and then with odd indexes

def puts_even_odd(array = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  puts array.select { |el| el.even? }
  puts array.select { |el| el.odd? }
end

# 6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]

def puts_index_last(ary = [10, 20, 30, 40, 50, 60, 70, 80, 90])
  new_ary = ary.select { |el| el != ary[0] && el != ary[-1] }
  puts new_ary.index(new_ary[-1])
end

# 7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number.
# Don't do it for first and last elements

def avalue.to_idding_to_each_even_number(ary = [10, 21, 30, 41, 50, 61, 70, 81, 90])
  cut_ary = ary.select { |el| el != ary[0] && el != ary[-1] }
  even_cut_ary = cut_ary.select { |el| el.even? }
  puts even_cut_ary.map { |el| el + ary[0]}
end

# 8. There is a hash where keys and values are strings. Modify it: all keys should be symbols and all values should be
# integers. If you couldn't modify some value set it to nil

def modify_hash_strings_to_symbols_and_integers
  h = {"key1" => "1",
       "key2" => "f2",
  }
  puts h.each { |key, value| puts "Key is a #{key.class} and value is a #{value.class}" }
  h.keys.each { |key| h[key.to_sym] = h.delete(key) }
  h.each { |key, value| h[key] = value.to_i }
  puts h.each { |key, value| puts "Now key is a #{key.class} and value is a #{value.class}" }
end

# 9. There is a hash where keys are symbols and values are integers. Modify it: remove all pairs where symbols start
# with "s" character
def remove_pairs_start_with_s
  h = {key: 1,
       s_key1: 1,
       s_key2: 2,
       key_s: 3
  }
  h.delete_if { |key| key.to_s.match(/^s/) }
  puts h
end

# 10. There is a hash where keys are symbols and values are integers. Modify it: leave only pairs where value is
natural number and more than 0
def leave_pairs_natural_and_more_than_zero
  h = {key1: 0,
       key2: 1,
       key3: 0,
       key4: 100.6
  }
  new_h = h.select { |key, value| (value.is_a? Fixnum) && (value > 0) }
  puts new_h
end



# Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)
#
#                   before output for each next number we should puts "========="
#                   if number is even or odd it should puts string "the number is even" or "the number is odd"
#                   if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
#                   in case we've got "0" we should puts "we've got 0"
#                   in each case we should get 2 messages except the '0' case

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
# def generate_ten_random_numbers
#   i = 1
#   while i <= 10
#     a = rand(0..9)
#     puts "================="
#     puts "#{i}: a = #{a}"
#
#     if a < 5
#       puts "the number is less than 5"
#     elsif a == 5
#       puts "the number is 5"
#     else
#       puts "the number is more than 5"
#     end
#     a.even? ? (puts "the number is even") : (puts "the number is odd")
#     if a == 0
#       puts "we've got 0"
#     end
#
#     i += 1
#   end
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

