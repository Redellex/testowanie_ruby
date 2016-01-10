require 'simplecov'
require 'curses'
SimpleCov.start

require 'menu.rb'
win1 = Curses::Window.new(0, 0, 1, 1)

describe '#menu' do
  it 'Get_menus function should not raise error' do
    expect {get_menus()}.not_to raise_error
    end
  it 'draw_menu function should not raise error' do
    expect {draw_menu(0, win1)}.not_to raise_error
   end
end
