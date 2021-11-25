# frozen_string_literal: true

require 'spec_helper'

describe Rover do
  describe '#new' do
    let!(:rover) { Rover.new('5 5', '1 1 N', 'L') }

    it 'should return proper direction' do
      expect(rover.direction).to eq 'N'
    end

    it 'should return proper position' do
      expect(rover.position).to eq [1, 1]
    end
  end

  describe '#print_info' do
    it 'should not change position' do
      rover = Rover.new('5 5', '0 0 S', 'M')
      expect { rover.print_info }.not_to change { rover.position[1] }
    end

    it 'should not drop rover' do
      rover = Rover.new('5 5', '0 0 N', 'MMMMMMMMMMMMMMMMMMMMMMMM')
      rover.print_info
      expect(rover.position[1]).to eq 5
    end

    it 'should move rover 1 time' do
      rover = Rover.new('5 5', '0 0 N', 'M')
      rover.print_info
      expect(rover.position[1]).to eq 1
    end

    it 'should move rover 3 times' do
      rover = Rover.new('5 5', '0 0 N', 'MMM')
      rover.print_info
      expect(rover.position[1]).to eq 3
    end

    it 'should turn the rover' do
      rover = Rover.new('5 5', '0 0 N', 'RR')
      rover.print_info
      expect(rover.direction).to eq 'S'
    end

    it 'should turn the rover' do
      rover = Rover.new('5 5', '0 0 N', 'MMRRMMRR')
      rover.print_info
      expect(rover.direction).to eq 'N'
      expect(rover.position).to eq [0, 0]
    end

    it 'should turn the rover' do
      rover = Rover.new('5 5', '0 0 N', 'MMRRMMRR')
      rover.print_info
      expect(rover.direction).to eq 'N'
      expect(rover.position).to eq [0, 0]
    end
  end
end
