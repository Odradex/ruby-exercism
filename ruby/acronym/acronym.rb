=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
    def self.abbreviate(phrase)
        phrase.split(/[ -]/).map { | word | word[0] }.reject { |x| x.nil? }.join.upcase
    end
end

