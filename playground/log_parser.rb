require 'open-uri'
class LogParser

  def initialize(path)
    @path = path
  end

  def log
    @log ||= open(@path).read
  end

  def count
    c = 0
    log.split("\n").each do |line|
      c += 1 if line =~ /\AStarted/
    end
    c
  end
end
