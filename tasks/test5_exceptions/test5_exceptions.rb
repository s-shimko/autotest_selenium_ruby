# Create in your main project your own exception class. Think about what class you should inherit it from.

#     - This exception should be raised in some specific case, for example if you try to open a project
# and your script didn't find any created projects you could raise an exception for this case.

# - After it you should add a rescue end code block (which will catch your specific Exception class)
# to create a new project and then retry to execute attempt to open a project page

# - Limit number of retries to prevent your code from endless execution

begin
  a = gets.to_i

  if a > 5
    raise "a > 5 - oh nooooooo!!!"

  else
    puts "a < 5"
  end

rescue RuntimeError => e
  puts e

ensure
  puts "next code without fail test"

end


# raise     - raise exception
# rescue    - do not raise, puts exception
# ensure    - next code


#Here I'm practising.
#Look for task implementation in testredmine.rb
