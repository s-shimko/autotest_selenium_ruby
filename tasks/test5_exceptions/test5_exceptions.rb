# Create in your main project your own exception class. Think about what class you should inherit it from.

#     - This exception should be raised in some specific case, for example if you try to open a project
# and your script didn't find any created projects you could raise an exception for this case.

# - After it you should add a rescue end code block (which will catch your specific Exception class)
# to create a new project and then retry to execute attempt to open a project page

# - Limit number of retries to prevent your code from endless execution
def aaa
raise "a >= 5 - oh nooooooo!!!"
rescue RuntimeError => e
puts e
end


begin

  count = 0
  while count <= 3
     a = gets.to_i
    if a >= 5
      aaa
      puts count


count +=1


    else
      puts "a < 5"
      count = 4
      puts count
   end


  end

puts 'thats it'
  # ensure
  #
  # a = gets.to_i
  #
  # if a >= 5
  #   raise "a >= 5 - oh nooooooo!!!"
  #
  # else
  #   puts "a < 5"
  # end

 # puts "Here I'm practising."
 # puts "Look for task implementation in test2_constructions_and_operators.rb"
end


# raise     - raise exception
# rescue    - do not raise, puts exception
# ensure    - next code


#Here I'm practising.
#Look for task implementation in test2_constructions_and_operators.rb
