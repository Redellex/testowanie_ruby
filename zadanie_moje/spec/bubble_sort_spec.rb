require 'simplecov'
SimpleCov.start

require 'bubble_sort'

describe '#bubble_sort' do
  it 'Algorithm should not raise error' do
    expect { bubble_sort([1, 3, 4]) }.not_to raise_error
  end
  it 'Example list argument, that checking algorithm functionallity' do
    expect(bubble_sort([1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
    expect(bubble_sort([1, 2, 3, 100, 4])).to eq([1, 2, 3, 4, 100])
    expect(bubble_sort([1, -2, -3, -4, -5])).to eq([-5, -4, -3, -2, 1])
  end
  it 'Example list argument, that the result should be not equal.' do
    expect(bubble_sort([1,40,30,20])).not_to eq([1, 40, 30, 20])
    expect(bubble_sort([-5, 23,-4,-45])).not_to eq([4,5,23,45])
    expect(bubble_sort([-2,-3, 4, -5])).not_to eq([1, 2, 3, 4])
    expect(bubble_sort([0])).not_to eq([])
  end
  it 'Situation, where algorithm might crash or has big workload'do
    expect(bubble_sort([])).to eq([])
    expect(bubble_sort([-1])).to eq([-1])
    expect(bubble_sort([4, 3, 2, 1])).to eq([1, 2, 3, 4])
    expect(bubble_sort([0,0,0,0])).to eq([0,0,0,0])
    expect(bubble_sort([13,11,7,5,3,1])).to eq([1,3,5,7,11,13])
  end
end
