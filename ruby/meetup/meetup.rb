=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end
require 'date'
class Meetup
  
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, pos)
    @days = (Date.new(@year, @month, 1)..Date.new(@year, @month, -1)).to_a.select{ |date| date.wday == Date.strptime(day_of_week.to_s, '%A').wday}
    begin
      case pos
      when :first
        @days[0]
      when :second
        @days[1]
      when :third
        @days[2]
      when :fourth
        @days[3] 
      when :fifth
        @days[4]
      when :last
        @days.last
      else
        @days.select{ |date| date.mday in 13..19}.first
      end
    rescue => exception
      return nil
    end
  end
end
