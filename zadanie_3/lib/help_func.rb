require 'curses'

def set_box(y1, x1, y2, x2)
    win1 = Curses::Window.new(y1, x1, y2, x2)
    win1.box("|", "-")
    win1.refresh
    return win1
end

def close_box(box)
    box.clear
    box.refresh
    box.close
end
