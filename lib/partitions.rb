require "partitions/version"

module Partitions

  def self.all(n)
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
