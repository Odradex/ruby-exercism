=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end
class Queens
  def initialize(positions)
    if !(positions.all? { |key, value| value.all? { |pos| (0..7).cover? pos }})
      raise ArgumentError
    end
    @white_pos = positions[:white]
    @black_pos = positions[:black]
  end


  def attack? 
    (@black_pos[1] == @white_pos[1]) || 
    (@black_pos[0] == @white_pos[0]) || 
    ((@white_pos[0] - @black_pos[0]).abs == (@white_pos[1] - @black_pos[1]).abs)  
  end
end