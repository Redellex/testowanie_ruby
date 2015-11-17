require 'simplecov'
SimpleCov.start

require 'shell_sort'

describe '#shell_sort' do
  it 'Algorithm have to not crash.' do
    expect { shell_sort([1, 3, 4]) }.not_to raise_error
  end
  it 'Example list argument, that checking algorithm functionality' do
    expect(shell_sort([1, 2, 3, 8, 5])).to eq([1, 2, 3, 5, 8])
    expect(shell_sort([1, 2, 3, 100, 4])).to eq([1, 2, 3, 4, 100])
    expect(shell_sort([1, -2, -3, -4, -5])).to eq([-5, -4, -3, -2, 1])
    expect(shell_sort([100,200,300,243,643,433])).to eq([100,200,243,300,433,643])
  end
  it 'Example list argument, that the result should not be equal.' do
    expect(shell_sort([1,40,30,20])).not_to eq([1, 40, 30, 20])
    expect(shell_sort([-5, 23,-4,-45])).not_to eq([4,5,23,45])
    expect(shell_sort([-2,-3, 4, -5])).not_to eq([1, 2, 3, 4])
    expect(shell_sort([0])).not_to eq([])
  end
  it 'Situation where we try to crash algorithm or make big workload'do
    expect(shell_sort([])).to eq([])
    expect(shell_sort([-1])).to eq([-1])
    expect(shell_sort([4, 3, 2, 1])).to eq([1, 2, 3, 4])
    expect(shell_sort([0,0,0,0])).to eq([0,0,0,0])    
    expect(shell_sort([13,11,7,5,3,1])).to eq([1,3,5,7,11,13])
  end
end
