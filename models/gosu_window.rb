require 'gosu'

class Window < Gosu::Window
  def initialize(element_hashes, width=1280, height=720, fullscreen=false)
    super(width, height, fullscreen)
    self.caption = 'Periodic Table'
    @element_hashes = element_hashes
  end

  def draw
    for i in (0...@element_hashes.count) do
      string = @element_hashes[i][:string]
      xpos = (@element_hashes[i][:xpos] - 1) * 70 + 20
      ypos = (@element_hashes[i][:ypos]  - 1) * 70 + 20
      Gosu::Image.from_text(string, 15).draw(xpos, ypos, 0)
    end
  end

  def update
  end

  def button_down id
    close if id == Gosu::KbEscape
  end

end
