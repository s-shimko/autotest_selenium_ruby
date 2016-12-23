class ProjectError < StandardError

  def self.pr_err
    raise "Test false!"

    rescue RuntimeError => e
      puts e

  end

end

