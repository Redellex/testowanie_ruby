require 'simplecov'
SimpleCov.start

require 'bubble_sort'

describe '#bubble_sort' do
  it 'Algorithm should not raise error' do
    expect { bubble_sort([1, 3, 0, 5]) }.not_to raise_error
  end
  it 'Checking if sorting is correctly' do
    expect(bubble_sort([1,5,3,2,4])).to eq([1,2,3,4,5])
  end
  it 'Checking if the algoritm won\'t sort if we put sorted already list.' do
      expect(bubble_sort([1,2,3,4,5])).to eq([1,2,3,4,5])
  end
  it 'Sorting with big workload (many numbers to sort)' do
      expect(bubble_sort([10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]).to eq([-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10])
  end
  it 'Checking if sorting won\'t error raise error if we put the same numbers.' do
    expect { bubble_sort([0, 0, 0, 0]) }.not_to raise_error
  end
  it 'Checking if sorting will return empty list if we input empty list.'do
    expect(bubble_sort([])).to eq([])
  end
end
