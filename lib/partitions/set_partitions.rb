module Partitions
  class SetPartitions
    attr_accessor :k, :m, :n, :size

    def initialize(n, p=nil)
      @n = n
      @k = Array.new(n, 0)
      @m = Array.new(n, 0)
      @p = p
      @size = 0
    end

    def next_partition
      (@n - 1).downto(1) do |i|
        if @k[i] <= @m[i - 1]
          @k[i] = @k[i] + 1
          @m[i] = max(@m[i], @k[i])
          j = i + 1
          while j <= (n - 1) do
            @k[j] = @k[0]
            @m[j] = @m[i]
            j = j + 1
          end
          @size = partition_size
          return @k
        end
      end

      @size = nil
      return
    end

    def previous_partition
      (@n - 1).downto(1) do |i|
        if @k[i] > @k[0]
          @k[i] = @k[i] - 1
          @m[i] = @m[i - 1]
          j = i + 1
          while j <= n - 1 do
            @k[j] = @m[j] = @m[i] + j - i;
            j = j + 1
          end
          @size = partition_size
          return @k
        end
      end

      @size = nil
      return
    end

    def each_partition
      unless block_given?
        raise ArgumentError, "Missing block"
      end
      reinitialize
      yield @k
      (count - 1).times do
        yield next_partition
      end
      reinitialize
    end

    def count
      sum = 0
      (1..n).each do |k|
        sum += sterling_second(@n, k)
      end
      return sum
    end

    private

    def sterling_second(n, k)
      if k == 1 || k == n
        return 1
      else
        return sterling_second(n - 1, k - 1) + k * sterling_second(n - 1, k)
      end
    end

    def partition_size
      @m[n - 1] - @m[0] + 1
    end

    def reinitialize
      @k = Array.new(n, 0)
      @m = Array.new(n, 0)
      @size = 0
    end

    def max a, b
      return (a < b) ? b : a
    end

  end
end
