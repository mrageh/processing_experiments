require "ruby-processing"

class MySketch < Processing::App
  def setup
    background(255, 128, 128)
  end
  def draw
    @counter ||= 0
    @counter = (@counter + 2) % 256
    puts "Running Run #{@counter}"
    fill(@counter,255,128)
  end

  def mouse_pressed
    ellipse(mouse_x, mouse_y, 100, 100)
  end
end
MySketch.new(:width => 400, :height => 400,
    :title => "MySketch", :full_screen => false)
