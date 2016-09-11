# 1.Please create few integrated simple models for trello.com
# Should be at least:
#     users
#     boards
#     lists
#     cards
#     comments
# Create 10 any unit tests for this classes and their methods

class Users
  def initialize(name, size)
    @name = name
    @size = size
  end

  def puts_user
    puts @name
    puts @size
  end
end

my_user = Users.new('Ilya', '32')
my_user.puts_user

class Boards
  def initialize(name, size)
    @name = name
    @size = size
  end

  def puts_user(var)
    puts @name
    puts @size
    puts var
  end
end

my_b = Boards.new('Ida', 'd32')
my_b.puts_user(222)






















# 2.Add a User model to your project and modify all methods which work with user data (email or password)
# to treat users in a right way
#

