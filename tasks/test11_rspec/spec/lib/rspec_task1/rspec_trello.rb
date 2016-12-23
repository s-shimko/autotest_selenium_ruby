# require 'spec/spec_helper'
# require 'rspec'
require_relative 'card_comment'
require_relative 'project_error'
require_relative 'user'

describe CardComment do

  it 'test comment' do
    var = CardComment.new('123')
    ProjectError.pr_err if (expect(var.comment) != '1323')
  end
end

describe User do

  it 'test user' do
    user = User.new
    if (expect(user.create_user) == ("Created user: #{user.user_name}"))
       puts "User correct"
    else
      puts "User incorrect"
    end

  end
end


