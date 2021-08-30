=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end
#1. Clear the fied from borders
#2. Iterate through rows
#3. Mark all bombs
class Board
    def Board.transform(input)
        if !(input.all? { |line| (line.size == input[0].size) && ((line.chars.last == line[0]) && (line[0].match /\|||\+/)) && (line.match /^[\+\|\-123456789 *]+$/) })
            raise ArgumentError
        end
        input = input.each_with_index.map { |str| str.chars }
        
        input[1...-1].each_with_index.map do | str, str_i |
            str[1...-1].each_with_index.map do | val, val_i |
                @mines_count = 0
                @mines_count += input[str_i][val_i..val_i+2].select { |v| v == "*"}.count
                @mines_count += input[str_i+1][val_i..val_i+2].select { |v| v == "*"}.count
                @mines_count += input[str_i+2][val_i..val_i+2].select { |v| v == "*"}.count
                
                input[str_i+1][val_i+1] = @mines_count.to_s unless val == "*"
                input[str_i+1][val_i+1] = " " if @mines_count == 0
            end
        end
        return input.map {|line| line.join}
    end 

    # def Board.transform(input)
    #     ret = input.dup
    #     ret.map! do | line |
    #         line.chars.map! do |char|
    #             index = line.chars.find_index char
    #             if ((0..9).include? (char.to_i)) || char == ' '
    #                 char = char.to_i + line.chars[].select {|val| val == '*'}.count
    #             end
    #         end
    #     end
    #     return ret
    # end
    
end