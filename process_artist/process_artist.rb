require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # Do Stuff
  end

  def run_command(command)
    puts "Running Command #{command}"
    command.split
    if command.count == 10
      command[0]
      command[1..3]
      command[4..6]
      command[7..9]
    end
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"
    if @queue.nil?
      @queue = ""
    end
    if key != "\n"
      @queue = @queue + key
    else
      warn "Time to run the command: #{@queue}"
      run_command(@queue)
      @queue = ""
    end
  end
end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)
