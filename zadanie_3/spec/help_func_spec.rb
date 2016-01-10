require 'simplecov'
require 'curses'
SimpleCov.start

require 'help_func.rb'
win1 = Curses::Window.new(0, 0, 1, 1)

describe '#help_func' do
  it 'set_box function should not raise error' do
    expect {set_box(0,0,1,1)}.not_to raise_error
    end
  it 'close_box() function should not raise error' do
    expect {close_box(win1)}.not_to raise_error
   end
end
