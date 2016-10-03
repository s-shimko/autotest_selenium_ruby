class NoProjectError < StandardError

  def self.nop
    raise "ERROR! There is no any project!"

    rescue RuntimeError => e
      puts e

  end

end

