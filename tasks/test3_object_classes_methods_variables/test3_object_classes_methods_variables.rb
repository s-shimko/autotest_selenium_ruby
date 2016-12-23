# 1.Please create few integrated simple models for trello.com
# Should be at least:
#     users
#     boards
#     lists
#     cards
#     comments
# Create 10 any unit tests for this classes and their methods

# 2.Add a User2 model to your project and modify all methods which work with user data (email or password)
# to treat users in a right way
#


require 'faker'
require_relative "user"
require_relative "board"
require_relative "list"
require_relative "cards"
require_relative "card_comment"

# create user
user = User.new
user.create_user

#login on Trello with created user
user.login(user.user_name, user.email, user.pass)

# user1 has created two boards: Work & Home
board_work = Board.new("Work")
board_home = Board.new("Home")
user.create_board(board_work.board_name)
user.create_board(board_home.board_name)

#in board Work user created two lists: What_To_Do and Done
list_what_to_do = List.new("What_To_Do")
list_done = List.new("Done")

board_work.create_list(list_what_to_do.list_name)
board_work.create_list(list_done.list_name)

#on board Home user created two lists: What_To_Do and Done
board_home.create_list(list_what_to_do.list_name)
board_home.create_list(list_done.list_name)

#on board Work, in list What_To_Do user has created 2 cards
card = Cards.new

cards1 =  Cards.generate_n_cards(2)
puts ""
puts list_what_to_do.add_cards(board_work.board_name,list_what_to_do.list_name, cards1)

#on board Work, in list Done user has created 2 random cards
cards2 =  Cards.generate_n_cards(2)
puts ""
puts list_done.add_cards(board_work.board_name,list_done.list_name, cards2)

#on board Home, in list What_To_Do user has created 2 random cards
cards3 =  Cards.generate_n_cards(2)
puts ""
puts list_what_to_do.add_cards(board_home.board_name,list_what_to_do.list_name, cards3)

#on board Home, in list Done user has created 2 random cards
cards4 =  Cards.generate_n_cards(2)
puts ""
puts list_done.add_cards(board_home.board_name,list_done.list_name, cards4)

#to card user add a comment
puts ""
comment1 = CardComment.new("Work harder!")
card.add_comment_to_a_card(card.card_name,comment1.comment)

#from card user delete a comment
card.delete_comment_from_a_card(card.card_name,comment1.comment)






