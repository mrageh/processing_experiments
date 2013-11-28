require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # Do Stuff
  end

  def mouse_pressed
    ellipse_mode CENTER
    rect_mode CENTER
    ellipse(mouse_x, mouse_y, 100, 100)
  end

  def mouse_dragged
    mouse_pressed
  end

  def mouse_released
    stop()
    background(0,0,0)
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

  def command_correct(command)
    if command[0] == 'b'
      command[0]
    else
      'This is the wrong command!!'
    end
  end

  def run_command(command)
    command_correct(command)
    numbers     = command[1..-1]
    color_group = numbers.split(',')
    rgb         = color_group.map {|c| c.to_i}
    background(rgb[0], rgb[1], rgb[2])
  end
end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)
