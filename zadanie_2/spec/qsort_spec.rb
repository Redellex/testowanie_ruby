require 'simplecov'
SimpleCov.start

require 'qsort.rb'

describe '#qsort' do
  it 'Simplest test checking if algorithm won\'t crash' do
    expect { qsort([1, 3, 4]) }.not_to raise_error
  end
  it 'Example list argument, that checking algorithm functionality' do
    expect(qsort([1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
    expect(qsort([1, 2, 3, 100, 4])).to eq([1, 2, 3, 4, 100])
    expect(qsort([1, -2, -3, -4, -5])).to eq([-5, -4, -3, -2, 1])
  end
  it 'Example list argument, that the result should not be equal.' do
    expect(qsort([1,40,30,20])).not_to eq([1, 40, 30, 20])
    expect(qsort([-5, 23,-4,-45])).not_to eq([4, 5, 23, 45])
    expect(qsort([-2,-3, 4, -5])).not_to eq([1, 2, 3, 4])
    expect(qsort([0])).not_to eq([])
  end
  it 'Trying to crash aglorithm'do
    expect(qsort([])).to eq([])
    expect(qsort([-1])).to eq([-1])
    expect(qsort([4, 3, 2, 1])).to eq([1, 2, 3, 4])
    expect(qsort([13,11,7,5,3,1])).to eq([1,3,5,7,11,13])
  end
end
