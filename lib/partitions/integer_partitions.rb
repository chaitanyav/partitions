module Partitions
  module IntegerPartitions
    def partitions
      n = self
      raise ArgumentError, "n should be greater than or equal to 0" if n < 0
      return enum_for(:partitions) unless block_given?
      return yield([]) if n.zero?

      a = Array.new(n + 1, 0)
      k = 2
      a[1] = 0
      a[2] = n

      while k != 1 do
        y = a[k] - 1
        k -= 1
        x = a[k] + 1

        while x <= y do
          a[k] = x
          y -= x
          k += 1
        end

        a[k] = x + y
        yield a.values_at(1..k)
      end
    end
  end
end

class Integer
  include Partitions::IntegerPartitions
end
