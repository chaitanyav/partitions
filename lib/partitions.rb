require "partitions/version"

module Partitions

  module IntegerPartition
    def partitions
      n = self
      if n < 0
        raise ArgumentError, "n should be greater than or equal to 0"
      end

      a = Array.new(n + 1, 0)
      k = 2
      a[1] = 0
      a[2] = n
      while k != 1 do
        y = a[k] - 1
        k = k - 1
        x = a[k] + 1

        while x <= y do
          a[k] = x
          y = y - x
          k = k  + 1
        end

        a[k] = x + y

        if block_given?
          yield a.values_at(1..k)
        else
          p a.values_at(1..k)
        end
      end
    end
  end
end

class Integer
  include Partitions::IntegerPartition
end
