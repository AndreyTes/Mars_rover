require_relative './rover.rb'

plateau = ARGF.gets
start_position = ARGF.gets
rover_command = ARGF.gets

Rover.new(plateau, start_position, rover_command).print_info
