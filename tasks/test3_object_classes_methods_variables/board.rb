class Board
  attr_reader :board_name

  def initialize(board_name)
    @board_name = board_name
  end

  def create_list(list_name)
    puts ""
    puts "User2 added list #{list_name} to board #{@board_name}"
  end

end