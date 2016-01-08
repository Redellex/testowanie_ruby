require 'simplecov'
SimpleCov.start

require 'calc.rb'

describe '#calc' do
  it 'Sum function should not raise error' do
    expect {sum(0, 0) }.not_to raise_error
  end
  it 'Sum function should add two integers correctly.' do
    expect(sum(1, 1)).to eq(2)
  end
  it 'Checking how sum function will handle with negative numbers.' do
      expect(sum(-1, 1)).to eq(0)
  end
  it 'Checking if sum function add two floats correctly' do
      expect(sum(1.5, 1.5)).to eq(3)
  end


  it 'Multiplication function should not raise error' do
    expect {multiplication(0, 0) }.not_to raise_error
  end
  it 'Multiplication function should multiply two integers correctly.' do
    expect(multiplication(1, 1)).to eq(1)
  end
  it 'Checking how multiplication function will handle with negative numbers.' do
      expect(multiplication(-1, 1)).to eq(-1)
  end
  it 'Checking if multiplication function multiply two floats correctly' do
      expect(multiplication(1.5, 1.5)).to eq(2.25)
  end


  it 'Division function should not raise error' do
    expect {divide(0, 0) }.not_to raise_error
  end
  it 'Division function should divide two integers correctly.' do
    expect(divide(1, 1)).to eq(1)
  end
  it 'Checking how division function will handle with negative numbers.' do
      expect(divide(-1, 1)).to eq(-1)
  end
  it 'Checking if division function divide two floats correctly' do
      expect(divide(1.5, 1.5)).to eq(1)
  end


  it 'Diffrence function should not raise error' do
    expect {diffrence(0, 0) }.not_to raise_error
  end
  it 'Diffrence function should subtract two integers correctly.' do
    expect(diffrence(1, 1)).to eq(0)
  end
  it 'Checking how diffrence function will handle with negative numbers.' do
      expect(diffrence(-1, 1)).to eq(-2)
  end
  it 'Checking if diffrence function subtract two floats correctly' do
      expect(diffrence(1.5, 1.5)).to eq(0)
  end


  it 'Power function should not raise error' do
    expect {power(0, 0) }.not_to raise_error
  end
  it 'Power function should increase two integers correctly.' do
    expect(power(1, 1)).to eq(1)
  end
  it 'Checking how power function will handle with negative numbers.' do
      expect(power(-1, 1)).to eq(1)
  end
  it 'Checking if power function increase two floats correctly' do
      expect(diffrence(1.5, 2)).to eq(2.25)
  end


  it 'Factorial function should not raise error' do
    expect {silnia(0)}.not_to raise_error
  end
  it 'Factorial should calculate correctly.' do
    expect(power(4)).to eq(24)
  end
  it 'Checking how factorial function will handle with negative number.' do
      expect(power(-1)).to eq(1)
  end
  it 'Checking if factorial function raise user defined error.' do
      expect(diffrence(1.5, 2)).to eq("Error, value not integer")
  end
end
