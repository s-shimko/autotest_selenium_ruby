class NoProjectError < TypeError
  # def initialize(login, pass)
  #   @login = login
  #   @pass = pass
  # end

  def self.nop
    raise "ERROR! There is no any project!"

  rescue RuntimeError => e
    puts e
    # rescue RuntimeError => e
    #   puts e

  end

end

