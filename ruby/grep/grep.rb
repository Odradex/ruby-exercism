=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end
class Grep
    
    def self.grep (pattern, flags, files)
        ret = ""

        files.each do |file|
            lines = IO.readlines file
            lines.each do |line|
                if line_matches?(line, pattern, flags)
                    if (flags.include? '-l')
                        ret += file + "\n"
                        break
                    end
                    line.prepend((lines.find_index(line)+1).to_s + ':') if flags.include? "-n" 
                    line.prepend(file + ':') if files.count > 1
                    ret += line
                end
            end
        end
        return ret.chomp
    end

    private
    def self.line_matches?(line, pattern, flags)
        #puts "Checking line #{line} for #{pattern} with #{flags.join}"
        # if ((flags.include? '-i') && line.upcase.include?(pattern.upcase))
        #     true
        # end
        if (flags.include? '-i')
            line = line.dup.upcase
            pattern = pattern.dup.upcase
        end
        if ((flags.include? '-x') && (line.chomp != pattern.chomp))
            return false ^ (flags.include? "-v")
        end
        line.include?(pattern) ^ (flags.include? "-v")
    end

end
