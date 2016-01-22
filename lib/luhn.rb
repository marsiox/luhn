require 'array'

class Luhn

  class << self

    def checksum(partial_number)
      digits = to_digits(validate_format(partial_number)).reverse

      digits.each_with_index do |d, index|
        if index.even?
          d *= 2
          digits[index] = (d > 9) ? to_digits(d).sum : d
        end
      end

      (digits.sum * 9) % 10
    end

    def valid?(complete_number)
      digits = to_digits(complete_number)
      last = digits.pop
      last == checksum(digits.join)
    end

    private

    def to_digits(number)
      number.to_s.chars.map(&:to_i)
    end

    def validate_format(number)
      str = number.to_s
      raise 'Invalid character' if /[^\d]/.match(str)
      str
    end

  end
end
