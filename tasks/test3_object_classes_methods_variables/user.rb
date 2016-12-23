require 'faker'

class User
attr_reader :user_name, :email, :pass

  def initialize
    @user_name = Faker::Name.first_name
    @email = Faker::Internet.email
    @pass = Faker::Internet.password
  end

  def login(user_name, email, pass)
    puts "Enter email: #{email}"
    puts "Enter password: #{pass}"
    puts "User2 with name #{user_name} is on the Trello!"
    puts " "
  end

  def create_user
    puts "Created user: #{@user_name}"
  end

  def create_board(board_name)
    puts "#{@user_name} has created board #{board_name}"
  end

end